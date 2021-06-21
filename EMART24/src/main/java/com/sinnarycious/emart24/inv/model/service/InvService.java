package com.sinnarycious.emart24.inv.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.inv.model.vo.Inv;

public interface InvService {
	
	List<Map<String, String>> selectInvList(int pageNo, int numPerPage);

	int selectInvTotalContents();
	
	List<Inv> searchInfo(int invCatNo, int invNo, String invName);

}
