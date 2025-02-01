package com.webbible.soulinku.domain;

public enum UserRoleType {
    
    ADMIN("관리자"),
    USER("사용자");

    @SuppressWarnings("unused")
    private final String desc;

    UserRoleType(String desc){
        this.desc = desc;
    }

}
