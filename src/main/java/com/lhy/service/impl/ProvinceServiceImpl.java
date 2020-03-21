package com.lhy.service.impl;

import com.lhy.dao.ProvinceMapper;
import com.lhy.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProvinceServiceImpl implements ProvinceService {

    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<Map<String, Object>> selectAllProvinces() {
        return provinceMapper.selectAllProvinces();
    }
}
