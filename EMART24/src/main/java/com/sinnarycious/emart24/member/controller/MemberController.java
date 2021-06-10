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
		
		Member result = memberService.selectOneMember(userId);
		
		String pwd = m.getUserPwd();
		
		System.out.println("조회결과" + result);
		
		String loc = "/";
		String msg = "";
		
		// result가 null 이 아니라면 (로그인할 시 )
		if (result != null) {
			// 우리가 입력한 비밀번호와 데이터베이스에서 가져온 비밀번호가 같다면
			if (userPwd.equals(pwd)){
				msg = "로그인 성공";
				model.addAttribute("member", result);	// 마치 세션처럼 동작한다.
				// @SessionAtributes 어노테이션에 의해 
				// "member"라는 값은 세션에 저장됨
			} else {
				// 아이디는 맞았는데 비밀번호가 틀림
				msg = "비밀번호가 일치하지 않습니다.";
			}
		} else {
			msg = "존재하지 않는 아이디입니다.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";

		
	}
	

	@RequestMapping("/member/memberView.do")
	public String memberView(@RequestParam String userId, Model model) {
		
		Member result = memberService.selectOneMember(userId);
		
		model.addAttribute("member", result);
		
		return "member/memberView";
	}
		

	
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {
		
		int result = memberService.updateMember(member);
		
		String loc= "/";
		String msg = "";
		
		if( result > 0 ) {
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
