package com.sinnarycious.emart24.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinnarycious.emart24.event.model.service.EventService;

@Controller
public class EventController {

	@Autowired
	EventService eventService;
	
}
