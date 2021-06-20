package com.sinnarycious.emart24.inv.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.inv.model.dao.InvDAO;

@Service
public class InvServiceImpl implements InvService {

	@Autowired
	InvDAO invDAO;
	
}
