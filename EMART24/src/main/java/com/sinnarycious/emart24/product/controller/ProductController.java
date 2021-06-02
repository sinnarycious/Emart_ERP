package com.sinnarycious.emart24.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinnarycious.emart24.product.model.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
}
