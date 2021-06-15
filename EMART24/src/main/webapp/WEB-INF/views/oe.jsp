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
</head>
<body>

	<c:import url="common/nav.jsp" />
		
	<c:import url="common/header.jsp" />
	
	
    <section class="wrap">

        <div class="area oeArea">

            <h2>입고 관리</h2>
            <h3>발주 조회 / 입고 등록</h3>

            <div class="searchBar">
                <form action="${pageContext.request.contextPath}/OE/search.do" method="post" id="searchFrm">
                    <h4>기준 일자</h4> <input type="date"   name="orderDate1" id="orderDate1"/> ~ <input type="date" name="orderDate2" id="orderDate2" />
                    <h4>발주 번호</h4> <input type="number" name="oeNo" id="oeNo" style="width:100px;" />
                    <h4>상품명</h4> <input type="text" name="oeName" id="oeName" style="width:515px;" placeholder="상품명을 검색하세요. " />

                    <button type="submit" id="searchBtn" class="btn search">조회</button>
                </form>
            </div>
            
            <script>
			
				$('#searchBtn').on('click', function(){
					/*
						jQuery( == $).get() / .post() ;
							get("요청URL", "전달할 값", 콜백함수);
						$.ajax({
							url : "요청 주소",
							type : "get/post",
							data : "전달할 값"
							     / { name : "홍길동", age : 20 },
							async : true / false, (비동기 / 동기 사용 여부)  
							dataType : "text/html", // 서버에서 응답하는 데이터의 유형
							success : function(data) { . . . },
							error : function(error, code, msg) { . . . },
							complete : function() { . . . } // 무조건 실행하는 함수
						});
					*/
					$.ajax({
						url : "/OE/searchList.do",
						type : "post",
						data : { 
							date1 : $('#orderDate1').val(),
							date2 : ${'#orderDate2'}.val(),
							ProductNo : ${'#oeNo'}.val(),
							ProductName : ${'#oeName'}.val()
							
							},
						success : function( data ){ console.log(data) },
						error : function(){ console.log('수신 실패!')	}
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
		                <td><span class="num">${oe.oeNo}</span></td>
		                <td><span class="num">${oe.oeInvNo}</span></td>
		                <td>${oe.oeName}</td>
		                <td><span class="num">${oe.oeCount}</span></td>
		                <td><span class="num">${oe.oePrice}</span></td>
		                <td>${oe.orderDate}</td>
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
            
            <c:out value="${ pageBar }" escapeXml="false"/>

        </div>

    </section>
    
    <script>
    
    <!-- 조회 버튼 -->
    function search(){
    	
    }
    
    <!-- 입고 등록 버튼 -->
    function enroll(){
    	
    }
    
    </script>

</body>
</html>