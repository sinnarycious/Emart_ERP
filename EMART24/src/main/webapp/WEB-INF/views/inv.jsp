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
    <script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="common/nav.jsp" />
      
   	<c:import url="common/header.jsp" />
   	
    <section class="wrap">
        <div class="area invArea">

            <h2>재고 관리</h2>
            <h3>재고 현황</h3>

            <div class="searchBar">
                <form action="${pageContext.request.contextPath}/OE/search.do" method="post" id="searchFrm">
                    <h4>상품 카테고리</h4>
                    <select name="categori">
                        <option value="snack">과자</option>
                        <option value="drink">음료</option>
                        <option value="ice">냉동식품</option>
                        <option value="편의용품">편의용품</option>
                        <option value="간편식">간편식</option>
                    </select>
                    <h4>상품 번호</h4> <input type="number" name="invNo" />
                    <h4>상품명</h4> <input type="text" name="invName" placeholder="상품명을 검색하세요. " />

                    <button type="submit" class="btn search" onclick="search()">조회</button>
                </form>
            </div>

            <table class="invTable">
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
                <tr>
                    <td><span class="num">${inv.invNo}</span></td>
                    <td><span class="num">${inv.invName}</span></td>
                    <td><span class="num">${inv.invWCount}</span></td>
                    <td><input type="number" style="width:70px;"></td>
                    <td><span class="num">${inv.invSCount}</span></td>
                    <td><input type="number" style="width:70px;"></td>
                    <td><span class="num">${inv.invPrice}</span></td>
                    <td><button class="btn tag" type="submit" onclick="goOE()">부족</button></td>
                </tr>
            </table>
            <div class="goOE">
                <button class="btn search" onclick="goOE()">발주하기</button>
            </div>
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
</body>
</html>