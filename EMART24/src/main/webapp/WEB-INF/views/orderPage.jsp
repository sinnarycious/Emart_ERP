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
<script src="/emart24/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	
	<c:import url="common/nav.jsp" />
		
	<c:import url="common/header.jsp" />
	
	<!-- 전체 시작 -->
    <div class="area orderPage">
        <h2>발주 관리</h2>

        <h3 class="order_h3">발주 신청</h3>

        <!-- 검색창 -->
        <div class="searchBar">
            <!-- 상품카테고리 -->
            <h4>상품 카테고리 &nbsp;</h4> 
            <div class="searchBar">
                <select name="proCatNo" id="proCatNo">
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
                <input type="number" id="proNo" name = "proNo">
            </div>
            <!-- 상품 번호끝 -->

            <!-- 상품명 검색 -->
            <h4>상품명 &nbsp;</h4>
            <div class="search">
                <input type="text" name="proName" class="search_text" id="proName">
            </div>
            <!-- 상품명 검색 끝-->

            <!-- 버튼 -->
            <button class="btn click" id="search_btn">검색</button>
       	</div>
        <!-- 검색창 끝-->

        <!-- 검색결과 리스트 -->
        <div class="resultArea">
	        <form action="resultList.do" method="post">
				<!-- 여기 CSS 수정하기 class명 다르게 주기 -->
	            <table class="resultList" id="resultList">
	             	<c:if test="${product != null}">
	             		<c:forEach var="product" items="${product}">
			                <tr>
			                    <td class="td1" style="width:120px;"><h4>상품명</h4></td>
			                    <td class="order_Product" name="proName" id="proName">${product.proName}</td>
			                    <td class="td1" style="width:70px;"><h4>금액</h4></td>
			                    <td style="width:80px;" name="proPriceE" id="proPriceE">
			                    	<input type="hidden" class="originalPrice" value="${product.proPriceE}">
			                    	<span class="calcPrice">${product.proPriceE}</span>
			                    </td>
			                    <td class="td1" id="updown" style="width:180px;"><h4>수량</h4><input class="qty" type="number" id="Pdt_Count" value="1" min="1">
			                    </td>
			                    <td style="width:110px;padding-right:30px;"><button class="btn click" id="addProduct">추가</button></td>
			                </tr>
			            </c:forEach>
	                </c:if>
	            </table>
	
	        </form>
        </div>
        <!-- 검색결과 리스트 끝-->
	
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
                        <td style="width:60px;">${oe.oeCount}</td>
                        <td class="sum" style="width:90px;padding-left:10px"></td>
                        <td style="padding-left:37px;">${oe.orderDate}</td>
                        <td><button class="btn click" id="orderDel" onclick="goOrderDel(this)">삭제</button></td>
                    	<!-- onclick 없애보기 -->
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
    	$('#proName').on('keyup', function(event){
    		if(event.keyCode == 13) {
    			$('#search_btn').click();
    		}
    	});
    	
    	$('.resultList .qty').on('change',function(){
    		var price = Number($(this).parent().parent().find('.originalPrice').val());
    		$(this).parent().parent().find('.calcPrice').text($(this).val() * price);
    		console.log(price);
    		console.log($(this).val() * price);
    	});
    	
    	$('#search_btn').on('click', function(){
    		var proName = $("#proName").val();
    		var proCatNo = $("#proCatNo").val();
    		var proNo = $("#proNo").val();
    		var proPriceE = $('#proPriceE').val();
    		var pdt_Count = $('#pdt_Count').val();
    		
			// console.log(proName);
			// console.log(proCatNo);
			// console.log(proNo);
    		if(proName != null) {
    			$.ajax({
    				url : "${pageContext.request.contextPath }/product/searchBar.do",
    				type : "get",
    				data : {
    					proName : proName,
    		    		proCatNo : proCatNo,
    		    		proNo : proNo
    				},
    				dataType : 'json',
    				success : function(data) {
    					alert("전송 성공");		// 나중에 삭제
    					
    					$('#resultList').empty();	
    			
    					var search = data.searchPdList;
    					console.log(search.proName);
    					console.log(search.proPriceE);
    					// 검색리스트 반복문
    					for(var i in search) {
    						var $tr = $('<tr>');
    						
    						var $h4 = $('<td class="td1" style="width:120px;"><h4>상품명</h4></td>');
    						var $proName = $('<td class="order_Product" name="proName" id="proName">' + search[i].proName + '</td>');
    						var $price = $('<td class="td1" style="width:70px;"><h4>금액</h4></td>');
    						var $proPriceE = $('<td sytle="width:80px;" name="proPriceE" id="proPriceE">'
    						                   +'<input type="hidden" class="originalPrice" value="' + search[i].proPriceE + '">'
			                    	+'<span class="calcPrice">' + search[i].proPriceE + '</span></td>');
    						var $td1 = $('<td class="td1" id="updown" style="width:180px;"><h4>수량</h4><input type="number" class="qty" id="Pdt_Count" value="0"</td>');
    						var $btn = $('<td style="width:110px; pdding-right:30px;"<button class="btn click" id="addProduct">추가</button></td></tr>');
    						
    						$tr.append($h4);
    						$tr.append($proName);
    						$tr.append($price);
    						$tr.append($proPriceE);
    						$tr.append($td1);
    						$tr.append($btn);
    						
    						
    						$('#resultList').append($tr);

    				    	$('.resultList .qty').on('change',function(){
    				    		var price = Number($(this).parent().parent().find('.originalPrice').val());
    				    		$(this).parent().parent().find('.calcPrice').text($(this).val() * price);
    				    		console.log(price);
    				    		console.log($(this).val() * price);
    				    	});
    				    	
    					}
    					// var PDTcount = $('.td1>input:number').$(this).val();
    					console.log(PDTcount);
    					console.log(search);
    				}, error : function(error) {
    					alert("전송 실패");
    				}
    			});
    		}
    		
		});
    	
    	// '추가'버튼 클릭 시 검색 결과 리스트 전달하기
    	$('#addProduct').on('click', function(){
    		var oeNo = $('#oeNo').val();
    		var proNo = $('#proNo').val();
    		var oeName = $('#oeName').val();
    		var oeCount = $('#oeCount').val();
    		var orderDate = $('#orderDate').val();
    		var oePrice = $('#proNo').val();
    		
    		console.log(oeNo);
    		
    		var $tr = $('<tr>');
            var oeNo =$('<td style="width:115px;padding-left:45px;">' + oeNo + '</td>');
            var proNo = $('<td style="width:110px;padding-left:8px;">'+ proNo + '</td>');
            var oeName =$('<td style="width:676px;">' + oeName + '</td>');
            var oeCount =$('<td style="width:60px;">' + oeCount + '</td>');
            var sum =  $('<td class="sum" style="width:90px;padding-left:10px">' + oePriceE + '</td>');
            var orderDate = $('<td style="padding-left:37px;">' + orderDate + '</td>');
            var btn2 = $('<td><button class="btn click" id="orderDel" onclick="goOrderDel(this)">삭제</button></td></tr>');
        	
            $tr.append($oeNo);
            $tr.append($proNo);
            $tr.append($oeName);
            $tr.append($oeCount);
            $tr.append($td1);
            $tr.append($orderDate);
            $tr.append($btn2);
    		
            
            $('tbody').append($tr);
    	});
    	
    	
    	/*
    	// 수량 클릭시 
    	document.querySelectorAll('.updown').forEach(
			
    		function(oeCount, idx) {
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
    	function goOrderDel() {
    		var ths = $(ths);
    		
    		ths.parents("tr").remove();
    	}
    	// 하나만 삭제
    	$('#orderDel').on('click', function(){
    		$('tbody').remove('.tbody');
    	});
    	
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
    	*/
    </script>
    <!-- script 끝 -->
    
    
    
     
</body>
</html>