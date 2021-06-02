package com.sinnarycious.emart24.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinnarycious.emart24.member.model.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
}
