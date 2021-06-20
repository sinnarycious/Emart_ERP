package com.sinnarycious.emart24.product.model.dao;

import java.util.List;

import com.sinnarycious.emart24.product.model.vo.Product;

public interface ProductDAO {

	List<Product> selectPdList(Product product);

	List<Product> selectResultList();

}
