package com.sinnarycious.emart24.OE.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.product.model.vo.Product;

public interface OEDAO {

	List<Map<String, String>> selectOEList(int pageNo, int numberPage);
	// List<OE> selectOEList();
	
	int selectOETotalContents();

	List<OE> searchInfo(Date orderDate1, Date orderDate2, String oeName, int oeNo);

	// 다시쓰기 : 가율
	int resetList();
	
	// 검색 결과 리스트 : 가율
	OE orderList();

	List<OE> orderInsertList(OE oe);

	OE orderList2();







}
