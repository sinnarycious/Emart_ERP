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
    <link rel="stylesheet" href="../emartTest/css/reset.css">
    <style>
        
    </style>
</head>
<body>
    <h2>판매 관리</h2>
    <section class="wrap">
        <h4>판매 조회</h4>
        <div class="sellSearch">
            <h6>판매 날짜</h6>
            <input type="date" name="sellDate1" /> <h6>~</h6>
            <input type="date" name="sellDate2" />

            <h6>상품번호</h6>
            <input type="number" min="0"  />

            <h6>상품명</h6>
            <input type="text" />
            <button class="btn search">조회</button>


        </div>
        <table>
            <tr>
                <td>판매번호</td>
                <td>상품번호</td>
                <td>카테고리</td>
                <td>상품명</td>
                <td>수량</td>
                <td>금액</td>
                <td>판매날짜</td>
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
    </section>
    
</body>
</html>

