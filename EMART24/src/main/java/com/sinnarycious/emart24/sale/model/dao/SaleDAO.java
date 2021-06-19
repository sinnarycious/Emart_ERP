package com.sinnarycious.emart24.sale.model.dao;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.sale.model.vo.Sale;


public interface SaleDAO {


	// 수익 그래프


	String findLastMonday(String sqlDate);

	String findLastMonth(String sqlDate);
	
	String findMonday(String sqlDate);

	String findMonth(String sqlDate);

	List<Sale> selectLineWeekProfit(String sqlWeekDate);

	List<Sale> selectLineLastMonthProfit(String sqlMonthDate);

	List<Sale> selectLineThisMonthProfit();

	// 판매 페이지
	List<Map<String, String>> selectSaleList(int pageNo, int numberPage);

	int selectSaleTotalContents();

	// 조회 기능
	List<Sale> searchInfo(Date saleDate1, Date saleDate2, String saleName, int proNo);


	List<Sale> selectDoughnutThisWeekProfit(String sqlWeek);

	List<Sale> selectDoughnutLastMonthProfit(String sqlMonthDate);

	List<Sale> selectDoughnutThisMonthProfit();



}
