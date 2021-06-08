package com.sinnarycious.emart24.main.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.main.model.dao.MainDAO;

@Service
public class mainServiceImpl implements mainService {
	
	@Autowired
	MainDAO mainDAO;

}
