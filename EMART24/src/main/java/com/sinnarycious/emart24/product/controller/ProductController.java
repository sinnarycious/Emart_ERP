package com.sinnarycious.emart24.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sinnarycious.emart24.product.model.service.ProductService;
import com.sinnarycious.emart24.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	// 검색 기능
	@RequestMapping("/product/searchBar.do")
	public String searchBar(Product product, Model model) {
		
		
		
		
		return "";
	}
	
	
}
