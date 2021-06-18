package com.sinnarycious.emart24.sale.controller;

import java.sql.Date;

import java.text.SimpleDateFormat;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.servlet.ModelAndView;

import com.sinnarycious.emart24.common.SearchUtils;
import com.sinnarycious.emart24.common.Utils;
import com.sinnarycious.emart24.sale.model.service.SaleService;
import com.sinnarycious.emart24.sale.model.vo.Sale;

@Controller
public class SaleController {

	@Autowired
	SaleService saleService;

	@RequestMapping("/sale/line.do")
	@ResponseBody
	public Map<String, Object> linegraph(@RequestParam long date) {
		
		System.out.println(date);

		
		Date javaDate = new Date(new java.util.Date(date).getTime());
		System.out.println(javaDate);
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(javaDate);
		System.out.println(sqlDate);

		
		Map<String, Object> map = saleService.selectWeekProfit(javaDate);
				
		return map;
	}
	
	

	@RequestMapping("/sale/sale.do")
	public String selectSaleList(
			@RequestParam( required=false, defaultValue="1") int cPage,
			Model model
			) {
		
		System.out.println("selectSale 기능 확인");
		
		int numPerPage = 10;
		List<Map<String, String>> list = saleService.selectSaleList(cPage, numPerPage);
		
		int totalContents = saleService.selectSaleTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "sale.do");
		
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "sale";
	}
	
	/* 조회 기능 */
	@RequestMapping("/sale/searchInfo.do")
	@ResponseBody
	public Map<String, Object> searchInfo(
			@RequestParam (required=false)Date saleDate1,
			@RequestParam (required=false)Date saleDate2,
			@RequestParam (required=false) String saleName,
			@RequestParam (required=false, defaultValue="0") int proNo 
			){
		System.out.println(saleDate1);
		
		Map<String, Object> map = new HashMap<String, Object>();
		saleName.replace('_', ' ');
		
		List<Sale> searchList = saleService.searchInfo(saleDate1, saleDate2, saleName, proNo);
		String pageBar = SearchUtils.getPageBar(searchList.size(), 1, 10, "sale.do", saleName);
		
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
