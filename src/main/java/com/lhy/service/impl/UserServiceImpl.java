package com.lhy.service.impl;

import com.lhy.dao.UserMapper;
import com.lhy.pojo.User;
import com.lhy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    @Override
    public int checkReg(String uphone) {
        int i = userMapper.checkReg(uphone);
        return i;
    }

    @Override
    public int reg(User user) {
        int i = userMapper.reg(user);
        return i;
    }

    @Override
    public User login(Map<String, String> map) {
        User user = userMapper.login(map);
        return user;
    }

}
