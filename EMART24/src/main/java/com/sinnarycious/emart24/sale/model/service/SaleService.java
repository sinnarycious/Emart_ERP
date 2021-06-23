package com.sinnarycious.emart24.sale.model.service;


import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.sale.model.vo.Sale;


public interface SaleService {


	Map<String, Object> selectLineProfit(String sqlDate);

	Map<String, Object> selectDoughnutProfit(String sqlDate);

	Map<String, List<Sale>> selectTop5();
	
	// 리스트
	List<Map<String, String>> selectSaleList(int pageNo, int numPerPage);
	
	int selectSaleTotalContents();
	
	// 조회 기능
	List<Sale> searchInfo(int pageNo, int numberPage, String saleDate1, String saleDate2, String saleName, int proNo);

	int searchTotalContent(String saleDate1, String saleDate2, String saleName, int proNo);
}
