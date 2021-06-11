package com.sinnarycious.emart24.member.model.dao;

import org.springframework.ui.Model;

import com.sinnarycious.emart24.member.model.vo.Member;

public interface MemberDAO {
	
	Member selectOneMember(Member m);
	
	int updateMember(Member member);

}