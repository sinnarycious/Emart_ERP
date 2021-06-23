package com.sinnarycious.emart24.inv.controller;


import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sinnarycious.emart24.common.SearchUtils;
import com.sinnarycious.emart24.common.Utils;
import com.sinnarycious.emart24.inv.model.service.InvService;
import com.sinnarycious.emart24.inv.model.vo.Inv;

@Controller
public class InvController {

	@Autowired
	InvService invService;

	 @RequestMapping("/inv/inv.do")
		public String event(
				@RequestParam( required=false, defaultValue="1") int cPage,
				Model model
				) {
			
			int numPerPage = 10;		
			List<Map<String, String>> list = invService.selectInvList(cPage, numPerPage);
			
			int totalContents = invService.selectInvTotalContents();
			
			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "inv.do");
			
			System.out.println("list : " + list);
			
			model.addAttribute("list", list);
			model.addAttribute("totalContents", totalContents);
			model.addAttribute("numPerPage", numPerPage);
			model.addAttribute("pageBar", pageBar);
			
			return "inv";
			
		}
	 
	 @RequestMapping("/inv/searchInfo.do")
		@ResponseBody
		public Map<String, Object> searchInfo(
				@RequestParam( required=false, defaultValue="1") int cPage,
				@RequestParam (required=false, defaultValue="0") int invCatNo,
				@RequestParam (required=false, defaultValue="0") int invNo,
				@RequestParam (required=false, defaultValue="") String invName
				){
		 	int numPerPage = 10;
			Map<String, Object> map = new HashMap<String, Object>();
			invName.replace('_', ' ');
			int searchTotalContent = invService.searchTotalContent(invCatNo, invNo, invName);
			List<Inv> searchList = invService.searchInfo(cPage, numPerPage, invCatNo, invNo, invName);
			String pageBar = SearchUtils.getPageBar(searchTotalContent, cPage, 10, "inv.do", invName);
			
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
		
		@RequestMapping("/inv/updateWarehouse.do")
		@ResponseBody
		public int updateWarehouse(
				@RequestParam int invNo,
				@RequestParam int count
				){
		 	int result = 0;
		 	Inv inv = new Inv();
		 	inv.setInvNo(invNo);
		 	inv.setInvWCount(count);
		 	result = invService.updateWarehouse(inv);
		 	
			return result;
		}
		
		@RequestMapping("/inv/updateStock.do")
		@ResponseBody
		public int updateStock(
				@RequestParam int invNo,
				@RequestParam int count
				){
			int result = 0;
		 	Inv inv = new Inv();
		 	inv.setInvNo(invNo);
		 	inv.setInvSCount(count);
		 	result = invService.updateStock(inv);
		 	
			return result;

		}

}
