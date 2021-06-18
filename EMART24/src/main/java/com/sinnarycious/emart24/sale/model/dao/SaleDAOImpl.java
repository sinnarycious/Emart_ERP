package com.sinnarycious.emart24.sale.model.dao;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.sale.model.vo.Sale;

@Repository
public class SaleDAOImpl implements SaleDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	/*
	@Override
	public HashMap<String, Date> FindMonday(String sqlDate) {
		HashMap<String, Date> hmap = new HashMap<>(); 
		 
		String result = sqlSession.selectOne("sale.findMonday", sqlDate);
		
		hmap.put("lastMonday", Date.valueOf(result));
		 
		return hmap;
	}
	*/
	
	@Override
	public String FindMonday(String sqlDate) {
		HashMap<String, Date> hmap = new HashMap<>(); 
		 
		String result = sqlSession.selectOne("sale.findMonday", sqlDate);
		 
		return result;
	}
	
	/*
	@Override
	public HashMap<String, Date> FindMonth(String sqlDate) {
		HashMap<String, Date> hmap = new HashMap<>(); 
		 
		String result = sqlSession.selectOne("sale.findMonth", sqlDate);
		System.out.println("result : " + result);
		System.out.println("Date : " + Date.valueOf(result));
		hmap.put("lastMonth", Date.valueOf(result));
		System.out.println("hmap.get(\"lastMonth\") : " + hmap.get("lastMonth"));
		return hmap;
	}
	*/
	
	@Override
	public String FindMonth(String sqlDate) {
		 
		String result = sqlSession.selectOne("sale.findMonth", sqlDate);

		return result;
	}
	
	@Override
	public List<Sale> selectWeekProfit(String sqlWeekDate) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sale.selectWeekProfit", sqlWeekDate);
	}
	
	@Override
	public List<Sale> selectLastMonthProfit(String sqlMonthDate) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sale.selectLastMonthProfit", sqlMonthDate);
	}
	
	@Override
	public List<Sale> selectThisMonthProfit() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sale.selectThisMonthProfit");
	}
	
	@Override
	public List<Map<String, String>> selectSaleList(int pageNo, int numberPage) {

		RowBounds rows = new RowBounds((pageNo-1) * numberPage, numberPage);
		
		return sqlSession.selectList("sale.selectSaleList", null, rows);
	}
	
	@Override
	public int selectSaleTotalContents() {
		
		return sqlSession.selectOne("sale.selectSaleTotalContents");
	}

	
}
