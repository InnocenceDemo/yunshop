package com.lhy.dao;

import java.util.List;
import java.util.Map;

public interface CityMapper {

    List<Map<String, Object>> selectAllCitys();
    List<Map> findCitys(String provinceid);
    List<Map> findCounty(String citycode);
    String findCountyName(String countycode);
}
