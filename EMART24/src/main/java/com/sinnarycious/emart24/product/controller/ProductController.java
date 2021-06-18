package com.sinnarycious.emart24.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sinnarycious.emart24.product.model.service.ProductService;
import com.sinnarycious.emart24.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	// 검색 기능
	@RequestMapping("/product/searchBar.do")
	@ResponseBody
	public Map<String, Object> searchBar(@RequestParam(required=false, defaultValue="0") int proCatNo,
							@RequestParam(required=false, defaultValue="0") int proNo,
							@RequestParam(required=false) String proName)
						 {
		
		/* keyword로 검색 
		String keyword =  req.getParameter("keyword");
		System.out.println("keyword 확인 : " + keyword);
		*/
		System.out.println("검색기능 접근확인");
		
		Map<String, Object> map = new HashMap<String, Object>();
		proName.replace('_', ' ');
		
		// 제품 리스트
		List<Product> list = productService.selectPdList(proNo, proName, proCatNo);
		
		System.out.println("selectPdList : " + list);
		
		map.put("searchPdList", list);
		
		return map;
	}
	

}
