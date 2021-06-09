package com.sinnarycious.emart24.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.member.model.vo.Member;
import com.sinnarycious.emart24.member.model.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public Member selectOneMember(String userId) {
		
		return memberDAO.selectOneMember(userId);
	}

	@Override
	public int updateMember(Member member) {
		
		return memberDAO.updateMember(member);
	}
}
