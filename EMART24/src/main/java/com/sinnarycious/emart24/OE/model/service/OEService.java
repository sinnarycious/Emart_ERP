package com.sinnarycious.emart24.OE.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.product.model.vo.Product;

public interface OEService {

	List<Map<String, String>> selectOEList(int pageNo, int numberPage);

	int selectOETotalContents();
	
	// 검색 기능
	List<OE> searchInfo(Date orderDate1, Date orderDate2, String oeName, int oeNo);
	
	// 입고 내역 등록 버튼 활성화
	int updateStastus(int oeNo, String oeName);

	// 다시 쓰기 - 가율
	int resetList(int oeNo);
	
	// 발주리스트 - 가율
	List<OE> orderInsertList(OE oe);

	OE orderList(int oeNo);

	




}
