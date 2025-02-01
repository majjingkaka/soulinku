package com.webbible.soulinku.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webbible.soulinku.dto.BibleDto;
import com.webbible.soulinku.mapper.BibleSearchMapper;

@Service
public class BibleSearchService {
    @Autowired
    BibleSearchMapper bibleSearchMapper;

    public List<Map<String, Object>> selectBibleBookAfList(Object param){
        return bibleSearchMapper.selectBibleBookAfList(param);
    }

    public List<Map<String, Object>> selectBibleBookOrdrList(Object param){
        return bibleSearchMapper.selectBibleBookOrdrList(param);
    }

    public List<Map<String, Object>> selectBibleSearchList(BibleDto bibleDto){
        return bibleSearchMapper.selectBibleSearchList(bibleDto);
    }
}
