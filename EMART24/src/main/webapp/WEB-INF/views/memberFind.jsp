<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="/emart24/resources/images/emart.ico">
<title>아이디 및 비밀번호 찾기</title>
<link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
<link rel="stylesheet" href="/emart24/resources/css/memberFind.css">
<script src="/emart24/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<section class="loginPage">
		<div class="login_logo">
			<img src="/emart24/resources/images/emart24_login.png">
			<h2 id="memberFind_title1">아이디 찾기</h2>
			<h2 id="memberFind_title2" style="display: none;">비밀번호 찾기</h2>
			<h5 class="memberFind_comment">
				이메일이 기억나지 않는다면<br> 본사 데이터 관리팀으로 문의 주시길 바랍니다.<br>
				02-1234-1231
			</h5>
		</div>
		<hr style="width: 410px; border-top: 1px solid var(- -yellow);">
		<div class="custom-control custom-radio custom-control-inline"
			style="display: inline;">
			<input type="radio" class="custom-control-input" id="search_1"
				name="search_total" onclick="search_check(1)" checked="checked">
			<label id="search_check1"
				class="custom-control-label font-weight-bold text-white"
				for="search_1">아이디 찾기</label>
		</div>
		<div class="custom-control custom-radio custom-control-inline"
			style="display: inline;">
			<input type="radio" class="custom-control-input" id="search_2"
				name="search_total" onclick="search_check(2)"> <label
				class="custom-control-label font-weight-bold text-white"
				for="search_2">비밀번호 찾기</label>
		</div>





		<div class="login_form">

			<!-- 아이디 찾기 -->
			<div id="searchId">
				<div class="id_area">
				<!-- 
					<input type="text" name="userName" id="userName"
						placeholder="이름을 입력해주세요.">
				 -->
				</div>
				<div class="pw_area">
					<input type="text" name="userEmail" id="userEmail"
						placeholder="이메일을 입력해주세요.">
				</div>
			</div>

			<!-- 아이디 찾기 끝 -->

			<!-- 비밀번호 찾기 -->
			<div id="searchPwd" style="display: none;">
				<div class="id_area">
					<input type="text" name="userId" id="userId"
						placeholder="아이디 입력해주세요.">

				</div>
				<div class="pw_area">
					<input type="text" name="userEmail2" id="userEmail2" placeholder="이메일을 입력해주세요.">
				</div>
			</div>
			<!-- 비밀번호 찾기 끝 -->

			<button class="btn loginBtn" id="findIdBtn">
				<h3>확인</h3>
			</button>

			<button class="btn loginBtn" name="" type="reset">
				<h3>취소</h3>
			</button>
			<button class="btn loginBtn" name="" type="reset">
				<h3>로그인 하러가기</h3>
			</button>
		</div>

	</section>
	<div class="copyrightText">
		<hr>
		<h5>프로젝트 참여원</h5>
		<p style="text-align: center;">copyright © 2021 Sinnarycious All
			Rights Reserved</p>
	</div>


	<script>
		//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
		function search_check(num) {
			if (num == '1') {
				document.getElementById("memberFind_title1").style.display = "";
				document.getElementById("memberFind_title2").style.display = "none";
				document.getElementById("searchId").style.display = "";
				document.getElementById("searchPwd").style.display = "none";
			} else {
				document.getElementById("memberFind_title1").style.display = "none";
				document.getElementById("memberFind_title2").style.display = "";
				document.getElementById("searchId").style.display = "none";
				document.getElementById("searchPwd").style.display = "";
			}
		};
		
		$('#findIdBtn').on('click', function(){

			var userEmail = $('#userEmail').val();
			
			$.ajax({
				
				url : "${pageContext.request.contextPath}/member/searchId.do",
				type : "get",
				data : {
					userEmail : userEmail
				},
				dataType : 'json',
				success : function(data){
					
					var userId = data.userId;
					
					alert("검색 성공!" );
				},
				error : function(error){
					alert("이름과 이메일을 확인해주세요!");
				}
				
			});
			
		});
		
		
	</script>
</body>
</html>