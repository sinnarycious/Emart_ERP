package com.sinnarycious.emart24.sale.model.service;


import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.sale.model.vo.Sale;


public interface SaleService {


	Map<String, Object> selectLineProfit(String sqlDate);

	List<Map<String, String>> selectSaleList(int cPage, int numPerPage);
	
	int selectSaleTotalContents();

	Map<String, Object> selectDoughnutProfit(String sqlDate);

	Map<String, List<Sale>> selectTop5();
	
	// 조회 기능
	List<Sale> searchInfo(String saleDate1, String saleDate2, String saleName, int proNo);
}
