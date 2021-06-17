package com.sinnarycious.emart24.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class navController {

	/* 마이페이지 이동 */
	@RequestMapping("/common/mypage.do")
	public String myPage() {
		System.out.println("/common/mypage.do가 호출되었습니다.");
		return "mypage";
	}
	
	/* 발주 신청 이동 */
	@RequestMapping("/common/orderPage.do")
	public String orderPage() {
		System.out.println("/common/orderPage.do가 호출되었습니다.");
		return "orderPage";
	}
	
	/* 입고 관리 이동 
	@RequestMapping("/common/oe.do")
	public String oe() {
		System.out.println("/common/oe.do가 호출되었습니다.");
		return "oe";
	}
	*/
	
	/* 재고 관리 이동 */
	@RequestMapping("/common/inv.do")
	public String inv() {
		System.out.println("/common/inv.do가 호출되었습니다.");
		return "inv";
	}
	
	
	/* 판매 관리 이동 
	@RequestMapping("/common/sellPage.do")
	public String sellPage() {
		System.out.println("/common/sellPage.do가 호출되었습니다.");
		return "sellPage";
	}	
	*/
	
	
	/* 수익 페이지 이동 */
	@RequestMapping("/common/profit.do")
	public String profit() {
		System.out.println("/common/profit.do가 호출되었습니다.");
		return "profit";
	}	
	
	/* 행사 공지 이동 */
	@RequestMapping("/common/eventPage.do")
	public String eventPage() {
		System.out.println("/common/eventPage.do가 호출되었습니다.");
		return "eventPage";
	}
	
}
