package com.sinnarycious.emart24.event.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.event.model.vo.Attachment;
import com.sinnarycious.emart24.event.model.dao.EventDAO;
import com.sinnarycious.emart24.event.model.vo.Event;

@Service
public class EventServiceImpl implements EventService{
 
	@Autowired
    EventDAO eventDAO;
 
	@Override
	public List<Map<String, String>> selectEventList(int pageNo, int numPerPage) {
		
		return eventDAO.selectEventList(pageNo, numPerPage);
	}

	@Override
	public int selectEventTotalContents() {
		
		return eventDAO.selectEventTotalContents();
	}
	
	@Override
	public List<Event> searchInfo(int pageNo, int numberPage, Date evntDateS1, Date evntDateS2, String evntTitle, int evntNo) {

		return eventDAO.searchInfo(pageNo, numberPage, evntDateS1, evntDateS2, evntTitle, evntNo);
	}
	
	@Override
	public int searchTotalContent(Date evntDateS1, Date evntDateS2, String evntTitle, int evntNo) {
		return eventDAO.searchTotalContent(evntDateS1, evntDateS2, evntTitle, evntNo);
	}

}