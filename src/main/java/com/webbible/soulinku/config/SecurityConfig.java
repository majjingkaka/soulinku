package com.webbible.soulinku.config;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;

import com.webbible.soulinku.domain.UserRoleType;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public RoleHierarchy roleHierarchy(){
        return RoleHierarchyImpl.withRolePrefix("ROLE_")
        .role(UserRoleType.ADMIN.toString()).implies(UserRoleType.USER.toString())
        .build();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        //csrf 보안해제(개발환경에서 설정시 복잡성)
        //https://www.youtube.com/watch?v=lv3zXFzx0mU&list=PLJkjrxxiBSFBoe1dl1fsNcX1p3EOiVywt&index=8
        //https://www.youtube.com/watch?v=VOrA9Dfn3vY&list=PLJkjrxxiBSFBoe1dl1fsNcX1p3EOiVywt&index=5

        
        http
                .csrf(csrf -> csrf.disable());

        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/user/join").permitAll()
                        .requestMatchers("/user/update").hasRole("USER")
                        .requestMatchers("/**").permitAll()
                        );

        http
                .formLogin(Customizer.withDefaults());

        return http.build();
    }


    @Bean
    public HttpFirewall allowUrlEncodedDoubleSlashHttpFirewall() {
        StrictHttpFirewall firewall = new StrictHttpFirewall();
        firewall.setAllowUrlEncodedDoubleSlash(true);
        return firewall;
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.httpFirewall(allowUrlEncodedDoubleSlashHttpFirewall())
            .ignoring()
            .requestMatchers(PathRequest.toStaticResources().atCommonLocations());
            
    }


}