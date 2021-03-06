<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/emart24/resources/images/emart.ico">
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
    <div class="area orderPage" style="margin-left: 17%">

        <h2>발주 관리</h2>

        <h3 class="order_h3">발주 신청</h3>

        <!-- 검색창 -->
      	<div class="searchBar">
            <!-- 상품카테고리 -->
            <h4>상품 카테고리 &nbsp;</h4> 

            <div class="selectBar">
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
            <h4 style="margin-left : 20px;">상품 번호 &nbsp;</h4>
            <div class="pdtNo">
                <input type="number" id="proNo" name = "proNo">
            </div>
            <!-- 상품 번호끝 -->

            <!-- 상품명 검색 -->
            <h4>상품명 &nbsp;</h4>
            <div class="search">
                <input type="text" name="proName" class="proName" id="proName" >
            </div>
            <!-- 상품명 검색 끝-->

            <!-- 버튼 -->
            <button class="btn click" id="search_btn">검색</button>

		</div>

        <!-- 검색창 끝-->


        <!-- 검색결과 리스트 -->
        <div class="resultArea">
	       <!--  <form action="resultList.do" method="post"> -->
				<!-- 여기 CSS 수정하기 class명 다르게 주기 -->
	            <table class="resultList" id="resultList">
	            	<!-- 
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
					 -->
	            </table>
	
        </div>
        <!-- 검색결과 리스트 끝-->

        <!-- 발주 리스트 -->
        <div style="margin-top: 25px;">
            <table class="orderList" id="orderList">
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
                <input type="hidden" name="userNo" value="${ member.userNo }" />
                 <!--   
                    <tr>
                        <td style="width:115px;padding-left:45px;" class="oeNo" id="oeNo" name="oeNo">${oe.oeNo}</td>
                        <td style="width:110px;padding-left:8px;" id="proNo" name="proNo">${product.proNo}</td>
                        <td style="width:676px;" id="oeName" name="oeName">${oe.oeName}</td>
                        <td style="width:60px;" id="oeCount" name="oeCount">${oe.oeCount}</td>
                        <td class="mul" id="mul" name="mul" style="width:90px;padding-left:10px"></td>
                        <td style="padding-left:37px;" id="orderDate" name="orderDate">${oe.orderDate}</td>
                        <td><button class="btn click" id="orderDel" onclick="goOrderDel(this)">삭제</button></td>
                    </tr> 
                    -->
                </tbody>
                <tfoot class="tfoot">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="sumPrice" id="sum_p_price" style="width:60px;">총 금액</td>
                        <td class="sumPriceResult"style="width:90px;padding-left:10px"></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
            
            <!-- 발주 버튼 시작 -->
        	<div class="order_btn">
		        <button class="btn submit reWrite" type="reset" class="reWrite" id="reWrite">다시 작성</button>
		        <button class="btn submit orderBtn" id="orderBtn" type="submit">발주하기</button>
       		</div>
        <!--  발주 버튼 끝 -->
        </div>
        <!-- 발주 리스트 끝 -->
        
    
    </div>
    <!-- 전체 끝 -->
    
    <!-- script 시작 -->
    <script>
	var sumPrice = 0;
    
    
	// '검색'버튼 클릭 시 검색 리스트에서 추가 
	$('#proName').on('keyup', function(event){
		if(event.keyCode == 13) {
			$('#search_btn').click();
		}
	});
	
	
	$('.resultList .qty').on('change', function(){
		var price = Number($(this).parent().parent().find('.originalPrice').val());
		$(this).parent().parent().find('.calcPrice').text($(this).val() * price);
		console.log(price);
		console.log($(this).val() * price);
	});

	$('#search_btn').on('click', function() {
		var proName = $('#proName').val();
		var proCatNo = $('#proCatNo').val();
		var proNo = $('#proNo').val();
		var proPriceE  = $('#proPriceE').val();
		var pdt_Count = $('#pdt_Count').val();
	
	<!-- 카테고리랑 발주번호를 클릭 시 이름을 못불러옴 -->
	
	
		 console.log(proName);
		 console.log(proCatNo);
		 console.log(proNo);
		 
		$.ajax({
    		url : "${pageContext.request.contextPath}/product/searchBar.do",
    		type : "get",
    		data : {
    			proName : proName,
	    		proCatNo : proCatNo,
	    		proNo : proNo
    		},
    		dataType : 'json',
    		success : function(data) {
    			// 나중에 삭제
    			
    			$('#resultList').empty();	
    	
    			var search = data.selectPdList;
    			
    			// 검색리스트 반복문
    			for(var i in search) {
    				var $tr = $('<tr>');
    				
    				var $proNo = $('<input type="hidden" class="proNum" id="proNo"  value="' + search[i].proNo + '">');
    				var $proCatNo = $('<input type="hidden" class="proCatNo" id="proCatNo"  value="' + search[i].proCatNo + '">');
    				var $h4 = $('<td class="td1" style="width:120px;"><h4>상품명</h4></td>');
    				var $proName = $('<td class="proName" name="proName" id="proName">' + search[i].proName + '</td>');
    				var $price = $('<td class="td1" style="width:70px;"><h4>금액</h4></td>');
    				var $proPriceE = $('<td sytle="width:80px;" name="proPriceE" id="proPriceE">'
    				                   +'<input type="hidden" class="originalPrice" value="' + search[i].proPriceE + '">'
			                	+'<span class="calcPrice">' + search[i].proPriceE + '</span> 원</td>');
    				var $td1 = $('<td class="td1" id="updown" style="width:180px;"><h4>수량</h4><input type="number" class="qty" id="Pdt_Count" value="1" min="1"</td>');
    				var $btn = $('<td style="width:110px; pdding-right:30px;"><button class="btn click" id="addProduct" onclick="test(this)">추가</button></td></tr>');
    				
    			
    				$tr.append($proNo);
    				$tr.append($proCatNo);
    				$tr.append($h4);
    				$tr.append($proName);
    				$tr.append($price);
    				$tr.append($proPriceE);
    				$tr.append($td1);
    				$tr.append($btn);
    				
    				// console.log(proName);
    				// console.log(proNo)
    				
    				$('#resultList').append($tr);

    		    	$('.resultList .qty').on('change',function(){
    		    		var price = Number($(this).parent().parent().find('.originalPrice').val());
    		    		$(this).parent().parent().find('.calcPrice').text($(this).val() * price);
    		    		console.log(price);
    		    		console.log($(this).val() * price);
    		    	});
    		    	
    			}
    			
    			console.log(search);
    		}, error : function(error) {
    			alert("전송 실패");
    		}
    	});
		
	});
    	

	function dateChange( time ) {
 		var myDate = new Date(time);
 		return myDate.getFullYear() + '-' +('0' + (myDate.getMonth()+1)).slice(-2)+ '-' +  ('0' + myDate.getDate()).slice(-2); 
 	}

    	
    	// '추가'버튼 클릭 시 검색 결과 리스트 전달하기
    	
	function test(obj){

    		
		var count = $(obj).parent().parent().find('.qty').val();	
    	var proNum = $(obj).parent().parent().find('.proNum').val();

    	$.ajax({
    		url :  "${pageContext.request.contextPath}/OE/orderList.do",
    		type : 'get', 
    		dataType : 'json',
    		success : function(data2) {
    			// alert('전송 성공');
    			// console.log(data2.OE.oeNo);
	    		
				var oeNo = data2.OE.oeNo;
				var proNo = $(obj).parent().parent().find('.proNum').val();
				var proName = $(obj).parent().parent().find('#proName').text();
				var oeCount = $(obj).parent().parent().find('.qty').val();
				var orderDate = dateChange(new Date());
				var oePriceE = Number($(obj).parent().parent().find('.originalPrice').val());
				var mul = Number($(obj).parent().parent().find('.qty').val());
				var proCatNo = $(obj).parent().parent().find('.proCatNo').val();
				
				var $tr = $('<tr>');
				var $proCatNo =$('<input type="hidden" class="orderList proCatNo" value="' + proCatNo + '" />');
				var $oeNo =$('<td style="width:115px;padding-left:45px;" class="orderList oeNo">' + oeNo + '</td>');
				var $proNo = $('<td style="width:110px;padding-left:8px;" class="orderList proNo" name="oeInvNo3">'+ proNum + '</td>');
				var $proName =$('<td class="orderList proName" name="oeName3" id="proName">' + proName + '</td>');
				var $oeCount =$('<td style="width:60px;" class="orderList oeCount" name="oeCount3">' + count + ' 개</td>');
				var $mul =  $('<td class="orderList mul" style="width:90px;padding-left:10px" name="oePrice3">' + Number(oePriceE * mul) + ' 원</td>');
				var $orderDate = $('<td style="padding-left:37px;" class="orderList orderDate"  >' + orderDate + '</td>');
				var $btn2 = $('<td><button class="btn click delete" id="orderDel" >삭제</button></td></tr>');
				
				$tr.append($proCatNo).append($oeNo).append($proNo).append($proName)
				   .append($oeCount).append($mul).append($orderDate).append($btn2);
				   
				$('tbody').append($tr);
				
				console.log('Number(oePriceE * mul) : ' + Number(oePriceE * mul));
				
				sumPrice += parseInt(oePriceE * mul);
				
				$('.delete').on('click', function(){
					var min =  parseInt($(this).parent().parent().find('.mul').text());
					var mul = Number($(obj).parent().parent().find('.qty').text());
					var oePriceE = Number($(obj).parent().parent().find('.originalPrice').text());
					
					console.log('min : ' + min);
					
					var result =  sumPrice - min ;
					
					$(this).parent().parent().remove();
					
					$('.sumPriceResult').text(result);
					
					
				});
				
				
				console.log('sumPrice : ' + sumPrice);
				
				$('.sumPriceResult').empty();
				
				$('.sumPriceResult').text(sumPrice + '원');
				
    		}, error : function(error) {
    			alert('실패');
    		}	
    	})
	}
    	
    	
		// 다시쓰기 버튼
		$('.reWrite').on('click', function(){
			$('tbody').empty();
			$('.sumPriceResult').empty();
			
			sumPrice = 0;
		});
			
    	// '발주하기' 버튼
    	// OE/oe.do
    	$('#orderBtn').on('click', function(){
    		var orderList = [];
    		$('.orderList.proNo').each(function(){
    			var $parentTr = $(this).parent();
    			var oe = {};
    			oe['oeInvNo'] = Number($parentTr.find('.proNo').text());
    			oe['oeName'] = $parentTr.find('.proName').text();
    			oe['oeCount'] = parseInt($parentTr.find('.oeCount').text());
    			oe['oePrice'] = parseInt($parentTr.find('.mul').text());
    			oe['oeCatNo'] = parseInt($parentTr.find('.proCatNo').val());
    			oe['userNo'] = Number('${ member.userNo }');
    			orderList.push(oe);
    		});
    		
    		$.ajax({
    			url : "${pageContext.request.contextPath}/OE/OEInsert.do",
    			type : "get",
    			data :{
    				 orderList : JSON.stringify(orderList)
    			}, success : function(data) {
    				if(data != 0){
    					 
    					 $('tbody').empty(); 
    				}
    				
    				$('.sumPriceResult').empty();
    				
    			}, error : function(error) {alert('전송 실패')}
    		});
    	});


    </script>
    <!-- script 끝 -->
    
    
    
     
</body>
</html>