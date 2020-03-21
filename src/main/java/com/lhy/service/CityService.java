package com.lhy.service;

import java.util.List;
import java.util.Map;

public interface CityService {

    List<Map<String,Object>> selectAllCitys();
    List<Map> findCity(String provinceid);
    List<Map> findCounty(String citycode);
    String findCountyName(String countycode);
}
