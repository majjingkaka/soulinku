package com.webbible.soulinku.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webbible.soulinku.dto.BibleDto;

@Mapper
public interface BibleSearchMapper {
    List<Map<String, Object>> selectBibleBookAfList(Object param);
    List<Map<String, Object>> selectBibleBookOrdrList(Object param);
    List<Map<String, Object>> selectBibleSearchList(BibleDto bibleDto);
    
}
