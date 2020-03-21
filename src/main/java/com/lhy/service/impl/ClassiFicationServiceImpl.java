package com.lhy.service.impl;

import com.lhy.dao.ClassiFicationMapper;
import com.lhy.pojo.FirstDir;
import com.lhy.service.ClassiFicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ClassiFicationServiceImpl implements ClassiFicationService{

    @Autowired
    private ClassiFicationMapper classiFicationMapper;

    /* 查找所有以及分类 */
    @Override
    public List<Map<String,String>> findFirstClassiFication() {
        return classiFicationMapper.findFirstClassiFication();
    }

    @Override
    public List<Map> findSecondDir(String firstDirId) {
        return classiFicationMapper.findSecondDir(firstDirId);
    }

    @Override
    public List<Map> findthreeThreeDir(String twoDirId) {
        return classiFicationMapper.findthreeThreeDir(twoDirId);
    }
}
