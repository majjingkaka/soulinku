package com.webbible.soulinku.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webbible.soulinku.dto.BibleDto;

@Mapper
public interface BibleSearchMapper {
    //Object param
    List<Map<String, Object>> selectBibleBookAfList(BibleDto bibleDto);
    List<Map<String, Object>> selectBibleBookOrdrList(BibleDto bibleDto);
    List<Map<String, Object>> selectBibleSearchList(BibleDto bibleDto);
    List<Map<String, Object>> selectBibleSearchJangCt(BibleDto bibleDto);
    
}
