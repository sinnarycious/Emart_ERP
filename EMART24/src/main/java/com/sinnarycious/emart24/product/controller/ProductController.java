package com.sinnarycious.emart24.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String searchBar(Product product, Model model,
							HttpServletRequest req) {
		
		// keyword로 검색 
		String keyword =  req.getParameter("keyword");
		System.out.println("keyword 확인 : " + keyword);
		
		// 제품 리스트
		List<Product> list = productService.selectPdList(keyword);
		
		System.out.println("selectPdList : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
	
		return "";
	}
	
	
}
