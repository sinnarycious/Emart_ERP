<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="shortcut icon" type="image/x-icon"
   href="/emart24/resources/images/emart.ico">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="/emart24/resources/images/emart.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>salePage</title>
<link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
<link rel="stylesheet" href="/emart24/resources/css/sale.css">
<script src="/emart24/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<c:import url="common/nav.jsp" />

	<c:import url="common/header.jsp" />

	<section class="wrap">

		<div class="area sale">

			<h2>판매 관리</h2>
			<h3>판매 조회</h3>

			<div class="searchBar">

				<h4>판매 날짜</h4>
				<input type="date" name="saleDate1" id="saleDate1"/> ~ <input type="date"
					name="saleDate2" id="saleDate1" />
				<h4>상품번호</h4>
				<input type="number" name="proNo" id="proNo" style="width: 100px;" min="0" />
				<h4>상품명</h4>
				<input type="text" name="saleName" id="saleName" style="width: 515px;"
					placeholder="상품명을 검색하세요." />

				<button class="btn search" id="searchBtn" >조회</button>

			</div>

			<!-- 검색 ajax -->
			<script>
				$('#saleName').on('keyup', function(event) {
					if (event.keyCode == 13) {
						$('#searchBtn').click();
					}
				});
				$('#searchBtn')
						.on(
								'click',
								function() {

									var saleDate1 = $('#saleDate1').val();
									var saleDate2 = $('#saleDate2').val();
									var saleName = $('#saleName').val();
									var proNo = $('#proNo').val();

									console.log("saleDate1 : " + saleDate1);
									console.log("saleDate2 : " + saleDate2);
									console.log("saleName : " + saleName);
									console.log("proNo : " + proNo);
									if (saleName != null) {
										$.ajax({ // jQuery 전용 함수
													url : "${pageContext.request.contextPath}/sale/searchInfo.do",
													type : "get",
													async : true,
													data : {
														saleDate1 : saleDate1,
														saleDate2 : saleDate2,
														saleName : saleName,
														proNo : proNo
													},
													dataType : 'json',
													success : function(data) {

														$('tbody').empty(); // ORDER_ENTER 테이블 전체 데이터 값을 <tbody>에서 지움

														console.log(data);

														var search = data.search;

														for ( var i in search) {
															var $tr = $('<tr>');

															var $saleNo = $('<td><span class="num" id="saleNo">'
																	+ search[i].saleNo
																	+ '</span></td>');
															var $proNo = $('<td><span class="num" id="proNo">'
																	+ search[i].proNo
																	+ '</span></td>');
															var $saleCatNo = $('<td><span class="num" id="saleCatNo">'
																	+ search[i].saleCatNo
																	+ '</span></td>');
															var $saleName = $('<td id="saleName">'
																	+ search[i].saleName
																	+ '</td>');
															var $saleCount = $('<td><span class="num" id="saleCount">'
																	+ search[i].saleCount
																	+ '</span></td>');
															var $salePrice = $('<td><span class="num" id="salePrice">'
																	+ search[i].salePrice
																	+ '</span></td>');
															var $saleDate = $('<td id="saleDate">'
																	+ dateChange(search[i].saleDate)
																	+ '</td>');

															$tr.append($saleNo);
															$tr.append($proNo);
															$tr.append($saleCatNo);
															$tr.append($saleName);
															$tr.append($saleCount);
															$tr.append($salePrice);
															$tr.append($saleDate);

															$('tbody').append(
																	$tr);

														}

														$('#paging_area').empty();

														$('#paging_area').append(data.paging);

													},
													error : function(error) {
														alert("전송 실패!");
													}
												});
									}
								});
				
				// 밀리초를 yyyy-mm-dd로 변환
		          function dateChange( time ) {
		             var myDate = new Date(time);
		             return myDate.getFullYear() + '-' +('0' + (myDate.getMonth()+1)).slice(-2)+ '-' +  ('0' + myDate.getDate()).slice(-2); 
		          }
				
			</script>

			<table class="saleDBTable">
				<thead>
					<tr>
						<th>
							<h4>판매 번호</h4>
						</th>
						<th>
							<h4>상품 번호</h4>
						</th>
						<th>
							<h4>카테고리</h4>
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
							<h4>판매날짜</h4>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="sale">
						<tr>
							<td><span class="num">${sale.saleNo}</span></td>
							<td><span class="num">${sale.proNo}</span></td>
							<td>${sale.saleCatNo}</td>
							<td><span class="num">${sale.saleName}</span></td>
							<td><span class="num">${sale.saleCount}</span></td>
							<td>${sale.salePrice}</td>
							<td>${sale.saleDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="pageNo">
				<c:out value="${pageBar}" escapeXml="false" />
			</div>

		</div>
	</section>


</body>
</html>

