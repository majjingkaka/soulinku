package com.webbible.soulinku.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.webbible.soulinku.dto.BibleDto;
import com.webbible.soulinku.service.BibleSearchService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BibleSearchController {
    
    @Autowired
	BibleSearchService bibleSearchService;

    @RequestMapping("/bible/bibleSearch/list.do")
	public String list(HttpServletRequest request
		, HttpServletResponse response
		, ModelMap model
		) {
            log.info("BibleSearchController list call...");

            Map<String, Object> param = new HashMap<>();
            List<Map<String, Object>> selectBibleBookAfList = bibleSearchService.selectBibleBookAfList(param);
            model.addAttribute("selectBibleBookAfList", selectBibleBookAfList);
            
            param.put("bookAf", "A");
            List<Map<String, Object>> selectBibleBookOrdrList = bibleSearchService.selectBibleBookOrdrList(param);
            model.addAttribute("selectBibleBookOrdrList", selectBibleBookOrdrList);

            return "bible/bibleSearch/list";
            
    }
    
    @ResponseBody
	@RequestMapping(value = "/bible/bookOrdrListChange.do" )
	public ModelAndView bookOrdrListChange(
			//@RequestBody HashMap<String, Object> map
			HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model
			, @RequestParam(value = "bookAf", defaultValue = "A") String bookAf
			) {
                log.info("BibleSearchController bookOrdrListChange call...");
		
		Map<String, Object> param = new HashMap<>();
		param.put("bookAf", bookAf);
		
		//List<EgovMap> selectBibleBookOrdrList = commonSqlDao.selectList("BibleMainDAO.selectBibleBookOrdrList",param);
        List<Map<String, Object>> selectBibleBookOrdrList = bibleSearchService.selectBibleBookOrdrList(param);
		model.put("selectBibleBookOrdrList", selectBibleBookOrdrList);
		
		//log.debug(map.toString());
		log.info(bookAf);
		
		//model.put("result", "1111");
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("selectBibleBookOrdrList", selectBibleBookOrdrList);
		//mav.addObject("paginationInfo", paginationInfo);
		
		return mav;
	}
    
    //https://cornswrold.tistory.com/316
	@ResponseBody
	@RequestMapping(value = "/bible/bibleSearch.do" )
	public ModelAndView bibleSearch(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model
			, @RequestBody BibleDto bibleDto){
		
		log.debug("BibleSearchController bibleSearch call...");
		
		log.debug(bibleDto.toString());
		ModelAndView mav = new ModelAndView("jsonView");
		
		
		try {
			//List<EgovMap> selectBibleBookAfList = commonSqlDao.selectList("BibleMainDAO.selectBibleBookAfList",bibleVo);
			//model.addAttribute("selectBibleBookAfList", selectBibleBookAfList);
			
			//List<EgovMap> selectBibleBookOrdrList = commonSqlDao.selectList("BibleMainDAO.selectBibleBookOrdrList",bibleVo);
			//model.addAttribute("selectBibleBookOrdrList", selectBibleBookOrdrList);
			
			//List<Map<String, Object>> selectBibleList = commonSqlDao.selectList("BibleMainDAO.selectBibleList2",bibleVo);
            List<Map<String, Object>> selectBibleSearchList = bibleSearchService.selectBibleSearchList(bibleDto);
			model.addAttribute("selectBibleSearchList", selectBibleSearchList);
			
			
			mav.addObject("selectBibleSearchList", selectBibleSearchList);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return mav;
		
	}

}
