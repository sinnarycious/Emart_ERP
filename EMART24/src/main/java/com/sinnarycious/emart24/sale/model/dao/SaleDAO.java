package com.sinnarycious.emart24.sale.model.dao;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.sinnarycious.emart24.sale.model.vo.Sale;


public interface SaleDAO {

	String FindMonday(String sqlDate);

	String FindMonth(String sqlDate);

	List<Sale> selectLineWeekProfit(String sqlWeekDate);

	List<Sale> selectLineLastMonthProfit(String sqlMonthDate);

	List<Sale> selectLineThisMonthProfit();


	List<Map<String, String>> selectSaleList(int pageNo, int numberPage);

	int selectSaleTotalContents();

	List<Sale> selectDoughnutWeekProfit(String sqlWeek);

	List<Sale> selectDoughnutLastMonthProfit(String sqlMonthDate);

	List<Sale> selectDoughnutThisMonthProfit();




}
