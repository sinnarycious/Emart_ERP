package com.sinnarycious.emart24.sale.model.dao;


import java.sql.Date;
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
	
	// 수익 그래프
	@Override
	public HashMap<String, Date> FindMonday(String sqlDate) {
		
		return sqlSession.selectOne("sale.findMonday", sqlDate);
	}

	@Override
	public Date FindMonth(String sqlDate) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sale.findMonth", sqlDate);
	}

	@Override
	public List<Integer> selectWeekProfit(Date sqlWeekDate) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sale.selectWeekProfit", sqlWeekDate);
	}
	
	@Override
	public Map<String, Integer> selectLastMonthProfit(Date sqlMonthDate) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Map<String, Integer> selectThisMonthProfit() {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 판매 페이지
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
	public List<Sale> searchInfo(Date saleDate1, Date saleDate2, String saleName, int proNo) {
		
		System.out.println("saleDate1 : " + saleDate1);
		System.out.println("saleDate2 : " + saleDate2);
		System.out.println("saleNo : " + proNo);
		System.out.println("saleName : " + saleName);
		
		Sale sale = new Sale(saleDate1, saleDate2, saleName, proNo);
		return sqlSession.selectList("sale.searchInfo", sale);
	}

	
}
