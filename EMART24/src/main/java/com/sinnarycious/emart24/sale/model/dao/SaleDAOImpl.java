package com.sinnarycious.emart24.sale.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SaleDAOImpl implements SaleDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

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
	
}
