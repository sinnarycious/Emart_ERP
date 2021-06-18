package com.sinnarycious.emart24.sale.model.service;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.sale.model.dao.SaleDAO;
import com.sinnarycious.emart24.sale.model.vo.Sale;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDAO saleDAO;

	@Override
	public Map<String, Object> selectWeekProfit(Date javaDate) {
		
		System.out.println("javaDate : " + javaDate);
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(javaDate);
		
		String sqlWeek = saleDAO.FindMonday(sqlDate);
		
		System.out.println("sqlWeekDate : " + sqlWeek);
		
		String sqlMonthDate = saleDAO.FindMonth(sqlDate);
		
		System.out.println("sqlMonthDate : " + sqlMonthDate);
		
		List<Sale> weekList = saleDAO.selectWeekProfit(sqlWeek);
		
		List<Sale> lastMonthList = saleDAO.selectLastMonthProfit(sqlMonthDate);
		
		List<Sale> thisMonthList = saleDAO.selectThisMonthProfit();
		
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
