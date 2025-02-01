package com.webbible.soulinku.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webbible.soulinku.domain.UserRoleType;
import com.webbible.soulinku.dto.UserDto;
import com.webbible.soulinku.mapper.UserMapper;

@Service
public class UserService implements UserDetailsService {
    
    @Autowired
    UserMapper userMapper;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    //private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Transactional
    public void createOneUser(UserDto userDto){
        String userId = userDto.getUserId();
        String password = userDto.getPassword();
        //String nickNm = userDto.getNickNm();

        if(userMapper.existsByUserId(userId)){
            return;
        }

        userDto.setPassword(bCryptPasswordEncoder.encode(password));
        userDto.setUserRlTy(UserRoleType.USER);
        userMapper.userIdSave(userDto);

    }

    @Transactional(readOnly = true)
    public UserDto readOneUser(String userId){

        UserDto userDto = userMapper.findByUserId(userId);
        return userDto;
    }


    @Transactional(readOnly = true)
    public List<UserDto> readAllUser(){
        List<UserDto> readAllUser = userMapper.readAllUser();
        return readAllUser;
    }

    @Transactional
    public void updateOneUser(UserDto userDto, String userId){
        
        UserDto targetUserDto = userMapper.findByUserId(userId);
        if(userDto.getPassword() != null && !userDto.getPassword().isEmpty()){
            targetUserDto.setPassword(bCryptPasswordEncoder.encode(userDto.getPassword()));
        }

        if(userDto.getNickNm() != null && !userDto.getNickNm().isEmpty()){
            targetUserDto.setNickNm(userDto.getNickNm());
        }

        userMapper.updateOneUser(targetUserDto);

    }

    @Transactional
    public void deleteOneUser(String userId){
        userMapper.deleteOneUser(userId);
    }
    
    
    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException{

        UserDto userDto = userMapper.findByUserId(userId);
        return User.builder()
                .username(userDto.getUserId())
                .password(userDto.getPassword())
                .roles(userDto.getUserRlTy().toString())
                .build();
    }



    @Transactional
    public Boolean isAccess(String userId){

        String sessionUserName = SecurityContextHolder.getContext().getAuthentication().getName();
        String sessionRole = SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next().getAuthority();

        if("ROLE_ADMIN".equals(sessionRole)){
            return true;
        }

        if(userId.equals(sessionUserName)){
            return true;
        }
        
        return false;
    }



}
