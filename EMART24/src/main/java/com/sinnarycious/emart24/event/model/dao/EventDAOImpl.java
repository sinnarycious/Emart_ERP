package com.sinnarycious.emart24.event.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.OE.model.vo.OE;
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
	
	@Override
	public List<Event> searchInfo(int pageNo, int numberPage, Date evntDateS1, Date evntDateS2, String evntTitle, int evntNo) {
		
		System.out.println("evntDateS1 : " + evntDateS1);
		System.out.println("evntDateS2 : " + evntDateS2);
		System.out.println("evntNo : " + evntNo);
		System.out.println("evntTitle : " + evntTitle);
				
		Event event = new Event(evntDateS1, evntDateS2, evntTitle, evntNo);
		
		RowBounds rows = new RowBounds((pageNo-1) * numberPage, numberPage);
		return sqlSession.selectList("event.searchInfo", event, rows);
	}
	
	@Override
	public int searchTotalContent(Date evntDateS1, Date evntDateS2, String evntTitle, int evntNo) {
		
		Event event = new Event(evntDateS1, evntDateS2, evntTitle, evntNo);
		
		return sqlSession.selectOne("event.searchTotalContent", event);
	}



}