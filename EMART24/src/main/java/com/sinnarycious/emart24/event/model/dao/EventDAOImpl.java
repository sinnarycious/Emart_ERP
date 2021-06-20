package com.sinnarycious.emart24.event.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.event.model.vo.Attachment;
import com.sinnarycious.emart24.event.model.vo.Event;


@Repository
public class EventDAOImpl implements EventDAO{
 
	@Autowired
	SqlSessionTemplate sqlSession;
 
	@Override
	public List<Map<String, String>> selectEventList(int pageNo, int numPerPage) {

		RowBounds rows = new RowBounds((pageNo-1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("event.selectEventList", null, rows);
	}

	@Override
	public int selectEventTotalContents() {
		
		return sqlSession.selectOne("event.selectEventTotalContents");
	}
	
	


}