package com.lhy.service;

import com.lhy.pojo.FirstDir;

import java.util.List;
import java.util.Map;

public interface ClassiFicationService {
    List<Map<String,String>> findFirstClassiFication();
    List<Map> findSecondDir(String firstDirId);
    List<Map> findthreeThreeDir(String twoDirId);
}
