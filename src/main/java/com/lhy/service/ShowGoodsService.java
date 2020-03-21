package com.lhy.service;

import com.lhy.pojo.PageBean;

import java.util.List;
import java.util.Map;

public interface ShowGoodsService {
//    List<Map<String, String>> indexFindAllGoods();
    PageBean<Map<String, Object>> findByPaging(Integer page);
    List<Map<String,String>> showGoodsDetail(Integer gid);
}
