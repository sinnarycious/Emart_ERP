package com.sinnarycious.emart24.OE.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.OE.model.dao.OEDAO;

@Service
public class OEServiceImpl implements OEService {

	@Autowired
	OEDAO OEDAO;
	
}
