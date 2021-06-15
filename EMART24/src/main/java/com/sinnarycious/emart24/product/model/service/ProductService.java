package com.sinnarycious.emart24.product.model.service;

import java.util.List;

import com.sinnarycious.emart24.product.model.vo.Product;

public interface ProductService {

	List<Product> selectPdList(String keyword);

}
