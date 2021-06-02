package com.sinnarycious.emart24.OE.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OEDAOImpl implements OEDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
}
