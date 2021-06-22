package com.sinnarycious.emart24.sale.model.dao;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.sinnarycious.emart24.sale.model.vo.Sale;


public interface SaleDAO {
	
	List<Map<String, String>> selectSaleList(int pageNo, int numberPage);

	int selectSaleTotalContents();
	
	// 조회 기능

	List<Sale> searchInfo(int pageNo, int numberPage, String saleDate1, String saleDate2, String saleName, int proNo);
	int searchTotalContent(String saleDate1, String saleDate2, String saleName, int proNo);


	String findLastMonday(String sqlDate);

	String findLastMonth(String sqlDate);
	
	String findMonday(String sqlDate);

	String findMonth(String sqlDate);

	List<Sale> selectLineWeekProfit(String sqlWeekDate);

	List<Sale> selectLineLastMonthProfit(String sqlMonthDate);

	List<Sale> selectLineThisMonthProfit();

	Sale selectDoughnutThisWeekProfit(Sale sql);
	
	Sale selectDoughnutLastWeekProfit(Sale sql);

	Sale selectDoughnutLastMonthProfit(Sale sale);

	Sale selectDoughnutThisMonthProfit(int saleCatNo);

	List<Sale> selectTop5(int saleCatNo);

	List<Sale> todaySum();

}
