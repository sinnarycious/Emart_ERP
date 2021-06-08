package com.sinnarycious.emart24.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sinnarycious.emart24.main.model.service.mainService;

@Controller
public class mainController {

	@Autowired
	mainService mainService;
	
	@RequestMapping("/main/main.do")
	public String main() {
		System.out.println("/main/main.do가 호출되었습니다.");
		
		return "main";
	}
	
}
