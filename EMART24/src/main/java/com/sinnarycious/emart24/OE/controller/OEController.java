package com.sinnarycious.emart24.OE.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinnarycious.emart24.OE.model.service.OEService;

@Controller
public class OEController {

	@Autowired
	OEService OEService;
	
}
