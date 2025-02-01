package com.webbible.soulinku.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.webbible.soulinku.dto.UserDto;
import com.webbible.soulinku.service.UserService;

@Controller
public class UserController {
    
    @Autowired
    UserService userService;



    // 회원 가입 : 페이지 응답
    @GetMapping("/user/join")
    public String joinPage() {

        return "user/userJoin";
    }

    // 회원 가입 : 수행
    @PostMapping("/user/join")
    public String joinProcess(UserDto userDto) {

        userService.createOneUser(userDto);
        
        return "redirect:/login";
    }


    // 회원 수정 : 페이지 응답
    @GetMapping("/user/update/{userId}")
    public String updatePage(@PathVariable("userId") String userId, Model model) {

        // 본인 또는 ADMIN 권한만 접근 가능
        if (userService.isAccess(userId)) {
            UserDto userDto = userService.readOneUser(userId);
            model.addAttribute("USER", userDto);
            return "user/userUpdate";
        }

        return "redirect:/login";
    }

    // 회원 수정 : 수행
    @PostMapping("/user/update/{userId}")
    public String updateProcess(@PathVariable String userId, UserDto userDto) {

        // 본인 또는 ADMIN 권한만 접근 가능
        if (userService.isAccess(userId)) {
            userService.updateOneUser(userDto, userId);
        }

        return "redirect:/user/update/" + userId;
    }


}
