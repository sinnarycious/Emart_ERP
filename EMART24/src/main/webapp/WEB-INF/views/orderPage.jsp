<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이마트24</title>
<link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
<link rel="stylesheet" href="/emart24/resources/css/common/nav.css">
<link rel="stylesheet" href="/emart24/resources/css/orderPage.css">
</head>
<body>
	
	<c:import url="common/nav.jsp" />
		
	<c:import url="common/header.jsp" />
	
	
    <div class="area orderPage">
        <h2>발주 관리</h2>

        <h3 class="order_h3">발주 신청</h3>

        <!-- 검색창 -->
        <form action="searchBar.do" method="get" class="searchBar" onsubmit="searchList(); return false;">
            <!-- 상품카테고리 -->
            <h4>상품 카테고리 &nbsp;</h4> 
            <div class="category">
                <select name="Pdt" id="Pdt">
                	<option value="전체" >-- 전체 --</option>
                    <option value="음료">음료</option>
                    <option value="냉동식품">냉동식품</option>
                    <option value="편의물품">편의물품</option>
                    <option value="과자">과자</option>
                    <option value="간편식">간편식</option>
                </select>
            </div>
            <!-- 상품 카테고리 끝 -->

            <!-- 상품 번호 -->
            <h4>상품 번호 &nbsp;</h4>
            <div class="pdtNo">
                <input type="number" id="pdtNo_num" name = "proNo">
            </div>
            <!-- 상품 번호끝 -->

            <!-- 상품명 검색 -->
            <h4>상품명 &nbsp;</h4>
            <div class="search">
                <input type="text" name="proName" class="search_text">
            </div>
            <!-- 상품명 검색 끝-->

            <!-- 버튼 -->
            <button class="btn click" id="search_btn">검색</button>
        </form>
        <!-- 검색창 끝-->

        <!-- 검색 리스트 -->
        <form action="searchList.do" method="post">
            <table class="searchList">
                <tr>
                    <td class="td1" style="width:120px;"><h4>상품명</h4></td>
                    <td class="order_Product">비비고 고기만두</td>
                    <td class="td1" style="width:70px;"><h4>금액</h4></td>
                    <td style="width:80px;">2,500</td>
                    <td class="td1" style="width:180px;"><h4>수량</h4><input type="number" id="Pdt_Count">
                    </td>
                    <td style="width:110px;padding-right:30px;"><button class="btn click">추가</button></td>
                </tr>
                
                <tr>
                    <td class="td1" style="width:120px;"><h4>상품명</h4></td>
                    <td class="order_Product" name="proName">${product.proName}</td>
                    <td class="td1" style="width:70px;"><h4>금액</h4></td>
                    <td style="width:80px;" name="proPirceE">${product.proPriceE}</td>
                    <td class="td1" style="width:180px;"><h4>수량</h4><input type="number" id="Pdt_Count">
                    </td>
                    <td style="width:110px;padding-right:30px;"><button class="btn click">추가</button></td>
                </tr>
                
            </table>
        </form> 
        <!-- 검색 리스트 끝-->

        <!-- 발주 리스트 -->
        <form action="" style="margin-top: 25px;">
            <table class="table">
                <thead class="thead">
                    <tr>
                        <th style="width:115px;padding-left:45px;">
                            <h4>발주 번호</h4>
                        </th>
                        <th style="width:110px;padding-left:8px;">
                            <h4>상품 번호</h4>
                        </th>
                        <th style="width:676px;">
                            <h4>상품명</h4>
                        </th>
                        <th style="width:60px;">
                            <h4>수량</h4>
                        </th>
                        <th style="width:90px;padding-left:10px">
                            <h4>금액</h4>
                        </th>
                        <th style="padding-left:37px;">
                            <h4>발주 날짜</h4>
                        </th>
                        <th>
                            <h4>삭제</h4>				
                        </th>
                    </tr>
                </thead>
                <tbody class="tbody" id="listTable">
                    <tr>
                        <td style="width:115px;padding-left:45px;">${oe.oeNo}</td>
                        <td style="width:110px;padding-left:8px;">${product.proNo}</td>
                        <td style="width:676px;">${product.proName}</td>
                        <td style="width:60px;">${oe.count}</td>
                        <td style="width:90px;padding-left:10px">5000</td>
                        <td style="padding-left:37px;">${oe.orderDate}</td>
                        <td><button class="btn click" onclick="goOrderDel(this)">삭제</button></td>
                    </tr>
                </tbody>
                <tfoot class="tfoot">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="width:60px;">총 금액</td>
                        <td style="width:90px;padding-left:10px"></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
        </form>
        <!-- 발주 리스트 끝 -->
        
        <!-- 발주 버튼 시작 -->
        <div class="order_btn">
	        <button class="btn submit" type="reset" id="btn_delete">다시 작성</button>
	        <button class="btn submit" type="submit">발주하기</button>
        </div>
        <!--  발주 버튼 끝 -->
    </div>
    <!-- 전체 끝 -->
    
    <!-- script 시작 -->
    <script>
    	
    	// '검색'버튼 클릭 시 검색 리스트에서 추가 
    	
    	searchList();
    	
    	$(document).ready(functionm(){
    		$('#search_btn').click(function(){
    			$.ajax({
    				url: "searchList.do"			// 데이터를 넘겨줄 링크설정
    				type: "GET"						// GET으로 보내도될듯..
    				data : ""						// 넘겨줄 데이터
    				
    			});
    		});
    	});
    	
    	
    	// 발주리스트에서 행 삭제
    	function goOrderDel() {
    		var ths = $(ths);
    		
    		ths.parents("tr").remove();
    	}
    	
    	// 다시 쓰기
    	$(function(){
    		$('#btn_delete').click(function(){
    			$("#listTable").delete();
    		});
    	});
    	
    	
    </script>
    <!-- script 끝 -->
    
    
    
     
</body>
</html>