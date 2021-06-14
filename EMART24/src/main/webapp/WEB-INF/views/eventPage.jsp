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
    <title>eventPage</title>
    <link rel="stylesheet" href="/emart24/resources/css/common/reset.css
">
    <link rel="stylesheet" href="/emart24/resources/css/eventPage.css">
    <style>
        
    </style>
</head>
<body>
	<c:import url="common/nav.jsp" />
		
	<c:import url="common/header.jsp" />
    

    <section class="wrap">
        <div class="area eventPage">
        <h2>행사 공지</h2>
        <h4>행사 조회</h4>
        <div class="searchBar">
            <h4>행사 일자</h4>
            <input type="date" name="eventDate1" /> ~
            <input type="date" name="eventDate2" />

            <h4>행사명</h4>
            <input type="text" style="width:700px;" placeholder="행사명을 검색하세요. "/>
            <button class="btn search">조회</button>


        </div>
        <table>
            <tr>
                <th>
                    <h4>행사 번호</h4>
                </th>
                <th>
                    <h4>제목</h4>
                </th>
                <th>
                    <h4>기간</h4>
                </th>
                <th>
                    <h4>상태</h4>
                </th>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag">진행중</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag">진행중</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag">진행중</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag">진행중</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag">진행중</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag off">종료</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag off">종료</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag off">종료</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag off">종료</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag off">종료</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag off">종료</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag off">종료</button></td>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td><button class="tag off">종료</button></td>
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

