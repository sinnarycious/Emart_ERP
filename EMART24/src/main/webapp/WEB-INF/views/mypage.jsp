<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
<link rel="stylesheet" href="/emart24/resources/css/mparea.css">
</head>
<body>

<c:import url="common/nav.jsp" />
		
	<c:import url="common/header.jsp" />
	
    <section class="wrap">
    	<div class="area">
		<div class="myPageArea1">
                <h2>마이페이지</h2>
                <img src="/emart24/resources/images/yoona.png" class="profile_Img">
                <table class="update_pw">
                    <tr>
                        <td class="td1">아이디</td>
                        <td>kjw1302</td>
                    </tr>
                    <tr>
                        <td class="td1">비밀번호</td>
                        <td><input type="text" class="pwInput"></td>
                    </tr>
                    <tr>
                        <td class="td1">비밀번호 확인</td>
                        <td><input type="text" class="pwInput"></td>
                    </tr>
                </table>
                <table class="update_profile">
                    <tr>
                        <td class="td1">이름</td>
                        <td>강지원</td>
                    </tr>
                    <tr>
                        <td class="td1">주민번호</td>
                        <td>940521-1167611</td>
                    </tr>
                    <tr>
                        <td class="td1">이메일</td>
                        <td><input type="text" class="email_first"> @ <input type="text" class="email_second"></td>
                    </tr>
                    <tr>
                        <td class="td1">전화번호</td>
                        <td><input type="text" class="phone"> -
                            <input type="text" class="phone"> -
                            <input type="text" class="phone">
                        </td>
                    </tr>
                </table>
                <button class="btn submit myPage_updateBtn">수정하기</button>
                <img src="/emart24/resources/images/emart24store.png" class="emart24_storeImg">
                <table class="update_profile">
                    <tr>
                        <td class="td1">지점명</td>
                        <td>역삼리테일점</td>
                    </tr>
                    <tr>
                        <td class="td1">주소</td>
                        <td>서울특별시 강남구 언주로 103길 10</td>
                    </tr>
                    <tr>
                        <td class="td1">영업시간</td>
                        <td>07:00 ~ 23:00</td>
                    </tr>
                    <tr>
                        <td class="td1">무인 영업시간</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="td1">점포 전화번호</td>
                        <td>02-408-7906</td>
                    </tr>
                    <tr>
                        <td class="td1">점포 개업일</td>
                        <td>2019년 6월 1일</td>
                    </tr>
                </table>
            </div>
		
		</div>
    </section>

</body>
</html>