package com.sinnarycious.emart24.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.sinnarycious.emart24.member.model.service.MemberService;
import com.sinnarycious.emart24.member.model.vo.Member;

@SessionAttributes({"member"}) 
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	// 로그인 기능
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
	// 로그인 기능 끝
	
	// 아이디 비밀번호 찾기 페이지
		@RequestMapping("/member/memberFind.do")
		public String memberFind() {		
			
			return "memberFind";
		}
	// 아이디 비밀번호 찾기 페이지 끝
	
	// 아이디 찾기
	@RequestMapping("/member/searchId.do")
	@ResponseBody
	public Map<String, Object> showmemberFindId(
			@RequestParam String userName,
			@RequestParam String userEmail
			) {


		Map<String, Object> map = new HashMap<String, Object>();
		
		Member m = new Member(userName, null, userEmail);
		
		List<Member> result = memberService.searchId(m);
		
		System.out.println("아이디 : " + result);
		
		map.put("userId", result);
		
		return map;

	}
	// 아이디 찾기 기능 끝
	

	// 비밀번호 찾기
	@RequestMapping("/member/searchPwd.do")
	@ResponseBody
	public Map<String, Object> showmemberFindPwd(
			@RequestParam String userId,
			@RequestParam String userEmail
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Member m = new Member(null, userId, userEmail);
		
		List<Member> result = memberService.searchPwd(m);
		
		System.out.println("비밀번호 : " + result);
		
		map.put("userPwd", result);
		
		return map;
	}
	// 비밀번호 찾기 기능 끝
	

	// 로그아웃 기능
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status) {
		System.out.println("로그아웃기능 호출");
		// HttpSession --> session.invalidate() (세션 무효화)
		// SessionStatus --> status.setComplete() (세션 만료)
		if( ! status.isComplete() ) {
			status.setComplete();
		}
		
		return "redirect:/";
	}
	// 로그아웃 기능 끝
	
	
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

