package com.sinnarycious.emart24.sale.model.dao;

import java.util.List;
import java.util.Map;

import com.sinnarycious.emart24.sale.model.vo.Sale;

public interface SaleDAO {

	List<Map<String, String>> selectSaleList(int pageNo, int numberPage);

	int selectSaleTotalContents();


}
