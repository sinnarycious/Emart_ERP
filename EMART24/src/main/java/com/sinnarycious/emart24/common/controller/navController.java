package com.sinnarycious.emart24.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sinnarycious.emart24.sale.model.service.SaleService;
import com.sinnarycious.emart24.sale.model.vo.Sale;

@Controller
public class navController {

	@Autowired
	SaleService saleService;
	
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
	
	
	
	@RequestMapping("/common/sale.do")
	public String sellPage() {
		System.out.println("/common/sale.do가 호출되었습니다.");
		return "sale";
	}	
	
	
	
	/* 수익 페이지 이동 */
	@RequestMapping("/common/profit.do")
	public String profit(Model model) {
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
