package com.sinnarycious.emart24.inv.model.service;

import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.inv.model.vo.Inv;

public interface InvService {

	List<Inv> searchInfo(int invCatNo, int invNo, String invName);

	List<Map<String, String>> selectInvList(int cPage, int numPerPage);

	int selectInvTotalContents();

}
