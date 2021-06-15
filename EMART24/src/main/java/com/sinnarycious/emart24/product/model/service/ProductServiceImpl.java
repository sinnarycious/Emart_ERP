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

	@Override
	public List<Product> selectPdList(String keyword) {
		
		return productDAO.selectPdList(keyword);
	}
}
