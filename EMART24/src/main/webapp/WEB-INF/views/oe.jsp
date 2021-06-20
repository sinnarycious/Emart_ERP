<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
href="/emart24/resources/images/emart.ico">
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

				<h4>기준 일자</h4>
				<input type="date" name="orderDate1" id="orderDate1" /> ~ <input
					type="date" name="orderDate2" id="orderDate2" />
				<h4>발주 번호</h4>
				<input type="number" name="oeNo" id="oeNo" style="width: 100px;" min="1" />
				<h4>상품명</h4>
				<input type="text" name="oeName" id="oeName" style="width: 515px;"
					placeholder="상품명을 검색하세요. " />

				<button id="searchBtn" class="btn search">조회</button>
			</div>
		
			<!-- 검색 ajax -->

			<script>
				// 키보드 엔터 = '#searchBtn' 클릭과 동일한 효과
				$('#oeNo, #oeName').on('keyup', function(event) {
					if (event.keyCode == 13) {
						$('#searchBtn').click();
					}
				});

				$('#searchBtn')
						.on(
								'click',
								function() {

									var orderDate1 = $('#orderDate1').val();
									var orderDate2 = $('#orderDate2').val();
									var oeName = $('#oeName').val();
									var oeNo = $('#oeNo').val();
									if (orderDate1 == "" && orderDate2 == ""
											&& oeName == "" && oeNo == "") {
										alert("검색 값을 입력하세요!");
									} else if (oeName != null) {
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
													success : function(data) {

														$('tbody').empty(); // ORDER_ENTER 테이블 전체 데이터 값을 <tbody>에서 지움

														console.log(data);

														var search = data.search;

														for ( var i in search) {
															var $tr = $('<tr>');

															var $oeNo = $('<td class="oeNo"><span class="num">'
																	+ search[i].oeNo
																	+ '</span></td>');
															var $oeInvNo = $('<td class="oeInvNo"><span class="num">'
																	+ search[i].oeInvNo
																	+ '</span></td>');
															var $oeName = $('<td class="oeName">'
																	+ search[i].oeName
																	+ '</td>');
															var $oeCount = $('<td class="oeCount"><span class="num">'
																	+ search[i].oeCount
																	+ '</span></td>');
															var $oePrice = $('<td class="oePrice"><span class="num">'
																	+ search[i].oePrice
																	+ '</span></td>');
															var $orderDate = $('<td class="orderDate">'
																	+ dateChange(search[i].orderDate)
																	+ '</td>');
															var $oeStatus = '';
															if (search[i].oeStatus != 'Y') {
																$oeStatus = $('<td>'
																		+ '<button class="btn tag enrollBtn" type="submit">등록하기</button>'
																		+ '</td></tr>');
															} else {
																$oeStatus = $('<td>'
																		+ '<button class="tag off">등록 완료</button>'
																		+ '</td></tr>');
															}

															$tr.append($oeNo);
															$tr
																	.append($oeInvNo);
															$tr.append($oeName);
															$tr
																	.append($oeCount);
															$tr
																	.append($oePrice);
															$tr
																	.append($orderDate);
															$tr
																	.append($oeStatus);

															$('tbody').append(
																	$tr);

														}
														
														// 등록버튼 ajax
														$('.enrollBtn')
														.on(
																'click',
																function() {

																var button = $(this);
																var oeNo = parseInt($(this).parent()
																		.parent().find('.oeNo').text());
																var oeName = $(this).parent().parent()
																			.find('.oeName').text();
																												
																$.ajax({
																	url : '${pageContext.request.contextPath}/OE/updateStatus.do',
																	type : 'post',
																	data : {
																		oeNo : oeNo,
																		oeName : oeName
																	},
																	dataType : 'json',
																	success : function(data) {
																		if (data == 1) { // 업데이트가 이뤄졌으면
																			$(button)
																					.removeClass('btn')
																					.addClass('off')
																					.empty()
																					.text('등록 완료');
																		}
																	}
																});
														
														});
														
														$('#paging_area')
																.empty(); // ORDER_ENTER 테이블 전체 데이터 값에 따른 paging 삭제			
														$('#paging_area')
																.append(
																		data.paging);

													},
													error : function(error) {
														alert("전송 실패!");
													}
												});
									}
								});

				// 밀리초를 yyyy-mm-dd로 변환
				function dateChange(time) {
					var myDate = new Date(time);
					return myDate.getFullYear() + '-'
							+ ('0' + (myDate.getMonth() + 1)).slice(-2) + '-'
							+ ('0' + myDate.getDate()).slice(-2);
				}
			</script>


			<table class="oeDBTable">
				<thead>
					<tr>
						<th style="width: 110px;">
							<h4>발주 번호</h4>
						</th>
						<th style="width: 110px;">
							<h4>상품 번호</h4>
						</th>
						<th style="width: 500px;">
							<h4>상품명</h4>
						</th>
						<th style="width: 110px;">
							<h4>수량</h4>
						</th>
						<th style="width: 185px;">
							<h4>금액</h4>
						</th>
						<th style="width: 185px;">
							<h4>발주 날짜</h4>
						</th>
						<th style="width: 185px;">
							<h4>입고 등록</h4>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="oe">
						<tr>
							<td class="oeNo"><span class="num">${oe.oeNo}</span></td>
							<td class="oeInvNo"><span class="num">${oe.oeInvNo}</span></td>
							<td class="oeName">${oe.oeName}</td>
							<td class="oeCount"><span class="num">${oe.oeCount}</span>개</td>
							<td class="oePrice"><span class="num">${oe.oePrice}</span>원</td>
							<td class="orderDate"><span class="num">${oe.orderDate}</span></td>

							<td><c:if test="${oe.oeStatus == 'N' }">
									<button class="btn tag enrollBtn" type="submit">등록하기</button>
								</c:if> <c:if test="${oe.oeStatus =='Y'}">
									<button class="tag off">등록 완료</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<script>
				$('.enrollBtn')
						.on(
								'click',
								function() {
									
									var button = $(this);
									var oeNo = parseInt($(this).parent()
											.parent().find('.oeNo').text());
									var oeName = $(this).parent().parent()
											.find('.oeName').text();

									$.ajax({
												url : '${pageContext.request.contextPath}/OE/updateStatus.do',
												type : 'post',
												data : {
													oeNo : oeNo,
													oeName : oeName
												},
												dataType : 'json',
												success : function(data) {
													if (data == 1) { // 업데이트가 이뤄졌으면
														$(button)
																.removeClass('btn')
																.addClass('off')
																.empty()
																.text('등록 완료');
													} else {
														alert("등록 실패했습니다!");
													}
												},
												error : function(error) {
													alert("등록 실패했습니다!");
												}
											});
								});
			</script>

			<div id="paging_area">
				<c:out value="${ pageBar }" escapeXml="false" />

			</div>
		</div>

	</section>


</body>
</html>