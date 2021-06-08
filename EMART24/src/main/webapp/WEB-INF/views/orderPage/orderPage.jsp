<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	
	<c:import url="common/nav.jsp" />
		
	<c:import url="common/header.jsp" />
	
	<section class="wrap">

        <div class="area oeArea">
	
		    <div class="h_one"><h2>발주 관리</h2></div>
	    <br>
	    <div class="h_th"><h3>발주 신청</h3></div>
	    <br>
	    <!-- 검색창 -->
	    <form action="" method="post" class="searchBar">
	        <!-- 상품카테고리 -->
	        <h4>상품 카테고리</h4>
	        <div class="category">
	            <select name="Pdt" id="Pdt">
	                <option value="음료">음료</option>
	                <option value="냉동식품">냉동식품</option>
	                <option value="편의물품">편의물품</option>
	                <option value="과자">과자</option>
	                <option value="간편식">간편식</option>
	            </select>
	        </div>
	        <!-- 카테고리 끝 -->
	        
	        <!-- 상품 번호 -->
	        <h4>상품 번호</h4>
	        <div class="pdtNo">
	            <!-- 뭘로 줄지 고민 -->
	            <input type="text" name="" id="">
	        </div>
	        <!-- 상품 번호끝 -->
	
	        <!-- 상품명 -->
	        <h4>상품명</h4>
	        <div class="search">
	            <input type="text" class="search_text">
	        </div>
	        <!-- 상품명 끝-->
	
	        <!-- 버튼 -->
	        <button class="btn click">검색</button>
	        
	    </form>
	    <!-- 검색창 끝-->
	    <br>
	    <!-- 검색 리스트 -->
	    <form action="">
	        <div class="serchList">
	            <table>
	                <td>상품명</td>
	                <td></td>
	                <td>금액</td>
	                <td></td>
	                <td>수량</td>
	                <td><input type="number" name="" id=""></td>
	                <td><button class="btn click">추가</button></td>
	            </table>  
	        </div>
	    </form>
	    <!-- 검색 리스트 끝-->
	    <br>
	    <!-- 발주 리스트 -->
	    <form action="">
	        <table class="table">
	            <thead class="thead">
	                <tr>
	                    <th>발주 번호</th>
	                    <th>상품 번호</th>
	                    <th>상품명</th>
	                    <th>수량</th>
	                    <th>금액</th>
	                    <th>발주 날짜</th>
	                    <th>삭제</th>
	                </tr>
	            </thead>
	            <tbody class="tbody">
	                <tr>
	                    <td>51</td>
	                    <td>13</td>
	                    <td>젤리</td>
	                    <td>5</td>
	                    <td>5000</td>
	                    <td>6월 6일</td>
	                    <td><button class="btn click">삭제</button></td>
	                </tr>
	            </tbody>
	            <tfoot class="tfoot">    
	                <tr>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td>총 금액</td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                </tr>
	            </tfoot>  
	        </table>
	    </form>
	    <!-- 발주 리스트 끝 -->
	    
	
	    <button class="btn submit">다시 작성</button>
	    <button class="btn submit">발주하기</button>
    
    	</div>
    </section>
	
	
</body>
</html>