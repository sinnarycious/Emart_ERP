package com.sinnarycious.emart24.sale.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface SaleDAO {

	HashMap<String, Date> FindMonday(String sqlDate);

	Date FindMonth(String sqlDate);

	List<Integer> selectWeekProfit(Date sqlWeekDate);

	Map<String, Integer> selectLastMonthProfit(Date sqlMonthDate);

	Map<String, Integer> selectThisMonthProfit();




}
