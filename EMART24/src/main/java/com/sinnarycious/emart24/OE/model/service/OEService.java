package com.sinnarycious.emart24.OE.model.service;

import java.util.List;

import com.sinnarycious.emart24.OE.model.vo.OE;

public interface OEService {

	List<OE> selectOEList();

	int resetList(int oeNo);

}
