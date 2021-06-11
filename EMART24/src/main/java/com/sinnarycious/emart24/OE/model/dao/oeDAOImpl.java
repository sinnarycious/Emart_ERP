package com.sinnarycious.emart24.OE.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.OE.model.vo.oe;

@Repository
public class oeDAOImpl implements oeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<oe> selectOEList() {

		return sqlSession.selectList("oe.selectOEList");
	}
	
}
