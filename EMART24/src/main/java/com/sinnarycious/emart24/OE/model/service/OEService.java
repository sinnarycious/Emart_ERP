package com.sinnarycious.emart24.OE.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.OE.model.vo.OE;

public interface OEService {

	List<Map<String, String>> selectOEList(int pageNo, int numberPage);
	
	//List<OE> selectOEList();

	List<OE> searchInfo(Date orderDate1, Date orderDate2, String oeName, int oeNo);

	int selectOETotalContents();

	int resetList(int oeNo);

}
