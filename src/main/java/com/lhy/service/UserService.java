package com.lhy.service;

import com.lhy.pojo.User;

import java.util.Map;

public interface UserService {
    //检查是否被注册
    int checkReg(String phone);
    int reg(User user);
    User login(Map<String,String> map);
}
