package com.sinnarycious.emart24.OE.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/OE/searchInfo.do")
	@ResponseBody
	public Map<String, Object> searchInfo(
			@RequestParam String oeName
			){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<OE> searchList = oeService.searchInfo(oeName);
		
		map.put("search", searchList);
		
		return map;
	}
	
	/*
	 * @RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId) {
		// @ResponseBody Map 같은 객체를 viewResolver 에 강제로 맞추는 Annotation
		// => Spring 에선 String 반환값으로 화면 이동을 하는데 객체를 이용할 때 사용

		Map<String, Object> map = new HashMap<String, Object>();
		
		int check = memberService.checkIdDuplicate(userId);
		
		boolean data = (check == 0 ? true : false);
		
		map.put("data", data);
		
		return map;
		// Parsing 처리 없이 화면으로 보내도 GSON을 사용한 것처럼 JSON으로 바뀐다.
		// => @ResponseBody 덕분이다.
	}

	 */


	/* 입고 등록하기 */
	@RequestMapping("OE/updateStatus.do")
	public String updateStatus() {
		
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
		
		
		
		return "";
	}
	


}
