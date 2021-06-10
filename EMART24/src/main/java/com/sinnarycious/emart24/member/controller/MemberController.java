package com.sinnarycious.emart24.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sinnarycious.emart24.member.model.vo.Member;
import com.sinnarycious.emart24.member.model.service.MemberService;

@SessionAttributes({"member"}) 
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {
		
		int result = memberService.updateMember(member);
		
		String loc= "/";
		String msg = "";
		
		if( result > 0 ) {
			msg = "마이페이지 수정 완료ㅎㅎ";
			model.addAttribute("member", member);
		} else {
			msg = "마이페이지 수정 실패ㅠㅠ";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
}

