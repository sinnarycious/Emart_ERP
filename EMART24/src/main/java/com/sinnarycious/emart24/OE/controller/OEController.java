package com.sinnarycious.emart24.OE.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sinnarycious.emart24.OE.model.service.OEService;
import com.sinnarycious.emart24.OE.model.vo.OE;

@Controller
public class OEController {

	@Autowired
	OEService OEService;
	

	
	// 검색 리스트
	@RequestMapping("/OE/searchList.do")
	public String searchList() {
		
		
		
		return "";
	}

	
	
	/* 조회 기능 */
	@RequestMapping("/OE/search.do")
	public String search(
			@RequestParam Date orderDate1,
			@RequestParam Date orderDate2,
			@RequestParam int oeNo,
			@RequestParam String oeName,
			Model model
			) {
		
		
		
		return null;
		
	}
}
