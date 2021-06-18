package com.sinnarycious.emart24.sale.model.service;


import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.sale.model.vo.Sale;

public interface SaleService {

	// 수익 그래프
	Map<String, Object> selectWeekProfit(Date javaDate);

	// 판매 페이지
	List<Map<String, String>> selectSaleList(int cPage, int numPerPage);

	int selectSaleTotalContents();
	
	// 조회 기능
	List<Sale> searchInfo(Date saleDate1, Date saleDate2, String saleName, int proNo);

}
