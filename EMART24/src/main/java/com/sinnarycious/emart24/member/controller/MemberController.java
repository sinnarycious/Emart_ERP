package com.sinnarycious.emart24.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(
			@RequestParam String userId,
			@RequestParam String userPwd,
			Model model				
		) {
		System.out.println("로그인 됐음? 안됨?");
		
		Member m = new Member(userId, userPwd);
		
		System.out.println(m);
		
		Member result = memberService.selectOneMember(m);
	
		System.out.println("조회결과" + result);
		
		String loc = "/";
		String msg = "";
		
		// result가 null 이 아니라면 (로그인할 시 )
		if (result != null) {
			// 우리가 입력한 비밀번호와 데이터베이스에서 가져온 비밀번호가 같다면
				loc = "/main/main.do";
				msg = "로그인 성공";
				model.addAttribute("member", result);	// 마치 세션처럼 동작한다.
				// @SessionAtributes 어노테이션에 의해 
				// "member"라는 값은 세션에 저장됨
				
			
		} else {
			msg = "아이디와 비밀번호를 확인해주세요.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";

		
	}
	

	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {
		
		int result = memberService.updateMember(member);
		
		String loc= "/";
		String msg = "";
		
		if( result > 0) {
			loc = "/main/main.do";
			msg = "마이페이지 수정 완료!";
			model.addAttribute("member", member);
		} else {
			msg = "마이페이지 수정 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
}

