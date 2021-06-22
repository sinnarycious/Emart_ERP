package com.sinnarycious.emart24.inv.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.event.model.vo.Event;
import com.sinnarycious.emart24.inv.model.vo.Inv;

@Repository
public class InvDAOImpl implements InvDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectInvList(int pageNo, int numPerPage) {

		RowBounds rows = new RowBounds((pageNo-1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("inv.selectInvList", null, rows);
	}

	@Override
	public int selectInvTotalContents() {
		
		return sqlSession.selectOne("inv.selectInvTotalContents");
	}
	
	@Override
	public List<Inv> searchInfo(int pageNo, int numberPage, int invCatNo, int invNo, String invName) {
		
		System.out.println("invCatNo : " + invCatNo);
		System.out.println("invNo : " + invNo);
		System.out.println("invName : " + invName);
				
		Inv inv = new Inv(invCatNo, invNo, invName);
		
		RowBounds rows = new RowBounds((pageNo-1) * numberPage, numberPage);
		return sqlSession.selectList("inv.searchInfo", inv, rows);
	}
	
	@Override
	public int searchTotalContent(int invCatNo, int invNo, String invName) {
		
		Inv inv = new Inv(invCatNo, invNo, invName);
		
		return sqlSession.selectOne("inv.searchTotalContent", inv);
	}

	@Override
	public int updateWarehouse(Inv inv) {
		return sqlSession.update("inv.updateWarehouse", inv);
	}

	@Override
	public int updateStock(Inv inv) {
		return sqlSession.update("inv.updateStock", inv);
	}
	
}
