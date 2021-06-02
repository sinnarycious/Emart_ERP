package com.sinnarycious.emart24.sale.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SaleDAOImpl implements SaleDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
}
