package com.sinnarycious.emart24.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.product.model.dao.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
}
