package com.sinnarycious.emart24.sale.model.service;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.sale.model.dao.SaleDAO;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDAO saleDAO;

	@Override
	public Map<String, Object> selectWeekProfit(Date javaDate) {
		
		System.out.println("javaDate : " + javaDate);
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(javaDate);
		
		HashMap<String, Date> sqlWeekDateMap = saleDAO.FindMonday(sqlDate);
		
		System.out.println("sqlWeekDate : " + sqlWeekDateMap.get("LAST_WEEK"));
		
		Date sqlMonthDate = saleDAO.FindMonth(sqlDate);
		
		System.out.println("sqlMonthDate : " + sqlMonthDate);
		
		List<Integer> weekList = saleDAO.selectWeekProfit(javaDate);
		
		Map<String, Integer> lastMonthList = saleDAO.selectLastMonthProfit(sqlMonthDate);
		
		Map<String, Integer> thisMonthList = saleDAO.selectThisMonthProfit();
		
		System.out.println("weekList : " + weekList);

		System.out.println("lastMonthList : " + lastMonthList);
		
		System.out.println("thisMonthList : " + thisMonthList);
		
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("weekList", weekList);
		dataMap.put("lastMonthList", lastMonthList);
		dataMap.put("thisMonthList", thisMonthList);

		return dataMap;
	}
	
	@Override
	public List<Map<String, String>> selectSaleList(int pageNo, int numberPage) {

		return saleDAO.selectSaleList(pageNo, numberPage);
	}
	
	@Override
	public int selectSaleTotalContents() {

		return saleDAO.selectSaleTotalContents();

	}
}
