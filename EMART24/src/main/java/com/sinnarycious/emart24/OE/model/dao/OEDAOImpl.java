package com.sinnarycious.emart24.OE.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.OE.model.vo.OE;

@Repository
public class OEDAOImpl implements OEDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectOEList(int pageNo, int numberPage) {

		RowBounds rows = new RowBounds((pageNo-1) * numberPage, numberPage);
		return sqlSession.selectList("oe.selectOEList", null, rows);
	}
	
	@Override
	public int selectOETotalContents() {

		return sqlSession.selectOne("oe.selectOETotalContents");
	}
	
	// 검색 기능
	@Override
	public List<OE> searchInfo(String orderDate1, String orderDate2, String oeName, int oeNo) {
		
		System.out.println("orderDate1 : " + orderDate1);
		System.out.println("orderDate2 : " + orderDate2);
		System.out.println("oeNo : " + oeNo);
		System.out.println("oeName : " + oeName);
		
		OE oe = new OE(orderDate1, orderDate2, oeName, oeNo);
		
		return sqlSession.selectList("oe.searchInfo", oe);
	}

	// 입고 내역 등록 버튼
	@Override
	public int updateStatus(int oeNo, String oeName) {
		
		OE oe = new OE(oeNo, oeName);		
		return sqlSession.update("oe.updateStatus", oe);
	}
	// oeNo와 oeName으로 oeInvNo 찾기
	@Override
	public int findOEInvNo(int oeNo, String oeName) {
		
		System.out.println("oeNo : " + oeNo);
		System.out.println("oeName : " + oeName);

		OE oe = new OE(oeNo, oeName);
		return sqlSession.selectOne("oe.findOEInvNo", oe);
	}	
	// 발주 수량 재고 테이블에 추가
	@Override
	public int addCount(int oeInvNo) {
		
		System.out.println("oeInvNo : " + oeInvNo);

		return sqlSession.update("oe.addCount", oeInvNo);
	}




	
	

	// 다시 쓰기 - 가율

	@Override
	public int resetList() {
		
		return sqlSession.delete("oe.resetList");
	}

	// 발주결과 리스트 - 가율
	@Override
	public List<OE> orderInsertList(OE oe) {
		
		return sqlSession.selectList("oe.orderInsertList", oe);
	}





	
}
