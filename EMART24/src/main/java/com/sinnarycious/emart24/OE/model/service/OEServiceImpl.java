package com.sinnarycious.emart24.OE.model.service;

import java.sql.Date;
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
	public List<OE> searchInfo(Date orderDate1, Date orderDate2, String oeName, int oeNo) {

		return oeDAO.searchInfo(orderDate1, orderDate2, oeName, oeNo);
	}


	@Override
	public int resetList(int oeNo) {
		
		return oeDAO.resetList();
	}
	
	// 발주리스트 보내기 : 가율
	@Override
	public List<OE> orderInsertList(OE oe) {
		
		return oeDAO.orderInsertList(oe);
	}


	// 발주리스트 : 가율
	@Override
	public OE orderList() {
		
		OE oe = new OE();
		
		int count = 0;
		
		if(count == 0) {
			oe = oeDAO.orderList();		// 증가값
			count++;
		} else {
			oe = oeDAO.orderList2();	// 현재값
		}
		
		return oeDAO.orderList();
	}

}
