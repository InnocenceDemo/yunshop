package com.lhy.service.impl;

import com.lhy.dao.ShoppingCarMapper;
import com.lhy.service.ShoppingCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ShoppingCarServiceImpl implements ShoppingCarService{

    @Autowired
    private ShoppingCarMapper shoppingCar;

    @Override
    public List shoppingCar(Integer userId) {
        return shoppingCar.shoppingCar(userId);
    }

    @Override
    public Integer findCount(Integer userId) {
        return shoppingCar.findCount(userId);
    }

    @Override
    public List<Map<String,String>> findShoppingCarMsg(List list) {
        return shoppingCar.findShoppingCarMsg(list);
    }

    @Override
    public Integer delFromBuymsg(Integer bid) {
        return shoppingCar.delFromBuymsg(bid);
    }

    @Override
    public Integer addGoodsToCar(Map map) {
        map.put("count",1);
        return shoppingCar.addGoodsToCar(map);
    }

    @Override
    public Integer equalsGoods(Map map) {
        return shoppingCar.equalsGoods(map);
    }

    @Override
    public Integer alertShoppingCarCount(Map map) {
        return shoppingCar.alertShoppingCarCount(map);
    }

    @Override
    public Integer submitMsgToShoppingCar(Map map) {
        Integer num = shoppingCar.equalsGoods(map);
        if (num != null){
            return shoppingCar.alertShoppingCarCount(map);
        }else{
            return shoppingCar.addGoodsToCar(map);
        }
    }
}
