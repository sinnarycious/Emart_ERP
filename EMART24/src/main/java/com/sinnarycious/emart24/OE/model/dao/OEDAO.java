package com.sinnarycious.emart24.OE.model.dao;

import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.product.model.vo.Product;

public interface OEDAO {

	List<Map<String, String>> selectOEList(int pageNo, int numberPage);
	// List<OE> selectOEList();
	
	int selectOETotalContents();

	List<OE> selectSearchList();

	// 다시쓰기 : 가율
	int resetList();
	
	// 검색 결과 리스트 : 가율
	List<OE> orderInsertList(OE oe);

}
