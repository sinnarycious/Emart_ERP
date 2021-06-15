package com.sinnarycious.emart24.OE.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.OE.model.vo.OE;

@Repository
public class OEDAOImpl implements OEDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<OE> selectOEList() {

		return sqlSession.selectList("oe.selectOEList");
	}
	
	
	// 다시 쓰기 
	@Override
	public int resetList() {
		
		return sqlSession.delete("oe.resetList");
	}
	
}
