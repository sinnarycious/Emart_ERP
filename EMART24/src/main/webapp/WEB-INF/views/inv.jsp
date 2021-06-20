<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>재고 현황</title>
    <link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
    <link rel="stylesheet" href="/emart24/resources/css/common/nav.css">
    <link rel="stylesheet" href="/emart24/resources/css/common/header.css">
    <link rel="stylesheet" href="/emart24/resources/css/inv.css">
   <script src="/emart24/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="common/nav.jsp" />
      
   	<c:import url="common/header.jsp" />
   	
    <section class="wrap">
        <div class="area invArea">

            <h2>재고 관리</h2>
            <h3>재고 현황</h3>

            <div class="searchBar">
                    <h4>상품 카테고리</h4><input type="number" name="invCatNo" id="invCatNo" min="0"/>
                    <h4>상품 번호</h4> <input type="number" name="invNo" id="invNo" min="0"/>
                    <h4>상품명</h4> <input type="text" name="invName" id="invName" min="0" placeholder="상품명을 검색하세요. " />
                    <button id="searchBtn" type="button" class="btn search">조회</button>

            </div>

            <table class="invTable">
            <thead>
                <tr>
                    <th>
                        <h4>상품 번호</h4>
                    </th>
                    <th style="width:500px;">
                        <h4>상품명</h4>
                    </th>
                    <th>
                        <h4>창고 수량</h4>
                    </th>
                    <th>
                        <h4>창고 추가</h4>
                    </th>
                    <th>
                        <h4>매장 수량</h4>
                    </th>
                    <th>
                        <h4>매장 추가</h4>
                    </th>
                    <th>
                        <h4>가격</h4>
                    </th>
                    <th>
                        <h4>재고 부족</h4>
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="inv"> 
                <tr class="item">
                    <td><span class="num" id ="invNo">${inv.invNo}</span></td>
                    <td id ="invName">${inv.invName}</td>
                    <td><span class="num" id ="invWCount">${inv.invWCount}</span></td>
                    <td><input type="number" style="width:70px;" min="0"></td>
                    <td><span class="num" id ="invSCount">${inv.invSCount}</span></td>
                    <td><input type="number" style="width:70px;" min="0"></td>
                    <td><span class="num" id ="invPrice">${inv.invPrice}</span></td>
                    	<td>
				<c:if test="${inv.invWCount < 30 }">
					<button class="tag">재고 부족</button>
				</c:if>	
				<c:if test="${inv.invWCount >=30 }">
					<button class="tag off">재고 충분</button>
				</c:if>
					</td>
                   
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="goOE">
                <button class="btn search" onclick="">수량변경</button>
                <button class="btn search" onclick="goOE()">발주하기</button>
            </div>
            <div id="pageNo">
            <c:out value="${pageBar}" escapeXml="false"/>
        </div>
        </div>
	</section>
		<script>

		  $('#invName').on('keyup', function(event){
				if( event.keyCode == 13) {
					$('#searchBtn').click();
				}
			});
		
		 $('#searchBtn').on('click', function(){
			
			
			var invCatNo = $('#invCatNo').val();
			var invNo = $('#invNo').val();
			var invName = $('#invName').val();
		
			if(invName != null){
				$.ajax({ 
					url : "${pageContext.request.contextPath}/inv/searchInfo.do",
					type : "get",
					data : {
						invCatNo : invCatNo,
						invNo : invNo,
						invName : invName
					}, 
				
					success : function( data ) {

						$('tbody').empty();	
						
						console.log(data);
						
						var search = data.search;
						for(var i in search){
	 						var $tr = $('<tr>');
							
	 					
							var $invNo = $('<td><span class="num" id="invNo">' + search[i].invNo + '</span></td>');
							var $invName = $('<td id="invName">' + search[i].invName + '</td>');
							var $invWCount = $('<td><span class="num" id="invWCount">' + search[i].invWCount + '</td>');
							var $invWNum =$('<td><input type="number" style="width:70px;" min="0"></td>');
							var $invSCount = $('<td><span class="num" id="invSCount">' + search[i].invSCount + '</td>');
							var $invSNum = $('<td><input type="number" style="width:70px;" min="0"></td>');
							var $invPrice = $('<td><span class="num" id="invPrice">' + search[i].invPrice + '</td>');
							var $invStatus = '';
							if( search[i].invWCount < 30 ) {
								$invStatus = $('<td>' + '<button class="btn tag">재고 부족</button>' + '</td></tr>');
								
								} else {
								$invStatus = $('<td>' + '<button class="tag off">재고 충분</button>' + '</td></tr>');
								}																	
								
							
						
							$tr.append($invNo);
							$tr.append($invName);						
							$tr.append($invWCount);
							$tr.append($invWNum);
							$tr.append($invSCount);
							$tr.append($invSNum);
							$tr.append($invPrice);
							$tr.append($invStatus);		

							$('tbody').append($tr);
							
							
						}
						
						$('#pageNo').empty();
						
						$('#pageNo').append(data.paging);
					}, error : function( error ) {
						alert("전송 실패!");
					}
				});
			}
		}); 
                 
	</script> 
</body>
</html>




