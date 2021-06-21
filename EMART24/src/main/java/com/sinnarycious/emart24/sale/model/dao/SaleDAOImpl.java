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
		
		String result = sqlSession.selectOne("sale.findMonth", sqlDate);
		
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
	public Sale selectDoughnutThisWeekProfit(Sale sql) {
		
		return sqlSession.selectOne("sale.selectDoughnutThisWeekProfit", sql);
	}
	
	@Override
	public Sale selectDoughnutLastWeekProfit(Sale sql) {
		
		return sqlSession.selectOne("sale.selectDoughnutLastWeekProfit", sql);
	}
	
	@Override
	public Sale selectDoughnutLastMonthProfit(Sale sale) {
		
		return sqlSession.selectOne("sale.selectDoughnutLastMonthProfit", sale);
	}
	
	@Override
	public Sale selectDoughnutThisMonthProfit(int saleCatNo) {

		return sqlSession.selectOne("sale.selectDoughnutThisMonthProfit", saleCatNo);
	}

	@Override
	public List<Sale> selectTop5(int saleCatNo) {
		
		return sqlSession.selectList("sale.selectTop5", saleCatNo);
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
	
	// 조회 기능
		@Override
		public List<Sale> searchInfo(String saleDate1, String saleDate2, String saleName, int proNo) {

			System.out.println("saleDate1 : " + saleDate1);
			System.out.println("saleDate2 : " + saleDate2);
			System.out.println("saleNo : " + proNo);
			System.out.println("saleName : " + saleName);

			Sale sale = new Sale(saleDate1, saleDate2, saleName, proNo);
			return sqlSession.selectList("sale.searchInfo", sale);
		}

	
}
