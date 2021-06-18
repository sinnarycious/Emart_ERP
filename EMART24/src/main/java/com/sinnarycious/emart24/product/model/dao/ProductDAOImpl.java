package com.sinnarycious.emart24.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.product.model.vo.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Product> selectPdList(int proNo, String proName, int proCatNo) {
		
		Product product = new Product(proNo, proName, proCatNo);
		
		System.out.println(sqlSession.selectList("product.selectPdList", product));
		
		
		return sqlSession.selectList("product.selectPdList", product);
	}
	
	@Override
	public List<Product> selectResultList() {
		
		return sqlSession.selectList("product.selectResultList");
	}
}
