package com.sinnarycious.emart24.member.model.service;

import com.sinnarycious.emart24.member.model.vo.Member;

public interface MemberService {
	
	
	
	int updateMember(Member member);

	Member selectOneMember(String userId);
	

}
