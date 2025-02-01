package com.webbible.soulinku;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;


//@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
//(scanBasePackages={"com.webbible.soulinku.mapper"})
@SpringBootApplication
public class SoulinkuApplication{

	public static void main(String[] args) {
		SpringApplication.run(SoulinkuApplication.class, args);
	}
	

}
