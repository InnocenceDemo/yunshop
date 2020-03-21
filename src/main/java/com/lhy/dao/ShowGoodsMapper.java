package com.lhy.dao;

import java.util.List;
import java.util.Map;

public interface ShowGoodsMapper {
    Integer indexFindAllGoods();
    List<Map<String,Object>> findByPaging(Map map);
    List<Map<String,String>> showGoodsDetail(Integer gid);
}
