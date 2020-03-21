package com.lhy.controller;

import com.lhy.pojo.FirstDir;
import com.lhy.pojo.PageBean;
import com.lhy.pojo.User;
import com.lhy.service.*;
import com.lhy.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.alibaba.fastjson.JSON;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *   @author owner
 *   实现注册登录以及城市选择功能
 */
@Controller
@RequestMapping("/yunshop")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private CityService cityService;
    @Autowired
    private ShoppingCarService shoppingCarService;
    @Autowired
    private ShowGoodsService showGoodsService;
    @Autowired
    private ClassiFicationService classiFicationService;


    /*首页*/
    @RequestMapping("/index")
    public String index(HttpServletResponse response, HttpServletRequest request, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "1") Integer currPage){
        /*获取分类信息*/
        List<Map<String,String>> firstDirs = classiFicationService.findFirstClassiFication();
        request.setAttribute("firstDirs",firstDirs);
        /* 获取商品图片、价格、商品名称 */
        PageBean<Map<String, Object>> pageBean = showGoodsService.findByPaging(page);
        List<Map<String, Object>> goods = pageBean.getList();
        if (goods.size() != 0) {
            request.setAttribute("goods", goods);
        } else {
            request.setAttribute("msg", "抱歉，该城市目前没有待接任务！");
        }
        request.setAttribute("pageBean", pageBean);
        return "index";
    }

    /*登录*/
    @RequestMapping("/login")
    public String login(HttpServletRequest request, User user){
        if (user.getUphone()!=null){
            //获取用户名存入userid和phone中和密码转md5格式
            Map<String,String> map = new HashMap<>();
            //登录成功、登录失败（用户名不存在跳转到注册界面、密码不正确跳转到登录界面）
            //对密码加密后的密文
            String pwd = MD5.getMD5(user.getPassword());
            map.put("uphone",user.getUphone());
            map.put("password",pwd);
            User user1 = userService.login(map);
            //登录失败
            if (user1 == null){
                return "login";
            }else {
                //登陆成功
                request.getSession().setAttribute("login_user", user1);
                return "redirect:/yunshop/index";
            }
        }
        return "login";
    }

    /*注销*/
    @RequestMapping(value = "/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        request.getRequestDispatcher("/yunshop/index").forward(request, response);
    }
    /*注册*/
    @RequestMapping("/reg")
    public String reg(HttpServletRequest request, User user){
        //转到reg.jsp页面(此处有待优化)
        if (user.getUphone()!=null){
            int i = userService.checkReg(user.getUphone());
            //未被注册（注册成功、注册失败）、已被注册
            if (i == 0){
                //未注册
                /*获取前端传递的参数方式：1、方法参数使用对应的pojo，如User user
                                      2、方法参数中使用对应的name名字，如String uname
                                      3、方法体中使用request.getParameter("uname")*/
                String idcard = user.getIdcard();
                user.setPassword(MD5.getMD5(user.getPassword()));
                //采用身份证获取出当前年龄和性别
                //密码采用MD加密方式进行加密: MD5.getMD5(pwd)
                //计算年龄
                if (idcard!=null){
                    HashMap<String,String> map = IdNOToAge(idcard);
                    String sex = map.get("sex");
                    user.setSex(sex);
                    String birthday = map.get("birthday");
                    user.setBirthday(birthday);
                    request.setAttribute("map", map);
                }else{
                    user.setSex("");
                }
                int row = userService.reg(user);
                if (row != 0){
                    //注册成功
                    return "login";
                }else{
                    request.setAttribute("msg","注册失败，请重新尝试");
                    return "reg";
                }
            }
            request.setAttribute("msg","手机号已被注册");
            return "reg";
        }else{
            return "reg";
        }
    }

    /*切换城市*/
    @RequestMapping(value = "/changecity")
    public String goChangeCity(Model model, HttpServletRequest request){
        List<Map<String, Object>> provinces = provinceService.selectAllProvinces();
        model.addAttribute("provinces", provinces);
        return "changecity";
    }

    /* Ajax处理方法 */
    @RequestMapping(value = "/findCity")
    public void findCity(HttpServletResponse response,Integer provinceid) throws IOException {
        List<Map> citys = cityService.findCity(String.valueOf(provinceid));
        Map map = new HashMap();
        map.put("citys", citys);
        //将map转化成json
        response.getWriter().write(JSON.toJSONString(map));
    }

    @RequestMapping(value = "/findCounty")
    public void findCounty(HttpServletResponse response, Integer citycode) throws IOException {
        List<Map> countys = cityService.findCounty(String.valueOf(citycode));
        Map map = new HashMap();
        map.put("countys", countys);
        //将map转化成json
        response.getWriter().write(JSON.toJSONString(map));
    }

    /*  url中包含需要使用的信息处理方法  城市选择*/
    @RequestMapping(value = "/index/{countycode}")
    public String indexAddress(HttpServletRequest request, @PathVariable Integer countycode){
        String countyname = cityService.findCountyName(String.valueOf(countycode));
        request.getSession().setAttribute("county",countyname);
        return "redirect:/yunshop/index";
    }

    /* 点击购物车，跳转页面 */
    @RequestMapping(value = "/{id}/cartShow")
    public String cartShow(HttpServletRequest request, @PathVariable Integer id){
        List gid = shoppingCarService.shoppingCar(id);
        Integer count = shoppingCarService.findCount(id);
        request.setAttribute("count",count);
        if (count != 0){
            List<Map<String,String>> list= shoppingCarService.findShoppingCarMsg(gid);
            request.setAttribute("list",list);
        }
        return "shoppingcar";
    }

    /* 商品详细信息中点击添加购物车，实现添加功能并且重定向到购物车功能 */
    @RequestMapping(value = "/{id}/addGoodsToCar")
    public String addGoodsToCar(@PathVariable Integer id, @RequestParam Integer count, @RequestParam Integer gid, HttpServletRequest request){
        Map map = new HashMap();
        map.put("uid",id);
        map.put("count",count);
        map.put("gid",gid);
        Integer i = shoppingCarService.submitMsgToShoppingCar(map);
        /* 重定向到购物车 */
        return "redirect:/yunshop/"+id+"/cartShow";
    }

    /* 通过购物车中id值，移除购物车中单个商品 */
    @RequestMapping(value = "/{bid}")
    public String delFromShoppingCar(HttpServletRequest request, @PathVariable Integer bid){
        Integer num = shoppingCarService.delFromBuymsg(bid);
        if (num==1){
            return "redirect:/yunshop/"+bid+"/cartShow";
        }
        request.setAttribute("msg","删除失败");
        return "shoppingcar";
    }

    /* ajax 查找二级目录 */
    @RequestMapping(value = "/findSecondDir")
    public void findSecondDir(HttpServletResponse response,Integer firstDirId) throws IOException {
        List<Map> secondDirList = classiFicationService.findSecondDir(String.valueOf(firstDirId));
        Map map = new HashMap();
        map.put("secondDirList", secondDirList);
        //将map转化成json
        response.getWriter().write(JSON.toJSONString(map));
    }

    /* ajax 查找三级目录 */
    @RequestMapping(value = "/findThreeDir")
    public void findThreeDir(HttpServletResponse response,Integer twoDirId) throws IOException {
        List<Map> threeDirList = classiFicationService.findthreeThreeDir(String.valueOf(twoDirId));
        Map map = new HashMap();
        map.put("threeDirList", threeDirList);
        //将map转化成json
        System.out.println(JSON.toJSONString(map));
        response.getWriter().write(JSON.toJSONString(map));
    }


    //根据身份证号输出年龄
    public static HashMap IdNOToAge(String IdNO){
        Integer leh = IdNO.length();
        String dates="";
        HashMap<String, String> map = new HashMap<>();
        if (leh == 18) {
            Integer se = Integer.valueOf(IdNO.substring(leh - 1)) % 2;
            dates = IdNO.substring(6, 10);
            SimpleDateFormat df = new SimpleDateFormat("yyyy");
            //性别
            String sex = Integer.parseInt(IdNO.substring(16, 17)) % 2 == 0?"0":"1";   /*女0  男1*/
            //出生日期
            String birthday = IdNO.substring(6, 14);
            map.put("sex", sex);
            map.put("birthday", birthday);
            return map;
        }else{
            dates = IdNO.substring(6, 8);
            map.put("dates",dates);
            return map;
        }
    }

}
