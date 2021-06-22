package com.sinnarycious.emart24.inv.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.inv.model.vo.Inv;

public interface InvDAO {
	
	List<Map<String, String>> selectInvList(int pageNo, int numPerPage);

	int selectInvTotalContents();
	
	List<Inv> searchInfo(int pageNo, int numberPage, int invCatNo, int invNo, String invName);

	int searchTotalContent(int invCatNo, int invNo, String invName);

	int updateWarehouse(Inv inv);

	int updateStock(Inv inv);

}
