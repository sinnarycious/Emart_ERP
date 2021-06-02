package com.sinnarycious.emart24.sale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinnarycious.emart24.sale.model.service.SaleService;

@Controller
public class SaleController {

	@Autowired
	SaleService saleService;
	
}
