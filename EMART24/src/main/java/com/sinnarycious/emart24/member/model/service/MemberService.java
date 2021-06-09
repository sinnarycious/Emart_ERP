package com.sinnarycious.emart24.member.model.service;

import com.sinnarycious.emart24.member.model.vo.Member;

public interface MemberService {
	
	Member selectOneMember(String userId);
	
	int updateMember(Member member);

}
