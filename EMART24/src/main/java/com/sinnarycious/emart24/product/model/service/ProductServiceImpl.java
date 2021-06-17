package com.sinnarycious.emart24.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.product.model.dao.ProductDAO;
import com.sinnarycious.emart24.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
	
	// 검색
	@Override
	public List<Product> selectPdList(Product product) {
		
		return productDAO.selectPdList(product);
	}

	// 검색 리스트
	@Override
	public List<Product> selectResultList() {
		
		return productDAO.selectResultList();
	}
}
