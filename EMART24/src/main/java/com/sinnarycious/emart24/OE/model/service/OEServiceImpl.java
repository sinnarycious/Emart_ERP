package com.sinnarycious.emart24.OE.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.OE.model.dao.OEDAO;
import com.sinnarycious.emart24.OE.model.vo.OE;

@Service
public class OEServiceImpl implements OEService {

	@Autowired
	OEDAO oeDAO;
	
	/* 입고 관리 이동 (페이지) */
	@Override
	public List<Map<String, String>> selectOEList(int pageNo, int numberPage) {

		return oeDAO.selectOEList(pageNo, numberPage);
	}
	
	@Override
	public int selectOETotalContents() {

		return oeDAO.selectOETotalContents();
	}

	/* 입고 관리 이동 기존
	@Override
	public List<OE> selectOEList() {

		return oeDAO.selectOEList();
	}
	*/

	@Override
	public List<OE> searchInfo(String oeName) {

		return oeDAO.searchInfo(oeName);
	}





	@Override
	public int resetList(int oeNo) {
		
		return oeDAO.resetList();
	}

}
