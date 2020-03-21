package com.lhy.service;

import java.util.List;
import java.util.Map;

public interface ShoppingCarService {
    List shoppingCar(Integer userId);//获取某用户购物车中的所有商品id
    Integer findCount(Integer userId);//统计购物车中的商品数量
    List<Map<String,String>> findShoppingCarMsg(List list);//获取购物车中的信息
    Integer delFromBuymsg(Integer bid);//购物车表中，删除单个商品
    Integer equalsGoods(Map map);//判断是否存在相同商品，如果有则取出购买数量
    Integer addGoodsToCar(Map map);//主页中，添加购物车时，判断购物车中是否有商品，没有则添加信息到购物车
    Integer alertShoppingCarCount(Map map);//有则修改商品购买数量
    Integer submitMsgToShoppingCar(Map map);//判断是否购物车中对应的商品为空
}
