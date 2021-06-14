package com.sinnarycious.emart24.OE.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.OE.model.dao.OEDAO;
import com.sinnarycious.emart24.OE.model.vo.OE;

@Service
public class OEServiceImpl implements OEService {

	@Autowired
	OEDAO oeDAO;

	@Override
	public List<OE> selectOEList() {

		return oeDAO.selectOEList();
	}

}
