package com.sinnarycious.emart24.inv.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.inv.model.dao.InvDAO;
import com.sinnarycious.emart24.inv.model.vo.Inv;

@Service
public class InvServiceImpl implements InvService {

	@Autowired
	InvDAO invDAO;
	
	@Override
	public List<Map<String, String>> selectInvList(int pageNo, int numPerPage) {
		
		return invDAO.selectInvList(pageNo, numPerPage);
	}

	@Override
	public int selectInvTotalContents() {
		
		return invDAO.selectInvTotalContents();
	}
	
	@Override
	public List<Inv> searchInfo(int invCatNo, int invNo, String invName) {

		return invDAO.searchInfo(invCatNo, invNo, invName);
	}
	
	
}
