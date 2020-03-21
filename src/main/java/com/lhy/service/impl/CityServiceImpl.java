package com.lhy.service.impl;


import com.lhy.dao.CityMapper;
import com.lhy.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private CityMapper cityMapper;


    @Override
    public List<Map<String, Object>> selectAllCitys() {
        return cityMapper.selectAllCitys();
    }

    @Override
    public List<Map> findCity(String provinceid) {
        List<Map> citys = cityMapper.findCitys(provinceid);
        return citys;
    }

    @Override
    public List<Map> findCounty(String citycode) {
        List<Map> countys = cityMapper.findCounty(citycode);
        return countys;
    }

    @Override
    public String findCountyName(String countycode) {
        String countyName = cityMapper.findCountyName(countycode);
        return countyName;
    }

}
