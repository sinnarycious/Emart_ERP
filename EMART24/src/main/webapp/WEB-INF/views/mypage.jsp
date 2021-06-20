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
<title>마이페이지</title>
<script src="/emart24/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
<link rel="stylesheet" href="/emart24/resources/css/mparea.css">
</head>
<body>

	<c:import url="common/nav.jsp" />

	<c:import url="common/header.jsp" />

	<section class="wrap">
		<div class="area">
			<form name="memberUpdate"
				action="${pageContext.request.contextPath}/member/memberUpdate.do" id="update"
				method="post">
				<div class="myPageArea1">
					<h2>마이페이지</h2>
					<img src="/emart24/resources/images/yoona.png" class="profile_Img">
					<table class="update_pw">
						<tr>
							<td class="td1">아이디</td>
							<td><input type="text" class="idInput" name ="userId"
								value="${member.userId}" readonly required></td>
						</tr>
						<tr>
							<td class="td1">비밀번호</td>
							<td><input type="password" class="pwInput" name ="userPwd" id = "userPwd" placeholder="새 비밀번호를 입력하세요"
								></td>
						</tr>
						<tr>
							<td class="td1">비밀번호 확인</td>
							<td><input type="password" class="pwInput" name ="userPwd2" id = "userPwd2" placeholder="새 비밀번호 확인입니다"
								></td>
						</tr>
						<tr>
						<td id="alert-success" style="display: none; color: #0000ff; font-weight: bold;">똑같지롱~~</td>
   						<td id="alert-fail" style="display: none; color: #ff0000; font-weight: bold;">다르지롱~~</td>						
						</tr>
					</table>
					<table class="update_profile">
						<tr>
							<td class="td1">이름</td>
							<td><input type="text" class="name" name ="userName"
								value="${member.userName}" readonly required></td>
						</tr>
						<tr>
							<td class="td1">주민번호</td>
							<td><input type="text" class="rno" value="${member.userRNo}" name= "userRNo"
								readonly required></td>
						</tr>
						<tr>
							<td class="td1">이메일</td>
							<td><input type="text" class="email" name = "userEmail"
								placeholder="새 이메일을 입력하세요"></td>
						</tr>
						<tr class = "mypage_border_bottom">
							<td class="td1">전화번호</td>
							<td><input type="text" class="phone" name = "userPhone"
								placeholder="새 전화번호를 입력하세요"></td>
						</tr>
					</table>
	
				    <button class="btn submit myPage_updateBtn">수정하기</button> 
					<!-- <input type="submit" class="btn submit myPage_updateBtn" value="수정하기" /> -->
					<img src="/emart24/resources/images/emart24store.png"
						class="emart24_storeImg">
					<table class="update_profile">
						<tr>
							<td class="td1">지점명</td>
							<td>${member.userBranch}</td>
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
						<tr class = "mypage_border_bottom">
							<td class="td1">점포 개업일</td>
							<td>${member.userOpenDate}</td>
						</tr>
					</table>
				</div>
	
			</form>
<script>
		function updateMember() {
			$("#update").submit();
		}
		
		$("#update").submit(function(event){
			if($('#userPwd').val() != $('#userPwd2').val()) alert("비밀번호 확인 값과 다릅니다.");
			else return;
			event.preventDefault();
		});
		
		 $('.pwInput').focusout(function () {
		        var pwd1 = $("#userPwd").val();
		        var pwd2 = $("#userPwd2").val();
		  
		        if ( pwd1 != '' && pwd2 == '' ) {
		            null;
		        } else if (pwd1 != "" || pwd2 != "") {
		            if (pwd1 == pwd2) {
		                $("#alert-success").css('display', 'inline-block');
		                $("#alert-fail").css('display', 'none');
		            } else {
		                $("#alert-success").css('display', 'none');
		                $("#alert-fail").css('display', 'inline-block');
		            }
		        }
		    
		    });
</script>
		</div>

	</section>
</body>
</html>