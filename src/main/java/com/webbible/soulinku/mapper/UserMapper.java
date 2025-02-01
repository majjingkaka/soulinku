package com.webbible.soulinku.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webbible.soulinku.dto.UserDto;

//https://marshmello.tistory.com/8
@Mapper
public interface UserMapper {
    boolean existsByUserId(String userId);
    void userIdSave(UserDto userDto);
    UserDto findByUserId(String userId);
    List<UserDto> readAllUser();
    void updateOneUser(UserDto userDto);
    void deleteOneUser(String userId);
}
