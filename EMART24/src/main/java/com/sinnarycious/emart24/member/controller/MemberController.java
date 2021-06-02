package com.sinnarycious.emart24.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sinnarycious.emart24.member.model.service.MemberService;

@SessionAttributes({"member"}) 
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
}
