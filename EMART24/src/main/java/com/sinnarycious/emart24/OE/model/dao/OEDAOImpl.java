package com.sinnarycious.emart24.OE.model.dao;

import java.sql.Date;
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

	/*
	@Override
	public List<OE> selectOEList() {

		return sqlSession.selectList("oe.selectOEList");
	}
	*/
	
	@Override
	public List<OE> searchInfo(Date orderDate1, Date orderDate2, String oeName, int oeNo) {
		
		System.out.println("orderDate1 : " + orderDate1);
		System.out.println("orderDate2 : " + orderDate2);
		System.out.println("oeNo : " + oeNo);
		System.out.println("oeName : " + oeName);
		
		OE oe = new OE(orderDate1, orderDate2, oeName, oeNo);
		return sqlSession.selectList("oe.searchInfo", oe);
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
