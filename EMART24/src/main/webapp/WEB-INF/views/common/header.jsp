<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/emart24/resources/css/common/header.css" />

	
	<!-- header Start -->
	<!-- 로그인 시  -->
	<header>
      <div>
          <ul class="gnb">
              <li><a href="#" onclick="goEmail()"><img src="/emart24/resources/images/email.png"></a></li>
              <li><a href="#" onclick="goAlarm()"><img src="/emart24/resources/images/alram.png"></a></li>
              <li><a href="#">${member.userBranch}점&nbsp;</a></li>
              <li class="headerBorder">&nbsp;</li>
              <li><a href="#">${member.userName} 님</a></li>
              <div class="action">
                  <div class="profile" onclick="menuToggle();">
                      <img src="/emart24/resources/images/email.png" alt="">
                  </div>
                  <div class="menu">
                      <ul>
                         <li><a href="#" onclick="goMyprofile()">마이페이지</a></li>
                          <li><a href="#" onclick="goLogout()">로그아웃</a></li>
                      </ul>
                  </div>
              </div>
          </ul>
          
      </div>
    </header>
    <!-- header End -->
	
	<!-- onclick시 이동하는 스크립트 -->
	<script type="text/javascript">
		
		function goLogin() {
			location.href="";
		}
	
		function goEmail() {
			location.href="";
		}	
		
		function goAlarm() {
			location.href="";
		}
		
		function goMyprofile() {
			location.href="";
		}
		
		function goLogout() {
			location.href="";
		}
		
	</script>
	<!-- Script End -->
