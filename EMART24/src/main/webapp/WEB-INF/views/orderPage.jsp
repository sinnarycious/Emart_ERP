<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <form action="${pageContext.request.contextPath }/product/searchBar.do" method="get" class="searchBar">
            <!-- 상품카테고리 -->
            <h4>상품 카테고리 &nbsp;</h4> 
            <div class="category">
                <select name="proCatNo" id="Pdt">
                	<option value="0" >-- 전체 --</option>
                    <option value="1">음료</option>
                    <option value="2">냉동식품</option>
                    <option value="3">편의물품</option>
                    <option value="4">과자</option>
                    <option value="5">간편식</option>
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
        <form action="resultList.do" method="post">
            <table class="resultList">
             	<c:if test="${product != null}">
             		<c:forEach var="product" items="${product}">
		                <tr>
		                    <td class="td1" style="width:120px;"><h4>상품명</h4></td>
		                    <td class="order_Product" name="proName" id="proName">${product.proName}</td>
		                    <td class="td1" style="width:70px;"><h4>금액</h4></td>
		                    <td style="width:80px;" name="proPirceE" id="proPirceE">${product.proPriceE}</td>
		                    <td class="td1" id="updown" style="width:180px;"><h4>수량</h4><input type="number" id="Pdt_Count" value="0">
		                    </td>
		                    <td style="width:110px;padding-right:30px;"><button class="btn click" id="addProduct">추가</button></td>
		                </tr>
		            </c:forEach>
                </c:if>
            </table>
        </form> 
        <!-- 검색 리스트 끝-->

        <!-- 발주 리스트 -->
        <form action="orderList.do" style="margin-top: 25px;">
            <table class="table" id="orderList">
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
                        <td style="width:676px;">${oe.oeName}</td>
                        <td style="width:60px;">${oe.count}</td>
                        <td class="sum" style="width:90px;padding-left:10px"></td>
                        <td style="padding-left:37px;">${oe.orderDate}</td>
                        <td><button class="btn click" id="orderDel" onclick="goOrderDel(this)">삭제</button></td>
                    </tr>
                </tbody>
                <tfoot class="tfoot">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td id="sum_p_price" style="width:60px;">총 금액</td>
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
    	$('#search_btn ').on('click', function(){
    		var proName = $("proName").val();
    		var proPriceE = $("proPriceE").val();
			
    		if(proName != null) {
    			$.ajax({
    				url : "${pageContext.request.contextPath}/OE/orderInsertList.do",
    				type : "get",
    				data : {
    					proName : proName,
    					proPriceE : proPriceE
    				},
    				dataType : 'json'
    				success : function(data) {
    					alert("전송 성공");
    					
    					$('tbody').empty();		// 한번 비우고 시작해야함;
    					var $tr = $('<tr>');
    					
    					
    				
    					console.log(searchList);
    				}, error : function(error) {
    					alert("전송 실패");
    				}
    			});
    		}
    		
		});
    	
    	// '추가'버튼 클릭 시 검색 결과 리스트 전달하기
    	
    	
    	// 수량 클릭시 
    	document.querySelectorAll('.updown').forEach(
			
    		function(item, idx) {
    			// 수량 증가 화살표 클릭
    			item.childern[1].addEventListener('click', function(){
    				resultList.changePNum(idx+1);
    			});
    			
    			// 수량 감소 화살표 클릭
    			item.childeren[2].addEventListener('clcik', function(){
    				resultList.changePNum(idx-1);
    			});
    			
    		}
		
    	);
		$('#addProduct').on('click', function(){
    		
    		sum_p_price
    		
    	});
    	
    	
    	document.addEventListener('DOMContentLoaded', function(){
    	// 발주리스트에서 행 삭제
    	/* function goOrderDel() {
    		var ths = $(ths);
    		
    		ths.parents("tr").remove();
    	}z
    	*/
    	// 삭제 버튼 클릭
    	document.querySelectorAll('.table tbody').forEach(
    		fucntion(item) {
    			item.EventListener('click', function(){
    				.delItem();
    			});
    		}	
    	
    	);
    	
    	
    	// '추가'버튼 클릭 시 발주 리스트에 추가
    	fucntion addRow() {
    		const table = document.getElementById('orderList');
    		
    		// 행추가
    		const newRow = table.insertRow();
    		
    		// 새 행에 cell 추가
    		const newCell1 = newRow.inserCell(0);
    		const newCell2 = newRow.inserCell(1);
    		const newCell3 = newRow.inserCell(2); 
    		const newCell4 = newRow.inserCell(3); 
    		const newCell5 = newRow.inserCell(4); 
    		const newCell6 = newRow.inserCell(5); 
    		
    		// cell 텍스트 추가(필요한가..?)
    		newCell.innnerText = "";
    		newCell.innserText = "";
    	}
    	
    	});
    	// '다시쓰기' 버튼
    	$(function(){
    		$('#btn_delete').click(function(){
    			$("#listTable").delete();
    			
    		});
    	});
    	// document.querySelector('').addEventListener('click', function(){
    	// tbody.delAllt})
    	
    	
    	// '발주하기' 버튼
    	// OE/oe.do
    	
    </script>
    <!-- script 끝 -->
    
    
    
     
</body>
</html>