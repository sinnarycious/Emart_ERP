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

	/*
	@Override
	public List<OE> selectOEList() {

		return sqlSession.selectList("oe.selectOEList");
	}
	*/

	@Override
	public List<OE> selectSearchList() {

		return sqlSession.selectList("oe.searchInfo");
	}




	
	
	// 다시 쓰기 
	@Override
	public int resetList() {
		
		return sqlSession.delete("oe.resetList");
	}
	
}
