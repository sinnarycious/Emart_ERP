package com.sinnarycious.emart24.sale.model.service;

import java.util.List;
import java.util.Map;
import com.sinnarycious.emart24.sale.model.vo.Sale;

public interface SaleService {

	List<Map<String, String>> selectSaleList(int cPage, int numPerPage);

	int selectSaleTotalContents();

}
