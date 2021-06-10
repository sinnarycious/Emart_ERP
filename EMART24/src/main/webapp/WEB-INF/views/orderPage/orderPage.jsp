<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
<link rel="stylesheet" href="/emart24/resources/css/common/header.css" />
<link rel="stylesheet" href="/eamrt24/resources/css/common/nav.css" />
<title>Insert title here</title>
</head>
<body>
	
	<c:import url="views/common/nav.jsp" />
		
	<c:import url="views/common/header.jsp" />
	
    <div class="area orderPage">
        <h2>발주 관리</h2>

        <h3 class="order_h3">발주 신청</h3>

        <!-- 검색창 -->
        <form action="search.do" method="post" class="searchBar">
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
                <tbody class="tbody">
                    <tr>
                        <td style="width:115px;padding-left:45px;">51</td>
                        <td style="width:110px;padding-left:8px;">13</td>
                        <td style="width:676px;">젤리</td>
                        <td style="width:60px;">5</td>
                        <td style="width:90px;padding-left:10px">5000</td>
                        <td style="padding-left:37px;">6월 6일</td>
                        <td><button class="btn click" onclick="goOrderDel">삭제</button></td>
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
	        <button class="btn submit" type="reset">다시 작성</button>
	        <button class="btn submit" type="submit">발주하기</button>
        </div>
        <!--  발주 버튼 끝 -->
    </div>
    <!-- 전체 끝 -->
    
    <!-- script 시작 -->
    <script>
    	
    	const Searching = Search.prototype;
    
    	function Search() {
    		this.engine = document.querySelector('input[name="Pdt"]')			// 상품명 카테고리
    		this.keyword = document.querySelector('input[name="proNo"]')		// 상품명 번호
    		this.keyword = document.querySelector('input[name="proName"]')		// 상품명 
    		this.button = document.querySelector('#search_btn')					// 검색 버튼
    		this.form = document.querySelector('.searchBar')					// 검색창 form		
    	}
    	
    	new Search();
    	
    	// 검색 결과 주소로 이동하는 함수
    	Searching.Engine = function() {
    		this.form.addEventListener('submit', e => {
    			
    			e.preventDefault();
    			
    			let engine = this.engine.value;
    			let keyword = this.keyword.value;
    			
    			if (engine === '')
    			
    		});
    	}
    	
    	$(function(){
    		$('#search_btn').click(function(){
    			self.location = "li"
    		});
    	});
    
    	
    	// 검색 리스트
		$.ajax({
			url : "${pageContext.request.contextPath}/oe/"
			data : {}
		});
    
    </script>
    <!-- script 끝 -->
    
    
    
     
</body>
</html>