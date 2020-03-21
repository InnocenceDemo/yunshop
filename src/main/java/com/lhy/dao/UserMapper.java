package com.lhy.dao;

import com.lhy.pojo.User;

import java.util.Map;

public interface UserMapper {
    int checkReg(String phone);
    //注册用户
    int reg(User user);
    User login(Map<String,String> map);
}
