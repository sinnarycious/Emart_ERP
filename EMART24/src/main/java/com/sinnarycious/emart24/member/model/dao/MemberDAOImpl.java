package com.sinnarycious.emart24.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.sinnarycious.emart24.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
<<<<<<< HEAD
	public Member selectOneMember(Member m) {
		
		System.out.println(m);
		
		return sqlSession.selectOne("member.selectOneMember", m);
	}
	
	@Override
=======
>>>>>>> refs/remotes/origin/kjw1302
	public int updateMember(Member member) {
		
		return sqlSession.update("member.updateMember", member);
	}

	
}
