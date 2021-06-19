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
	public HashMap<String, Date> findLastMonday(String sqlDate) {
		HashMap<String, Date> hmap = new HashMap<>(); 
		 
		String result = sqlSession.selectOne("sale.findMonday", sqlDate);
		
		hmap.put("lastMonday", Date.valueOf(result));
		 
		return hmap;
	}
	*/
	/*
	@Override
	public HashMap<String, Date> findLastMonth(String sqlDate) {
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
	public String findLastMonday(String sqlDate) {
		HashMap<String, Date> hmap = new HashMap<>(); 
		 
		String result = sqlSession.selectOne("sale.findLastMonday", sqlDate);
		 
		return result;
	}
	
	
	@Override
	public String findLastMonth(String sqlDate) {
		 
		String result = sqlSession.selectOne("sale.findLastMonth", sqlDate);

		return result;
	}
	

	@Override
	public String findMonday(String sqlDate) {
		
		String result = sqlSession.selectOne("sale.findMonday", sqlDate);
		
		return result;
	}

	@Override
	public String findMonth(String sqlDate) {
		
		String result = sqlSession.selectOne("sale.findMonday", sqlDate);
		
		return result;
	}

	
	@Override
	public List<Sale> selectLineWeekProfit(String sqlWeekDate) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sale.selectLineWeekProfit", sqlWeekDate);
	}
	
	@Override
	public List<Sale> selectLineLastMonthProfit(String sqlMonthDate) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sale.selectLineLastMonthProfit", sqlMonthDate);
	}
	
	@Override
	public List<Sale> selectLineThisMonthProfit() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sale.selectLineThisMonthProfit");
	}
	
	@Override
	public List<Sale> selectDoughnutThisWeekProfit(String sqlWeek) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> selectDoughnutLastMonthProfit(String sqlMonthDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> selectDoughnutThisMonthProfit() {
		// TODO Auto-generated method stub
		return null;
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
