package com.sinnarycious.emart24.event.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sinnarycious.emart24.common.SearchUtils;
import com.sinnarycious.emart24.common.Utils;
import com.sinnarycious.emart24.event.model.service.EventService;
import com.sinnarycious.emart24.event.model.vo.Event;

@Controller
public class EventController {
	
	@Autowired
    EventService eventService;
 
    @RequestMapping("/event/eventPage.do")
	public String event(
			@RequestParam( required=false, defaultValue="1") int cPage,
			Model model
			) {
		
		int numPerPage = 10;		
		List<Map<String, String>> list = eventService.selectEventList(cPage, numPerPage);
		
		int totalContents = eventService.selectEventTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "eventPage.do");
		
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "eventPage";
		
	}
    
	@RequestMapping("/event/searchInfo.do")
	@ResponseBody
	public Map<String, Object> searchInfo(
			@RequestParam (required=false)Date evntDateS1,
			@RequestParam (required=false)Date evntDateS2,
			@RequestParam (required=false)String evntTitle,
			@RequestParam (required=false, defaultValue="0") int evntNo 
			){
		System.out.println(evntDateS1);
		
		Map<String, Object> map = new HashMap<String, Object>();
		evntTitle.replace('_', ' ');
		
		List<Event> searchList = eventService.searchInfo(evntDateS1, evntDateS2, evntTitle, evntNo);
		String pageBar = SearchUtils.getPageBar(searchList.size(), 1, 10, "eventPage.do", evntTitle);
		
		System.out.println("search : " + searchList);
		
		map.put("search", searchList);
		map.put("paging", pageBar);
		
		return map;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
	    final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    final CustomDateEditor dateEditor = new CustomDateEditor(df, true) {
	        @Override
	        public void setAsText(String text) throws IllegalArgumentException {
	            if ("today".equals(text)) {
	                setValue(new java.util.Date());
	            } else {
	                super.setAsText(text);
	            }
	        }
	    };
	    binder.registerCustomEditor(Date.class, dateEditor);
	}
    
   
}