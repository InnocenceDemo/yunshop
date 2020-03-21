package com.lhy.dao;

import java.util.List;
import java.util.Map;

public interface ClassiFicationMapper {
    List<Map<String,String>> findFirstClassiFication();
    List<Map> findSecondDir(String firstDirId);
    List<Map> findthreeThreeDir(String twoDirId);
}
