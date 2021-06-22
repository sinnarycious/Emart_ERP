package com.sinnarycious.emart24.OE.model.service;

import java.sql.Date;
import java.util.HashMap;
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

	// 검색 기능
	@Override
	public List<OE> searchInfo(int pageNo, int numberPage, String orderDate1, String orderDate2, String oeName, int oeNo) {

		return oeDAO.searchInfo(pageNo, numberPage, orderDate1, orderDate2, oeName, oeNo);
	}
	
	@Override
	public int searchTotalContent(String orderDate1, String orderDate2, String oeName, int oeNo) {
		return oeDAO.searchTotalContent(orderDate1, orderDate2, oeName, oeNo);
	}
	
	// 입고 내역 등록 버튼
	@Override
	public int updateStastus(int oeNo, String oeName) {
		int result = 0;
		// oeStatus 'N'에서 'Y'로 변경
		int result1 = oeDAO.updateStatus(oeNo, oeName);
		
		if( result1 != 0 ) {
			// oeNo와 oeName으로 oeInvNo 찾기
			int oeInvNo = oeDAO.findOEInvNo(oeNo, oeName);
			
			// 발주 수량 재고 테이블에 추가
			result = oeDAO.addCount(oeInvNo);
		}
		return result;
	}
	
	
	// 가율
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
	public Map<String, OE> orderList() {
		Map<String, OE> map = new HashMap<>();
		OE oe = new OE();
		
		oe = oeDAO.orderList();
		
		map.put("OE", oe);
		
		return map;
	}

}
