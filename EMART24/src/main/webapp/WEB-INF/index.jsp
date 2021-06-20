<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<div class="login_logo">
			<img src="/emart24/resources/images/emart24_login.png">
			<h2 class="login_title">새로운 라이프 스타일 편의점</h2>
		</div>
		<form id="loginForm" name="loginForm"
			action="${pageContext.request.contextPath}/member/memberLogin.do"
			method="post">
			<fieldset class="login_form">
				<div class="id_area">
					<input type="text" name="userId" id="userId"
						placeholder="아이디를 입력해주세요.">
				</div>
				<div class="pw_area">
					<input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="idSave_checkbox">
					<input type="checkbox" id="idSaveCheck"> <label
						for="login_chk">아이디저장</label> <a href="/views/userSearch.jsp">아이디 찾기 / 비밀번호 찾기</a>
				</div>
				<button class="btn loginBtn" name="" type="submit">
					<h3>로그인</h3>
				</button>
			</fieldset>
		</form>
	</section>
	<div class="copyrightText">
		<hr>
		<h5>프로젝트 참여원</h5>
		<p style="text-align: center;">copyright © 2021 Sinnarycious All
			Rights Reserved</p>
	</div>

<script>
	// 아이디 저장 기능
	$(document).ready(function() {
		var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
		$("input[name='userId']").val(userInputId);

		if ($("input[name='userId']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
			// 아이디 저장하기 체크되어있을 시,
			$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}

		$("#idSaveCheck").change(function() { // 체크박스에 변화가 발생시
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
				var userInputId = $("input[name='userId']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("userInputId");
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("input[name='userId']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				var userInputId = $("input[name='userId']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires="
						+ exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>



</body>
</html>