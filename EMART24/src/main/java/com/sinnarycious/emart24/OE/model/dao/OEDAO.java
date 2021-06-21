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

	// 검색 기능
	List<OE> searchInfo(int pageNo, int numberPage, String orderDate1, String orderDate2, String oeName, int oeNo);

	// 입고 내역 등록 버튼
	int updateStatus(int oeNo, String oeName);
	// oeNo와 oeName으로 oeInvNo 찾기 
	int findOEInvNo(int oeNo, String oeName);
	// 발주 수량 재고 테이블에 추가
	int addCount(int oeInvNo);

		
	// 다시쓰기 : 가율
	int resetList();
	
	// 검색 결과 리스트 : 가율
	List<OE> orderInsertList(OE oe);

	int searchTotalContent(String orderDate1, String orderDate2, String oeName, int oeNo);






}
