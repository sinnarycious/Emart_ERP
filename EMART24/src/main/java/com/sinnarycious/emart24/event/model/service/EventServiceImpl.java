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
	

}