package com.sinnarycious.emart24.sale.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sinnarycious.emart24.sale.model.service.SaleService;

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
	
	
	
	
	
}
