package com.sinnarycious.emart24.OE.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sinnarycious.emart24.OE.model.service.OEService;
import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.common.SearchUtils;
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
			@RequestParam( required=false, defaultValue="1") int cPage,
			@RequestParam (required=false)String orderDate1,
			@RequestParam (required=false)String orderDate2,
			@RequestParam (required=false, defaultValue="") String oeName,
			@RequestParam (required=false, defaultValue="0") int oeNo 
			){
		int numPerPage = 10;
		Map<String, Object> map = new HashMap<String, Object>();
		oeName.replace('_', ' ');
		int searchTotalContent = oeService.searchTotalContent(orderDate1, orderDate2, oeName, oeNo);
		List<OE> searchList = oeService.searchInfo(cPage, numPerPage, orderDate1, orderDate2, oeName, oeNo);
		
		String pageBar = SearchUtils.getPageBar(searchTotalContent, cPage, 10, "oe.do", oeName);
		
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


	/* 입고 등록하기 */
	@RequestMapping("/OE/updateStatus.do")
	@ResponseBody
	public int updateStatus(
			@RequestParam int oeNo,
			@RequestParam String oeName) {
		
		int result = oeService.updateStastus(oeNo, oeName);
		return result;
	}

	/*
	// 발주 리스트 보내기 : 가율
	@RequestMapping("/OE/OEInsert.do")
	public String orderInsertList(
						 	HttpServletRequest req) {
							// user_no 나중에 추가
		
		System.out.println("oeNo3 : " + req.getParameterValues("oeNo3"));
		Map map = new HashMap();
		map.put("oeNo", req.getParameter("oeNo"));
		map.put("oeCount", req.getParameter("oeCount"));
		
		//ModelAndView mv = new ModelAndView("redirect:/OEInsert.do");
		
		return "orderPage";
	
	}
	*/
	// 발주리스트 : 가율이
	@RequestMapping("/OE/orderList.do")
	@ResponseBody
	public Map<String, OE> orderList() {
		
		Map<String, OE> map = oeService.orderList();
		
		System.out.println("map : " + map.get("OE"));
		
		return map;
	}
	

	// 발주리스트 보내기 : 가율
	@RequestMapping("/OE/OEInsert.do")
	@ResponseBody
	public int orderListInsert(@RequestParam String orderList) {
	
		List<OE> list = Arrays.asList(new Gson().fromJson(orderList, OE[].class));
		System.out.println(list);
		int result = oeService.orderInsertList(list);
		
		return result;
	}
	
	
}
