package com.sinnarycious.emart24.member.model.service;

import org.springframework.ui.Model;

import com.sinnarycious.emart24.member.model.vo.Member;

public interface MemberService {
	
	Member selectOneMember(Member m);
	
	int updateMember(Member member);

}
