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
    <title>sellPage</title>
    <link rel="stylesheet" href="/emart24/resources/css/common/reset.css
">
    <link rel="stylesheet" href="/emart24/resources/css/sellPage.css">
</head>
<body>

	<c:import url="common/nav.jsp" />
		
	<c:import url="common/header.jsp" />
   
    <section class="wrap">

        <div class="area sellPage">

            <h2>판매 관리</h2>
            <h3>판매 조회</h3>

            <div class="searchBar">
                <form action="post" id="searchFrm">
                    <h4>판매 날짜</h4><input type="date" name="sellDate1" /> ~ <input type="date" name="sellDate2" />
                    <h4>상품번호</h4><input type="number" name="sellNo" style="width: 100px;" min="0"  />
                    <h4>상품명</h4><input type="text" name="sellName" style="width: 515px;" placeholder="상품명을 검색하세요."/>

                    <button class="btn search">조회</button>
                </form>
            </div>

            <table class="oeDBTable">
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
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                    <td>내용6</td>
                    <td>내용7</td>
                </tr>
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

    
</body>
</html>

