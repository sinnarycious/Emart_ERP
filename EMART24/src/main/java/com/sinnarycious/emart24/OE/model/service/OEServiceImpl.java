package com.sinnarycious.emart24.OE.model.service;

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

	// 검색 기능
	@Override
	public List<OE> searchInfo(String orderDate1, String orderDate2, String oeName, int oeNo) {

		return oeDAO.searchInfo(orderDate1, orderDate2, oeName, oeNo);
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
