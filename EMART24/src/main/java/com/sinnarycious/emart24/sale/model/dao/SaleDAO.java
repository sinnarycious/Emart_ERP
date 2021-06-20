package com.sinnarycious.emart24.sale.model.dao;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.sinnarycious.emart24.sale.model.vo.Sale;


public interface SaleDAO {

	String findLastMonday(String sqlDate);

	String findLastMonth(String sqlDate);
	
	String findMonday(String sqlDate);

	String findMonth(String sqlDate);

	List<Sale> selectLineWeekProfit(String sqlWeekDate);

	List<Sale> selectLineLastMonthProfit(String sqlMonthDate);

	List<Sale> selectLineThisMonthProfit();

	List<Map<String, String>> selectSaleList(int pageNo, int numberPage);

	int selectSaleTotalContents();

	Sale selectDoughnutThisWeekProfit(Sale sql);
	
	Sale selectDoughnutLastWeekProfit(Sale sql);

	Sale selectDoughnutLastMonthProfit(Sale sale);

	Sale selectDoughnutThisMonthProfit(int saleCatNo);



}
