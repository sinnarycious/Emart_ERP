package com.sinnarycious.emart24.member.model.service;

import java.util.List;

import org.springframework.ui.Model;

import com.sinnarycious.emart24.member.model.vo.Member;

public interface MemberService {
	
	Member selectOneMember(Member m);
	
	int updateMember(Member member);

	List<Member> searchId(Member m);
	
	List<Member> searchPwd(Member m);

}
