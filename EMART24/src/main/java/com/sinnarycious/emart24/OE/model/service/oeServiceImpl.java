package com.sinnarycious.emart24.OE.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.OE.model.dao.oeDAO;
import com.sinnarycious.emart24.OE.model.vo.oe;

@Service
public class oeServiceImpl implements oeService {

	@Autowired
	oeDAO oeDAO;

	@Override
	public List<oe> selectOEList() {

		return oeDAO.selectOEList();
	}
	
}
