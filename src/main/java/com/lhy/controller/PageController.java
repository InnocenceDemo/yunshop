package com.lhy.controller;

import com.lhy.service.ShoppingCarService;
import com.lhy.service.ShowGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
//@RequestMapping("/page")
public class PageController {

    @Autowired
    private ShoppingCarService shoppingCarService;
    @Autowired
    private ShowGoodsService showGoodsService;
    /* 首页点击商品添加购物车 */
    @RequestMapping("/addCar")
    public void addCar(@RequestParam Integer uid, @RequestParam Integer goodsid, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map map = new HashMap();
        map.put("uid",uid);
        map.put("gid",goodsid);
        /* 判断购物车中是否有相同的商品，如果有则buycounty叠加，反之添加 */
        Integer buycount = shoppingCarService.equalsGoods(map);
        if (buycount != null){
            int count = buycount + 1;
            map.put("count",count);
            shoppingCarService.alertShoppingCarCount(map);
        }else{
            shoppingCarService.addGoodsToCar(map);
        }
        request.getRequestDispatcher("/yunshop/index").forward(request,response);
    }

    /* 首页点击图片显示商品详细信息 */
    @RequestMapping("/showGoodsDetail")
    public String showGoodsDetail(@RequestParam Integer gid,HttpServletRequest request){
        List<Map<String,String>> goodsDetailList = showGoodsService.showGoodsDetail(gid);
        request.setAttribute("goodsDetailList",goodsDetailList);
        System.out.println(goodsDetailList);
        return "showgoods";
    }


}
