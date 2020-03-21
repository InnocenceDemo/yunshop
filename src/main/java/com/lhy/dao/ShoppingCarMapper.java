package com.lhy.dao;

import java.util.List;
import java.util.Map;

public interface ShoppingCarMapper {
    Integer findCount(Integer userId);
    List<Map<String,String>> shoppingCar(Integer userId);
    List<Map<String,String>> findShoppingCarMsg(List list);
    Integer delFromBuymsg(Integer bid);
    Integer addGoodsToCar(Map map);
    Integer equalsGoods(Map map);
    Integer alertShoppingCarCount(Map map);
}
