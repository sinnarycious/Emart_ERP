package com.sinnarycious.emart24.OE.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sinnarycious.emart24.OE.model.service.OEService;
import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.common.Utils;

@Controller
public class OEController {

	@Autowired
	OEService oeService;
	
	/* 입고 관리 이동 (페이지) */
	@RequestMapping("/OE/oe.do")
	public String oe(
			@RequestParam( required=false, defaultValue="1") int cPage,
			Model model
			) {

		int numPerPage = 10;
		List<Map<String, String>> list = oeService.selectOEList(cPage, numPerPage);
		
		int totalContents = oeService.selectOETotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "oe.do");
		
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "oe";
	}
	
	/* 조회 기능 */
	@RequestMapping("/OE/searchList.do")
	public String searchList(
			@RequestParam Date orderDate1,
			@RequestParam Date orderDate2,
			@RequestParam int oeNo,
			@RequestParam String oeName,
			Model model
			) {
		
		List<OE> list = oeService.selectSearchList();
		
		System.out.println("search : " + list);
		
		model.addAttribute("list", list);
		
		return "";
	}

	/* 입고 등록하기 */
	@RequestMapping("OE/updateStatus.do")
	public String updateStatus(
			@RequestParam int oeNo,
			@RequestParam String oeName
			) {
		
		
		
		return "";
	}
	


}
