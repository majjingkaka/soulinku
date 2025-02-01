package com.webbible.soulinku.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webbible.soulinku.dto.MainDto;
import com.webbible.soulinku.mapper.MainMapper;

@Service
public class MainService {
    //https://frozenpond.tistory.com/85
    
    @Autowired
    MainMapper mainMapper;

    public List<MainDto> selectMainAll(){
        return mainMapper.selectMainAll();
    }
}
