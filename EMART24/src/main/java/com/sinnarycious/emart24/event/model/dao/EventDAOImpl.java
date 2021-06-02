package com.sinnarycious.emart24.event.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
}
