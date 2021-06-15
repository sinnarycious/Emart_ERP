package com.sinnarycious.emart24.OE.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	OEService oeService;
	
	/* 입고 관리 이동 */
	@RequestMapping("/OE/oe.do")
	public String oe(Model model) {
		System.out.println("/common/oe.do가 호출되었습니다.");
		
		List<OE> list = oeService.selectOEList();
		
		System.out.println("selectOE [list] : " + list);
		
		model.addAttribute("list", list);
		
		return "oe";
	}

	
	// 검색 리스트
	@RequestMapping("/OE/searchList.do")
	public String searchList() {
		
		
		
		
		return "";
	}
	
	
	// 발주 다시 작성
	@RequestMapping("/OE/resetList.do")
	public String resetList(@RequestParam int oeNo,
							HttpServletRequest req, Model model) {
		
		int result = oeService.resetList(oeNo);
		
		String loc = "";
		String msg = "";
		
		if (result > 0) {
			
		}
		
		
		
		return "common/msg";
	}
	
	
	/* 조회 기능 */
	@RequestMapping("/OE/search.do")
	public String search(
			@RequestParam Date orderDate1,
			@RequestParam Date orderDate2,
			@RequestParam int oeNo,
			@RequestParam String oeName
			) {
		
		
		
		return null;
		
	}
	


}
