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

import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.common.Utils;
import com.sinnarycious.emart24.sale.model.service.SaleService;
import com.sinnarycious.emart24.sale.model.vo.Sale;

@Controller
public class SaleController {

	@Autowired
	SaleService saleService;

	@RequestMapping("/sale/line.do")
	@ResponseBody
	public Map<String, Object> lineGraph(@RequestParam long date) {
		
		// System.out.println(date);
		
		Date javaDate = new Date(new java.util.Date(date).getTime());
		// System.out.println(javaDate);
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(javaDate);
		// System.out.println(sqlDate);

		
		Map<String, Object> map = saleService.selectLineProfit(sqlDate);
				
		return map;
	}
	
	@RequestMapping("/sale/doughnut.do")
	@ResponseBody
	public Map<String, Object> doughnutGraph(@RequestParam long date) {
		
		//System.out.println(date);
		
		Date javaDate = new Date(new java.util.Date(date).getTime());
		// System.out.println(javaDate);
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(javaDate);
		// System.out.println(sqlDate);
		
		Map<String, Object> map = saleService.selectDoughnutProfit(sqlDate);
				
		return map;
	}
	
	@RequestMapping("/sale/top5.do")
	@ResponseBody
	public Map<String, List<Sale>> top5() {
		
		Map<String, List<Sale>> map = saleService.selectTop5();
		
		return map;
	}

	@RequestMapping("/sale/sellPage.do")
	public String selectSaleList(
			@RequestParam( required=false, defaultValue="1") int cPage,
			Model model
			) {
		
		System.out.println("selectSale 기능 확인");
		
		int numPerPage = 10;
		List<Map<String, String>> list = saleService.selectSaleList(cPage, numPerPage);
		
		int totalContents = saleService.selectSaleTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "sellPage.do");
		
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "sellPage";
	}

	
}
