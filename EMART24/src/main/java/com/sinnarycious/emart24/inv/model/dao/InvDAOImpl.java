package com.sinnarycious.emart24.inv.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InvDAOImpl implements InvDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
}
