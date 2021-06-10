package com.sinnarycious.emart24.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectOneMember(String userId) {
		
		return sqlSession.selectOne("member-mapper.selectOneMember", userId);
	}
	
	@Override
	public int updateMember(Member member) {
		
		return sqlSession.update("member-mapper.updateMember", member);
	}

	
}
