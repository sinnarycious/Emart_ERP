package com.sinnarycious.emart24.OE.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.OE.model.dao.OEDAO;
import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.product.model.vo.Product;

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
	
	// 발주리스트 결과
	@Override
	public List<OE> orderInsertList(OE oe) {
		
		return oeDAO.orderInsertList(oe);
	}

}
