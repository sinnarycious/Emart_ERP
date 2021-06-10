package com.sinnarycious.emart24.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sinnarycious.emart24.member.model.dao.MemberDAO;
import com.sinnarycious.emart24.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
<<<<<<< HEAD

	@Override
	public Member selectOneMember(Member m ) {
		
		System.out.println(m);
		
		return memberDAO.selectOneMember(m);
	}
=======
>>>>>>> refs/remotes/origin/kjw1302

	@Override
	public int updateMember(Member member) {
		
		return memberDAO.updateMember(member);
	}
}
