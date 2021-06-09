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
    <title>재고 현황</title>
    <link rel="stylesheet" href="css/common/reset.css">
    <link rel="stylesheet" href="css/common/nav.css">
    <link rel="stylesheet" href="css/common/header.css" />
    <style>
        .invArea h2{
            margin-bottom: 50px;
        }

        .invArea h3{
            margin-left: 30px;
        }

        .invArea h2, .invArea h3{
            text-align : left;
        }

        .searchBar{
            padding-top : 37px;
            padding-bottom : 37px;
            margin-left : 30px;
            float: left;
        }
        .searchBar input[name=invNo]{
            width:100px;
        }
        .searchBar input[name=invName]{
            width:720px;
        }
        .searchBar h4{
            display : inline-block;
            text-align : left;
            margin-right : 10px;
        }

        .searchBar h4:nth-child(n+2){
            margin-left : 35px;
        }
        .searchBar button[type="submit"]{
            margin-left : 15px;
        }
        .goOE {
            float: right;
            margin-top: 10px;
            margin-right: 30px;
            
        }
        .pageNo{
            margin-top : 50px;
        }
    </style>
    <script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <!-- header Start -->
	<header>
        <div>
            <ul class="gnb">
                <li><a href="#" onclick="goEmail()"><img src="images/email.png"></a></li>
                <li><a href="#" onclick="goAlarm()"><img src="images/alram.png"></a></li>
                <li><a href="#">${member.userBranch}점&nbsp;</a></li>
                <li class="headerBorder">&nbsp;</li>
                <li><a href="#">${member.userName} 님</a></li>
                <div class="action">
                    <div class="profile" onclick="menuToggle();">
                        <img src="images/email.png" alt="">
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
  
    <section class="navArea">
        <nav>
            <div class="logo">
                <a href="#">
                    <img src="images/emart24.png">
                </a>
            </div>
            <ul>
                <li>
                    <a href="#">
                        <span class="icon"><img src="images/myPage.png"></span>
                        <span class="title bold">마이페이지</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><img src="images/order.png"></span>
                        <span class="title bold">발주 / 입고</span>
                    </a>
                    <a href="#"><h5 class="OEsub">- 발주 신청</h5></a>
                    <a href="#"><h5 class="OEsub">- 입고 관리</h5></a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><img src="images/enter.png"></span>
                        <span class="title bold">재고 관리</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><img src="images/sale.png"></span>
                        <span class="title bold">판매 관리</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><img src="images/profit.png"></span>
                        <span class="title bold">수익</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><img src="images/event.png"></span>
                        <span class="title bold">행사 공지</span>
                    </a>
                </li>
            </ul>
        </nav>
        <footer>
            <div class="footerIn">
                <h4 class="bold" style="margin-top:20px;">프로젝트 참여원</h4>
                <div class="comInfo">
                    <h6>(주) 이마트24</h6>
                    <h6>대표이사: 김창욱</h6>
                    <h6>사업자등록번호:</h6>
                    <h6>105-86-92454</h6>
                    <h6>서울특별시 성동구 성수동 2가 281-4 푸조비즈타워</h6>
                </div>
                <div class="Copyright">
                    <h6>Copyright &copy; 2021</h6>
                    <h6>Sinnarycious All right</h6>
                    <h6>Reserved</h6>
                </div>
            </div>
        </footer>
    </section>
    <section class="wrap">
        <div class="area invArea">

            <h2>재고 관리</h2>
            <h3>재고 현황</h3>

            <div class="searchBar">
                <form action="${pageContext.request.contextPath}/OE/search.do" method="post" id="searchFrm">
                    <h4>상품 카테고리</h4>
                    <select name="categori">
                        <option value="snack">과자</option>
                        <option value="drink">음료</option>
                        <option value="ice">냉동식품</option>
                        <option value="편의용품">편의용품</option>
                        <option value="간편식">간편식</option>
                    </select>
                    <h4>상품 번호</h4> <input type="number" name="invNo" />
                    <h4>상품명</h4> <input type="text" name="invName" placeholder="상품명을 검색하세요. " />

                    <button type="submit" class="btn search" onclick="search()">조회</button>
                </form>
            </div>

            <table class="invTable">
                <tr>
                    <th>
                        <h4>상품 번호</h4>
                    </th>
                    <th style="width:500px;">
                        <h4>상품명</h4>
                    </th>
                    <th>
                        <h4>창고 수량</h4>
                    </th>
                    <th>
                        <h4>창고 추가</h4>
                    </th>
                    <th>
                        <h4>매장 수량</h4>
                    </th>
                    <th>
                        <h4>매장 추가</h4>
                    </th>
                    <th>
                        <h4>가격</h4>
                    </th>
                    <th>
                        <h4>재고 부족</h4>
                    </th>
                </tr>
                <tr>
                    <td><span class="num">${inv.invNo}</span></td>
                    <td><span class="num">${inv.invName}</span></td>
                    <td><span class="num">${inv.invWCount}</span></td>
                    <td><input type="number" style="width:70px;"></td>
                    <td><span class="num">${inv.invSCount}</span></td>
                    <td><input type="number" style="width:70px;"></td>
                    <td><span class="num">${inv.invPrice}</span></td>
                    <td><button class="btn tag" type="submit" onclick="goOE()">부족</button></td>
                </tr>
            </table>
            <div class="goOE">
                <button class="btn search" onclick="goOE()">발주하기</button>
            </div>
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