package com.sinnarycious.emart24.sale.model.service;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	public List<Map<String, String>> selectSaleList(int pageNo, int numberPage) {

		return saleDAO.selectSaleList(pageNo, numberPage);
	}
	
	@Override
	public int selectSaleTotalContents() {

		return saleDAO.selectSaleTotalContents();

	}

	@Override
	public Map<String, Object> selectLineProfit(String sqlDate) {

		String sqlWeekDate = saleDAO.findLastMonday(sqlDate);
		
		System.out.println(sqlWeekDate);
		
		String sqlMonthDate = saleDAO.findLastMonth(sqlDate);

		System.out.println(sqlMonthDate);
		
		List<Sale> weekList = saleDAO.selectLineWeekProfit(sqlWeekDate);
		
		List<Sale> lastMonthList = saleDAO.selectLineLastMonthProfit(sqlMonthDate);
		
		List<Sale> thisMonthList = saleDAO.selectLineThisMonthProfit();
		
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("weekLineList", weekList);
		dataMap.put("lastLineMonthList", lastMonthList);
		dataMap.put("thisLineMonthList", thisMonthList);

		return dataMap;
	}
	
	@Override
	public Map<String, Object> selectDoughnutProfit(String sqlDate) {

		String sqlThisWeekDate = saleDAO.findMonday(sqlDate);	
		
		String sqlLastWeekDate = saleDAO.findLastMonday(sqlDate);	
		
		String sqlLastMonthDate = saleDAO.findLastMonth(sqlDate);
		
		List<Sale> lastWeekDoughnutList = new ArrayList<>();
		
		List<Sale> thisWeekDoughnutList = new ArrayList<>();
		
		List<Sale> lastMonthDoughnutList = new ArrayList<>();
		
		List<Sale> thisMonthDoughnutList = new ArrayList<>();
		
		List<Sale> todaySum = saleDAO.todaySum();
		
		// System.out.println("sqlMonday : " + sqlWeekDate);
		
		// System.out.println("sqlMonth : " + sqlMonthDate);
		
		// 지난 주 판매 비율 처리
		for (int i = 1; i < 6; i++) {
			
			Sale sql = new Sale(sqlLastWeekDate, i);
			
			Sale week = saleDAO.selectDoughnutLastWeekProfit(sql);
			
			lastWeekDoughnutList.add(week);
			
			// System.out.println("lastWeekDoughnutList : " + lastWeekDoughnutList.get(i-1));
		}
		
		// 이번 주 판매 비율 처리
		for (int i = 1; i < 6; i++) {
			
			Sale sql = new Sale(sqlThisWeekDate, i);
			
			Sale week = saleDAO.selectDoughnutThisWeekProfit(sql);
			
			thisWeekDoughnutList.add(week);
			
			// System.out.println("thisWeekDoughnutList : " + thisWeekDoughnutList.get(i-1));
		}
		
		// 지난 달 판매 비율 처리		
		for (int i = 1; i < 6; i++) {
			
			Sale sql = new Sale(sqlLastMonthDate, i);

			Sale month = saleDAO.selectDoughnutLastMonthProfit(sql);

			lastMonthDoughnutList.add(month);
					
			// System.out.println("lastDoughnutMonthList : " + lastMonthDoughnutList.get(i-1));
					
		}
		
		// 이번 달 판매 비율 처리		
		for (int i = 1; i < 6; i++) {

			Sale month = saleDAO.selectDoughnutThisMonthProfit(i);

			thisMonthDoughnutList.add(month);
			
			// System.out.println("thisDoughnutMonthList : " + thisMonthDoughnutList.get(i-1));
			
		}
		
		

		// System.out.println("lastDoughnutMonthList : " + lastMonthList);
		
		// List<Sale> lastMonthList = saleDAO.selectDoughnutLastMonthProfit(sqlMonthDate);
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("lastWeekDoughnutList", lastWeekDoughnutList);
		dataMap.put("thisWeekDoughnutList", thisWeekDoughnutList);
		dataMap.put("lastMonthDoughnutList", lastMonthDoughnutList);
		dataMap.put("thisMonthDoughnutList", thisMonthDoughnutList);
		dataMap.put("todaySum", todaySum);
		
		
		return dataMap;
		
	}
	
	@Override
	public Map<String, List<Sale>> selectTop5() {
		
		
		Map<String, List<Sale>> map = new HashMap<>();

		for (int i = 1; i < 6; i++) {
			List<Sale> top5 = saleDAO.selectTop5(i);
			
			if (i == 1) {
				map.put("drink", top5);
			} else if(i == 2) {
				map.put("ice", top5);
			} else if(i == 3) {
				map.put("con", top5);
			} else if(i == 4) {
				map.put("snack", top5);
			} else if(i == 5) {
				map.put("simple", top5);
			}
			
		}
		
		return map;
	}
	
	// 조회 기능
	@Override
	public List<Sale> searchInfo(String saleDate1, String saleDate2, String saleName, int proNo) {
	
		return saleDAO.searchInfo(saleDate1, saleDate2, saleName, proNo);
	}

}
