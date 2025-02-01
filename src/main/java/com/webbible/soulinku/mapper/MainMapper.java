package com.webbible.soulinku.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webbible.soulinku.dto.MainDto;

//https://marshmello.tistory.com/8
@Mapper
public interface MainMapper {
    List<MainDto> selectMainAll();
}
