package com.sinnarycious.emart24.OE.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sinnarycious.emart24.OE.model.service.OEService;
import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.common.Utils;
import com.sinnarycious.emart24.product.model.vo.Product;

@Controller
public class OEController {

	@Autowired
	OEService oeService;
	
	/* 입고 관리 이동 (페이지) */
	@RequestMapping("/OE/oe.do")
	public String oe(
			@RequestParam( required=false, defaultValue="1") int cPage,
			Model model
			) {

		int numPerPage = 10;
		List<Map<String, String>> list = oeService.selectOEList(cPage, numPerPage);
		
		int totalContents = oeService.selectOETotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "oe.do");
		
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "oe";
	}

	
	/* 조회 기능 */
	@RequestMapping("/OE/searchList.do")
	public String searchList(
			@RequestParam Date orderDate1,
			@RequestParam Date orderDate2,
			@RequestParam int oeNo,
			@RequestParam String oeName,
			Model model
			) {
		
		List<OE> list = oeService.selectSearchList();
		
		System.out.println("search : " + list);
		
		model.addAttribute("list", list);
		
		
		return "";
	}


	/* 입고 등록하기 */
	@RequestMapping("OE/updateStatus.do")
	public String updateStatus() {
		
		return "";
	}

	
	// 발주 다시 작성 : 가율
	@RequestMapping("/OE/resetList.do")
	public String resetList(@RequestParam int oeNo,
							HttpServletRequest req, Model model) {
		
		int result = oeService.resetList(oeNo);
		
		String loc = "";
		String msg = "";
		
		if (result > 0) {
			
		}
		
		
		
		return "common/msg";
	}
	
	// 발주 리스트 : 가율
	@RequestMapping("/product/orderInsertList.do")
	public String orderInsertList(
						 	@RequestParam int oeInvNo,
							 @RequestParam String oeName,
							 @RequestParam int oePrice,
							 @RequestParam Date orderDate,
							 @RequestParam int oeCatNo,
							 Model model) {
							// user_no 나중에 추가
		
		OE oe = new OE(oeInvNo, oeName, orderDate, oePrice, oeCatNo);
		
		List<OE> list = oeService.orderInsertList(oe);
		
		System.out.println("리스트" + list);
		
		model.addAttribute("list", list);
		
		return "orderPage";
	}
	

}
