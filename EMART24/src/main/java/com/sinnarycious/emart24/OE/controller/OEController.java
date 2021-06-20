package com.sinnarycious.emart24.OE.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sinnarycious.emart24.OE.model.service.OEService;
import com.sinnarycious.emart24.OE.model.vo.OE;
import com.sinnarycious.emart24.common.SearchUtils;
import com.sinnarycious.emart24.common.Utils;

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
	@RequestMapping("/OE/searchInfo.do")
	@ResponseBody
	public Map<String, Object> searchInfo(
			@RequestParam (required=false)Date orderDate1,
			@RequestParam (required=false)Date orderDate2,
			@RequestParam (required=false) String oeName,
			@RequestParam (required=false, defaultValue="0") int oeNo 
			){
		
		Map<String, Object> map = new HashMap<String, Object>();
		oeName.replace('_', ' ');

		List<OE> searchList = oeService.searchInfo(orderDate1, orderDate2, oeName, oeNo);
		String pageBar = SearchUtils.getPageBar(searchList.size(), 1, 10, "oe.do", oeName);
		
		System.out.println("search : " + searchList);
		
		map.put("search", searchList);
		map.put("paging", pageBar);
		
		return map;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
	    final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    final CustomDateEditor dateEditor = new CustomDateEditor(df, true) {
	        @Override
	        public void setAsText(String text) throws IllegalArgumentException {
	            if ("today".equals(text)) {
	                setValue(new java.util.Date());
	            } else {
	                super.setAsText(text);
	            }
	        }
	    };
	    binder.registerCustomEditor(Date.class, dateEditor);
	}


	/* 입고 등록하기 */
	@RequestMapping("/OE/updateStatus.do")
	@ResponseBody
	public int updateStatus(
			@RequestParam int oeNo,
			@RequestParam String oeName) {
		
		int result = oeService.updateStastus(oeNo, oeName);
		return result;
	}

	
	// 발주 리스트 보내기 : 가율
	@RequestMapping("/product/orderInsertList.do")
	public ModelAndView orderInsertList(
						 	HttpServletRequest req) {
							// user_no 나중에 추가
		Map map = new HashMap();
		map.put("oeNo", req.getParameter("oeNo"));
		map.put("oeCount", req.getParameter("oeCount"));
		
		ModelAndView mv = new ModelAndView("redirect:/orderPage");
		
		return mv;
	
	}
	
	// 발주리스트 : 가율
	@RequestMapping("/OE/orderList.do")
	public String orderList(@RequestParam (required=false, defaultValue="0") int oeNo) {
	
		OE oe = oeService.orderList(oeNo);
		
		System.out.println("oeNo :" + oeNo );
		
		for (int i = 0; i > 0; i++) {
			
		}
		
		return "orderPage";
	}
	

}
