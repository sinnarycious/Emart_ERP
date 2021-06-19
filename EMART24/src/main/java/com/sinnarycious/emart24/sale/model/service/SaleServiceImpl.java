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
	public Map<String, Object> selectLineProfit(Date javaDate) {
		
		System.out.println("javaDate : " + javaDate);
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(javaDate);
		
		String sqlWeek = saleDAO.findLastMonday(sqlDate);
		
		System.out.println("sqlLastMonday : " + sqlWeek);
		
		String sqlMonthDate = saleDAO.findLastMonth(sqlDate);
		
		System.out.println("sqlLastMonth : " + sqlMonthDate);
		
		List<Sale> weekList = saleDAO.selectLineWeekProfit(sqlWeek);
		
		List<Sale> lastMonthList = saleDAO.selectLineLastMonthProfit(sqlMonthDate);
		
		List<Sale> thisMonthList = saleDAO.selectLineThisMonthProfit();
		
		System.out.println("weekList : " + weekList);

		System.out.println("lastMonthList : " + lastMonthList);
		
		System.out.println("thisMonthList : " + thisMonthList);
		
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("weekLineList", weekList);
		dataMap.put("lastLineMonthList", lastMonthList);
		dataMap.put("thisLineMonthList", thisMonthList);

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

	@Override
	public Map<String, Object> selectDoughnutProfit(Date javaDate) {
		System.out.println("javaDate : " + javaDate);
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(javaDate);
		
		String sqlWeek = saleDAO.findMonday(sqlDate);
		
		System.out.println("sqlMonday : " + sqlWeek);
		
		// String sqlMonthDate = saleDAO.findMonth(sqlDate);
		
		// System.out.println("sqlMonth : " + sqlMonthDate);
		
		Sale doughnut = new Sale();
		
		List<Sale> thisWeekList = saleDAO.selectDoughnutThisWeekProfit(sqlWeek);
		
		// List<Sale> lastMonthList = saleDAO.selectDoughnutLastMonthProfit(sqlMonthDate);
		
		List<Sale> thisMonthList = saleDAO.selectDoughnutThisMonthProfit();
		
		System.out.println("weekDoughnutList : " + thisWeekList);

		// System.out.println("lastDoughnutMonthList : " + lastMonthList);
		
		System.out.println("thisDoughnutMonthList : " + thisMonthList);
		
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("weekDoughnutList", thisWeekList);
		// dataMap.put("lastDoughnutMonthList", lastMonthList);
		dataMap.put("thisDoughnutMonthList", thisMonthList);

		return dataMap;
	}
}
