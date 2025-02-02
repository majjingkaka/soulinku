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

    //Object param
    public List<Map<String, Object>> selectBibleBookAfList(BibleDto bibleDto){
        return bibleSearchMapper.selectBibleBookAfList(bibleDto);
    }

    public List<Map<String, Object>> selectBibleBookOrdrList(BibleDto bibleDto){
        return bibleSearchMapper.selectBibleBookOrdrList(bibleDto);
    }

    public List<Map<String, Object>> selectBibleSearchList(BibleDto bibleDto){
        return bibleSearchMapper.selectBibleSearchList(bibleDto);
    }

    public List<Map<String, Object>> selectBibleSearchJangCt(BibleDto bibleDto){
        return bibleSearchMapper.selectBibleSearchJangCt(bibleDto);
    }


}
