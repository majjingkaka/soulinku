package com.webbible.soulinku.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.webbible.soulinku.dto.MainDto;
import com.webbible.soulinku.service.MainService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class MainController {
    
	

	@Autowired
	MainService mainService;

    @RequestMapping("/")
	public ModelAndView index() {
		log.info("Info level log message / 정보 메세지 예시");
		log.error("Error level log message / 오류 메세지 예시");

		List<MainDto> rs = mainService.selectMainAll();
		//int index = 0 ;
		for(MainDto v : rs){
			
			log.info(v.getMainM2());
			
			//index++;
		}

		


		



		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
}
