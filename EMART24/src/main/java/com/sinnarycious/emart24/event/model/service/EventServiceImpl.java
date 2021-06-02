package com.sinnarycious.emart24.event.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.event.model.dao.EventDAO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDAO eventDAO;
	
}
