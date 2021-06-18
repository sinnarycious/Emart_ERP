package com.sinnarycious.emart24.event.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.event.model.vo.Attachment;
import com.sinnarycious.emart24.event.model.vo.Event;

public interface EventDAO {
    
	List<Map<String, String>> selectEventList(int pageNo, int numPerPage);

	int selectEventTotalContents();
	
	List<Event> searchInfo(Date evntDateS1, Date evntDateS2, String evntTitle, int evntNo);
	
	
}

