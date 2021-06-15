package com.sinnarycious.emart24.OE.model.dao;

import java.util.List;

import com.sinnarycious.emart24.OE.model.vo.OE;

public interface OEDAO {

	List<OE> selectOEList();

	int resetList();

}
