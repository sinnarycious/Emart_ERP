package com.sinnarycious.emart24.sale.model.service;

import java.sql.Date;
import java.util.Map;

public interface SaleService {

	Map<String, Object> selectWeekProfit(Date javaDate);

}
