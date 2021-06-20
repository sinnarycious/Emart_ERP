package com.sinnarycious.emart24.product.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.product.model.service.ProductService;
import com.sinnarycious.emart24.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	// 검색 기능
	@RequestMapping("/product/searchBar.do")
	public String searchBar(@RequestParam(required=false, defaultValue="0") int proCatNo,
							@RequestParam(required=false, defaultValue="0") int proNo,
							@RequestParam(required=false, defaultValue="null") String proName,
							Model model) {
		
		/* keyword로 검색 
		String keyword =  req.getParameter("keyword");
		System.out.println("keyword 확인 : " + keyword);
		*/
		System.out.println("검색기능 접근확인");
		
		Product product = new Product(proNo, proName, proCatNo);
		System.out.println(product);
		// 제품 리스트
		List<Product> list = productService.selectPdList(product);
		
		System.out.println("selectPdList : " + list);
		
		model.addAttribute("list", list);

		return "orderPage";
	}
	

}
