package com.sinnarycious.emart24.inv.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.inv.model.vo.Inv;

public interface InvService {
	
	List<Map<String, String>> selectInvList(int pageNo, int numPerPage);

	int selectInvTotalContents();
	
	int searchTotalContent(int invCatNo, int invNo, String invName);

	List<Inv> searchInfo(int pageNo, int numberPage, int invCatNo, int invNo, String invName);

	int updateWarehouse(Inv inv);

	int updateStock(Inv inv);
}
