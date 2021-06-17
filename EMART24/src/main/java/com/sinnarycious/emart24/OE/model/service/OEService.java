package com.sinnarycious.emart24.OE.model.service;

import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.product.model.vo.Product;

public interface OEService {

	List<Map<String, String>> selectOEList(int pageNo, int numberPage);
	
	//List<OE> selectOEList();

	List<OE> selectSearchList();

	int selectOETotalContents();

	// 다시 쓰기 - 가율
	int resetList(int oeNo);
	
	// 발주리스트 - 가율
	List<OE> orderInsertList(OE oe);

}
