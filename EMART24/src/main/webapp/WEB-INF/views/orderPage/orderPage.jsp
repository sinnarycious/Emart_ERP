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
	

    <div class="area orderPage">
        <h2>발주 관리</h2>

	<section class="wrap">

        <h3 class="order_h3">발주 신청</h3>

        <!-- 검색창 -->
        <form action="" method="post" class="searchBar">
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
                <input type="number" id="pdtNo_num">
            </div>
            <!-- 상품 번호끝 -->

            <!-- 상품명 검색 -->
            <h4>상품명 &nbsp;</h4>
            <div class="search">
                <input type="text" class="search_text">
            </div>
            <!-- 상품명 검색 끝-->

            <!-- 버튼 -->
            <button class="btn click" id="search_btn">검색</button>

        </form>
        <!-- 검색창 끝-->

        <!-- 검색 리스트 -->
        <form action="">
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
                    <td class="order_Product">${product.proName}</td>
                    <td class="td1" style="width:70px;"><h4>금액</h4></td>
                    <td style="width:80px;">${product.proPriceE}</td>
                    <td class="td1" style="width:180px;"><h4>수량</h4><input type="number" id="Pdt_Count">
                    </td>
                    <td style="width:110px;padding-right:30px;"><button class="btn click">추가</button></td>
                </tr>
                
            </table>
        </form> n
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
                        <td><button class="btn click" onclick="">삭제</button></td>
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
	        <button class="btn submit">다시 작성</button>
	        <button class="btn submit">발주하기</button>
        </div>
        <!--  발주 버튼 끝 -->
    </div>
    <!-- 전체 끝 -->

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

    <!-- script 시작 -->
    <script>
    	
    	
    	$(function) {
    		// 버튼 클릭 시 검색 결과
    		$('#search_btn').on('click', function(){
    			document.
    		});
    		
    		
    		// 버튼 클릭 시 검색 리스트로 전달 (아직 아님)
    		$('.btn click').on('click', function(){
    			document.searchBar.submit();
    		})
    		
    		// 검색 
    		$('.search_text').keyup(function(){
    			
    			
    		})
    	}
    
    
    
    
    
    
    
    
    </script>
    <!-- script 끝 -->
    
    

    	</div>
    </section>
	
</body>
</html>