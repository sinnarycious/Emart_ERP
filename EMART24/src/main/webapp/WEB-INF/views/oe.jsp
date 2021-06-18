<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이마트24</title>
	<link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
	<link rel="stylesheet" href="/emart24/resources/css/oe.css">
	<script src="/emart24/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<c:import url="common/nav.jsp" />
		
	<c:import url="common/header.jsp" />
	
	
    <section class="wrap">

        <div class="area oeArea">

            <h2>입고 관리</h2>
            <h3>발주 조회 / 입고 등록</h3>

            <div class="searchBar">
               
				<h4>기준 일자</h4> <input type="date"   name="orderDate1" id="orderDate1"/> ~ <input type="date" name="orderDate2" id="orderDate2" />
				<h4>발주 번호</h4> <input type="number" name="oeNo" id="oeNo" style="width:100px;" />
				<h4>상품명</h4> <input type="text" name="oeName" id="oeName" style="width:515px;" placeholder="상품명을 검색하세요. " />
				
				<button id="searchBtn" class="btn search">조회</button>
			</div>
			
			<!-- 검색 ajax -->
 			<script>
 			$('#oeName').on('keyup', function(event){
 				if( event.keyCode == 13) {
 					$('#searchBtn').click();
 				}
 			});
 			$('#searchBtn').on('click', function(){
 				
 				var orderDate1 = $('#orderDate1').val();
 				var orderDate2 = $('#orderDate2').val();
 				var oeName = $('#oeName').val();
 				var oeNo = $('#oeNo').val();
 				
 				if(oeName != null){
	 				$.ajax({ // jQuery 전용 함수
	 					url : "${pageContext.request.contextPath}/OE/searchInfo.do",
	 					type : "get",
	 					data : {
	 						orderDate1 : orderDate1,
	 						orderDate2 : orderDate2,
	 						oeName : oeName,
	 						oeNo : oeNo
	 					}, 
	 					dataType : 'json',
	 					success : function( data ) {

	 						$('tbody').empty();	// ORDER_ENTER 테이블 전체 데이터 값을 <tbody>에서 지움
	 						
	 						console.log(data);
	 						
	 						var search = data.search;
	 						
	 						for(var i in search){
		 						var $tr = $('<tr>');

	 							var $oeNo = $('<td><span class="num" id="oeNo">' + search[i].oeNo +'</span></td>');
								var $oeInvNo = $('<td><span class="num" id="oeInvNo">' + search[i].oeInvNo + '</span></td>');
	 							var $oeName = $('<td id="oeName">' + search[i].oeName + '</td>');
								var $oeCount = $('<td><span class="num" id="oeCount">'+ search[i].oeCount +'</span></td>');
								var $oePrice = $('<td><span class="num" id="oePrice">'+ search[i].oePrice +'</span></td>');
								var $orderDate = $('<td id="orderDate">' + search[i].orderDate + '</td>');
								var $oeStatus = $('<td>' + search[i].oeStatus + '</td></tr>');
								 							
	 							$tr.append($oeNo);
	 							$tr.append($oeInvNo);
	 							$tr.append($oeName);
	 							$tr.append($oeCount);
	 							$tr.append($oePrice);
	 							$tr.append($orderDate);
	 							$tr.append($oeStatus);
	 							
	 							$('tbody').append($tr);
	 							
	 							
	 						}
 							
	 						$('#paging_area').empty();
	 						
	 						$('#paging_area').append(data.paging);
	 						
	 					}, error : function( error ) {
	 						alert("전송 실패!");
	 					}
	 				});
 				}
 			});

 			
 			</script>


            <table class="oeDBTable">
            <thead>
	            <tr>
	                <th>
	                    <h4>발주 번호</h4>
	                </th>
	                <th>
	                    <h4>상품 번호</h4>
	                </th>
	                <th>
	                    <h4>상품명</h4>
	                </th>
	                <th>
	                    <h4>수량</h4>
	                </th>
	                <th>
	                    <h4>금액</h4>
	                </th>
	                <th>
	                    <h4>발주 날짜</h4>
	                </th>
	                <th>
	                    <h4>입고 등록</h4>
	                </th>
	            </tr>
	            </thead>
	            <tbody>
	            <c:forEach items="${list}" var="oe">
		            <tr>
		                <td><span class="num" id="oeNo">${oe.oeNo}</span></td>
		                <td><span class="num" id="oeInvNo">${oe.oeInvNo}</span></td>
		                <td id="oeName">${oe.oeName}</td>
		                <td><span class="num" id="oeCount">${oe.oeCount}</span></td>
		                <td><span class="num" id="oePrice">${oe.oePrice}</span></td>
		                <td id="orderDate">${oe.orderDate}</td>
		                
		                <td>
							<c:if test="${oe.oeStatus == 'N' }">
								<button class="btn tag" type="submit" id="enrollBtn">등록하기</button>
							</c:if>
	
							<c:if test="${oe.oeStatus =='Y'}">
								<button class="tag off">등록 완료</button>
							</c:if>
						</td>
		            </tr>
	            </c:forEach>
	            </tbody>
            </table>
            <!-- 
            <script>
            	$('#enrollBtn').on('click', function(){
            		$.ajax({
            			url : 'OE/enroll.do',
            			type : 'post',
            			data : {
            				
            			}
            		})
            	});
            		
            
            </script>
             -->
            <div id="paging_area">
            	<c:out value="${ pageBar }" escapeXml="false"/>
			</div>
        </div>

    </section>


</body>
</html>