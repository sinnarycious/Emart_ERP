<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
			
			<!-- 검색 -->
			<!-- 
            <script>                 
            	
				$('#searchBtn').on('click', function(){
					$.ajax({							
						url : "/OE/searchInfo.do",
						type : "get",
						data : {
							//orderDate1 : $('#orderDate1').val(),
							//orderDate2 : $('#orderDate2').val(),
							//oeNo : $('#oeNo').val(),
							oeName : $('#oeName').val()
						},
						success : function( data ){
							
							console.log(data);
							
							/*
							var oeNo = data.oeNo;
							var oeInvNo = data.oeInvNo;
							var oeName = data.oeName;
							var oeCount = data.oeCount;
							var oePrice = data.oePrice;
							var orderDate = data.orderDate;
							var oeStatus = data.oeStatus;
							*/
							
							/*
							$('#oeNo').text(oeNo);
							$('#oeInvNo').text(oeInvNo);
							$('#oeName').text(oeName);
							$('#oeCount').text(oeCount);
							$('#oePrice').text(oePrice);
							$('#orderDate').date(orderDate);
							*/
							
							// console.log(oeNo + ", " + oeInvNo + ", " + oeName + ", " + oeCount + ", " + oePrice + ", " + orderDate + ", " + oeStatus);
							
						},
						error : function( error ){
							console.log("에러입니다!");
						}
					});
				});	
            </script>
 			-->
 			
 			<script>
 			$('#searchBtn').on('click', function(){
 				$.ajax({ // jQuery 전용 함수
 					url : "/OE/searchInfo.do",
 					type : "get",
 					data : { 
 						oeName : $('#oeName').val()

 					}, success : function( data ) {
 						alert("전송 성공!");
 					}, error : function( error ) {
 						alert("전송 실패!");
 					}
 				});
 			});

 			
 			</script>

            <table class="oeDBTable">
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
	                    <h4>발주 현황</h4>
	                </th>
	                <th>
	                    <h4>입고 등록</h4>
	                </th>
	            </tr>
	            
	            <c:forEach items="${list}" var="oe">
		            <tr>
		                <td><span class="num" id="oeNo">${oe.oeNo}</span></td>
		                <td><span class="num" id="oeInvNo">${oe.oeInvNo}</span></td>
		                <td id="oeName">${oe.oeName}</td>
		                <td><span class="num" id="oeCount">${oe.oeCount}</span></td>
		                <td><span class="num" id="oePrice">${oe.oePrice}</span></td>
		                <td id="orderDate">${oe.orderDate}</td>
		                <td><button class="tag">결제 완료</button></td>
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
            
            <c:out value="${ pageBar }" escapeXml="false"/>

        </div>

    </section>


</body>
</html>