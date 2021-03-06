package com.sinnarycious.emart24.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sinnarycious.emart24.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectOneMember(Member m) {
		
		System.out.println(m);
		
		return sqlSession.selectOne("member.selectOneMember", m);
	}
	
	@Override
	public int updateMember(Member member) {
		
		System.out.println(member);
		
		return sqlSession.update("member.updateMember", member);
	}


	// 아이디 검색
	@Override
	public List<Member> searchId(Member m) {
	
		System.out.println("DAO : " + m);

		return sqlSession.selectList("member.searchMemberId", m);
	}

	// 비밀번호 검색
	@Override
	public List<Member> searchPwd(Member m) {
	
		System.out.println("DAO : " + m);

		return sqlSession.selectList("member.searchMemberPwd", m);
	}


}

