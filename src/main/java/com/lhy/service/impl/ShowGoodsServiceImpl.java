package com.lhy.service.impl;

import com.lhy.dao.ShowGoodsMapper;
import com.lhy.pojo.PageBean;
import com.lhy.service.ShowGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShowGoodsServiceImpl implements ShowGoodsService {


    @Autowired
    private ShowGoodsMapper showGoodsMapper;
    @Override
    public PageBean<Map<String, Object>> findByPaging(Integer currPage) {
        PageBean<Map<String, Object>> pageBean = new PageBean();
        //封装当前页数
        pageBean.setCurrPage(currPage);
        //封装每页显示的记录数
        int pageSize = 90;
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount = showGoodsMapper.indexFindAllGoods();
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/pageSize);
        pageBean.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin = (currPage-1) * pageSize;
        Map map = new HashMap();
        map.put("begin", begin);
        map.put("pageSize", pageSize);
        List<Map<String, Object>> tasks = showGoodsMapper.findByPaging(map);
        pageBean.setList(tasks);
        return pageBean;
    }

    @Override
    public List<Map<String, String>> showGoodsDetail(Integer gid) {
        return showGoodsMapper.showGoodsDetail(gid);
    }
}
