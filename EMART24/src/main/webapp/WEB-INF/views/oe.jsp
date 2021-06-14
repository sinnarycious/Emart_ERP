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
                    <h4>기준 일자</h4> <input type="date"   name="orderDate1" /> ~ <input type="date"    name="orderDate2" />
                    <h4>발주 번호</h4> <input type="number" name="oeNo"     style="width:100px;" />
                    <h4>상품명</h4> <input type="text" name="oeName"    style="width:515px;" placeholder="상품명을 검색하세요. " />

                    <button type="submit" class="btn search" onclick="search()">조회</button>
                </form>
            </div>

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
		                <td><button class="btn tag" type="submit" onclick="enroll()">${oe.oeStatus=="M"?"등록하기":"등록 완료"}</button></td>
		            </tr>
	            </c:forEach>
            </table>

            <div class="pageNo">
                <ul>
                    <li><span class="arrLeft"></span></li>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                    <li>7</li>
                    <li>8</li>
                    <li>9</li>
                    <li>10</li>
                    <li><span class="arrRight"></span></li>
                </ul>
            </div>
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