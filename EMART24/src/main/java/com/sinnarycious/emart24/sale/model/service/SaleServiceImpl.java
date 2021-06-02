package com.sinnarycious.emart24.sale.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.sale.model.dao.SaleDAO;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDAO saleDAO;
}
