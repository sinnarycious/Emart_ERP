package com.sinnarycious.emart24.OE.model.dao;

import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.OE.model.vo.OE;

public interface OEDAO {

	List<Map<String, String>> selectOEList(int pageNo, int numberPage);
	// List<OE> selectOEList();
	
	int selectOETotalContents();

	List<OE> selectSearchList();





}
