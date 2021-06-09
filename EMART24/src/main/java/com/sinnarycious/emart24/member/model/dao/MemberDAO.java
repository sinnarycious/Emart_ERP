package com.sinnarycious.emart24.member.model.dao;

import com.sinnarycious.emart24.member.model.vo.Member;

public interface MemberDAO {
	
	Member selectOneMember(String userId);
	
	int updateMember(Member member);

}
