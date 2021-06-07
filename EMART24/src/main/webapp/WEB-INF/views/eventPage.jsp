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
    <link rel="stylesheet" href="../emartTest/css/reset.css">
    <style>
        
    </style>
</head>
<body>
    <h2>행사 공지</h2>
    <section class="wrap">
        <h4>행사 조회</h4>
        <div class="eventSearch">
            <h6>행사 일자</h6>
            <input type="date" name="eventDate1" /> <h6>~</h6>
            <input type="date" name="eventDate2" />

            <h6>행사명</h6>
            <input type="text" />
            <button class="btn search">조회</button>


        </div>
        <table>
            <tr>
                <td>행사번호</td>
                <td>제목</td>
                <td>기간</td>
                <td>상태</td>
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
    </section>
    
</body>
</html>

