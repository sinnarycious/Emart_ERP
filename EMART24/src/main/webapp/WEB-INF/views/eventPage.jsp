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
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/eventPage.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/nav.css">
    <style>
        
    </style>
</head>
<body>
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

