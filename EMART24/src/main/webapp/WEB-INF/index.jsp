<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/emart24/resources/images/emart.ico">
<title>Emart24_ERP</title>
<link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
<link rel="stylesheet" href="/emart24/resources/css/common/login.css">
</head>

<body>
<section class="loginPage">
        <div class="losgin_logo">
            <img src="/emart24/resources/images/emart24_login.png">
            <h2 class="login_title">새로운 라이프 스타일 편의점</h2>
        </div>
        <fieldset class="login_form">
            <div class="id_area">
                <input type="text" placeholder="아이디를 입력해주세요.">
            </div>
            <div class="pw_area">
                <input type="text" placeholder="비밀번호를 입력해주세요.">
            </div>
            <div class="idSave_checkbox">
                <input type="checkbox">
                <label for="login_chk">아이디 저장</label>
                <a href="#">아이디 찾기 / 비밀번호 찾기</a>
            </div>
            <button class="btn loginBtn" type="submit"><a href="${pageContext.request.contextPath}/main/main.do"><h3>로그인</h3></a></button>
        </fieldset>
    </section>
    <div class="copyrightText">
        <hr>
        <h5>프로젝트 참여원</h5><p style="text-align: center;">copyright © 2021 Sinnarycious All Rights Reserved</p>
    </div>

</body>
</html>