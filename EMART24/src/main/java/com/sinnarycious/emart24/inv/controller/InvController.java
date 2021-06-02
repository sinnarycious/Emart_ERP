package com.sinnarycious.emart24.inv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinnarycious.emart24.inv.model.service.InvService;

@Controller
public class InvController {

	@Autowired
	InvService invService;
	
	
}
