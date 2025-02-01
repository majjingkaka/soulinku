package com.webbible.soulinku.dto;

import com.webbible.soulinku.domain.UserRoleType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
    
    private String userId;
    private String userNm;
    private String password;
    private String nickNm;
    private UserRoleType userRlTy;



}
