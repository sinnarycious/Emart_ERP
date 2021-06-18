package com.sinnarycious.emart24.sale.model.service;


import java.sql.Date;
import java.util.List;
import java.util.Map;

public interface SaleService {


	Map<String, Object> selectLineProfit(Date javaDate);

	List<Map<String, String>> selectSaleList(int cPage, int numPerPage);

	int selectSaleTotalContents();

	Map<String, Object> selectDoughnutProfit(Date javaDate);


}
