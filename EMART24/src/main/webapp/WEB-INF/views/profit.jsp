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
    <title>수익</title>
    <link rel="stylesheet" href="resources/css/common/reset.css">
    <link rel="stylesheet" href="resources/css/common/nav.css">
    <link rel="stylesheet" href="resources/css/common/header.css">
    <link rel="stylesheet" href="resources/css/profit.css">
    <script src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
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
                           <li><a href="/emart24/views/mypage.jsp" onclick="goMyprofile()">마이페이지</a></li>
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
                <a href="${pageContext.request.contextPath}/main/main.do">
                    <img src="/emart24/resources/images/emart24.png">
                </a>
            </div>
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/common/mypage.do">
                        <span class="icon"><img src="/emart24/resources/images/myPage.png"></span>
                        <span class="title bold">마이페이지</span>
                    </a>
                </li>
                <li>
                        <span class="icon"><img src="/emart24/resources/images/order.png"></span>
                        <span class="title bold">발주 / 입고</span>
                    <a href="${pageContext.request.contextPath}/common/orderPage.do"><h5 class="OEsub">- 발주 신청</h5></a>
                    <a href="${pageContext.request.contextPath}/common/oe.do"><h5 class="OEsub">- 입고 관리</h5></a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/common/inv.do">
                        <span class="icon"><img src="/emart24/resources/images/enter.png"></span>
                        <span class="title bold">재고 관리</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/common/sellPage.do">
                        <span class="icon"><img src="/emart24/resources/images/sale.png"></span>
                        <span class="title bold">판매 관리</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/common/profit.do">
                        <span class="icon"><img src="/emart24/resources/images/profit.png"></span>
                        <span class="title bold">수익</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/common/eventPage.do">
                        <span class="icon"><img src="/emart24/resources/images/event.png"></span>
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
        <div>
            <h2 class="profitTitle">수익</h2></div>
            <div class="area line">
                <div class="graphLine">
                    <h3 class="graphTop5">수익 그래프</h3>
                    <span>
                        <select name="during" id="duringLine" onchange="duringLine()">
                            <option name="during" value="week">주간</option>
                            <option name="during" value="month">월간</option>
                        </select>
                    </span>
                </div>
                <canvas id="myChartLine" width="1000px" height="380px"></canvas>
            </div>
            <div class="area doughnut graphArea">
                <div class="day profit tag">
                    <h2>220만</h2>
                    <h6>오늘 매출</h6>
                </div>
                <div class="month profit tag off">
                    <h2>2200만</h2>
                    <h6>이번 달 매출</h6>
                </div>
                <div id="ration" style="border : 1px solid var(--light-gray);">
                    <div class="doughnutAnno">
                        <h3 class="ration">판매량 비율</h3>
                        <select name="during" id="duringDoughnut" onchange="duringDoughnut()">
                            <option name="during" value="week">주간</option>
                            <option name="during" value="month">월간</option>
                        </select>
                    </div>
                    <canvas id="myChartDoughnut"></canvas>
                </div>
            </div>
            <div class="categoriArea">
                <h3>판매량 TOP 5</h3>
                <div claas="categori snack">
                    <div>
                        <h4>과자</h4>
                        <div>
                            <h6>1. 아침에 주스 100% 오렌지</h6>
                            <h6>2. 아침에 주스 100% 오렌지</h6>
                            <h6>3. 아침에 주스 100% 오렌지</h6>
                            <h6>4. 아침에 주스 100% 오렌지</h6>
                            <h6>5. 아침에 주스 100% 오렌지</h6>
                        </div>
                    </div>
                </div>
            <div claas="categori drink">
                <div>
                    <h4>음료</h4>
                    <div>
                        <h6>1. 아침에 주스 100% 오렌지</h6>
                        <h6>2. 아침에 주스 100% 오렌지</h6>
                        <h6>3. 아침에 주스 100% 오렌지</h6>
                        <h6>4. 아침에 주스 100% 오렌지</h6>
                        <h6>5. 아침에 주스 100% 오렌지</h6>
                    </div>
                </div>
            </div>
            <div claas="categori ice">
                <div>
                    <h4>냉동식품</h4>
                    <div>
                        <h6>1. 아침에 주스 100% 오렌지</h6>
                        <h6>2. 아침에 주스 100% 오렌지</h6>
                        <h6>3. 아침에 주스 100% 오렌지</h6>
                        <h6>4. 아침에 주스 100% 오렌지</h6>
                        <h6>5. 아침에 주스 100% 오렌지</h6>
                    </div>
                </div>
            </div>
            <div claas="categori simple">
                <div>
                    <h4>간편식</h4>
                    <div>
                        <h6>1. 아침에 주스 100% 오렌지</h6>
                        <h6>2. 아침에 주스 100% 오렌지</h6>
                        <h6>3. 아침에 주스 100% 오렌지</h6>
                        <h6>4. 아침에 주스 100% 오렌지</h6>
                        <h6>5. 아침에 주스 100% 오렌지</h6>
                    </div>
                </div>
            </div>
            <div claas="categori convinience">
                <div>
                    <h4>편의용품</h4>
                    <div>
                        <h6>1. 아침에 주스 100% 오렌지</h6>
                        <h6>2. 아침에 주스 100% 오렌지</h6>
                        <h6>3. 아침에 주스 100% 오렌지</h6>
                        <h6>4. 아침에 주스 100% 오렌지</h6>
                        <h6>5. 아침에 주스 100% 오렌지</h6>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // lineGraph start
        var lineArea = document.getElementById('myChartLine').getContext('2d');
        var line;  // undefined
        
        // 주간 그래프 시작

        var weekLabels = [
          '월',
          '화',
          '수',
          '목',
          '금',
          '토',
          '일'
        ];
        var weekLineData = {
          labels: weekLabels,
          datasets: [{
            label: '이번 주',
            backgroundColor: '#fdb718',
            borderColor: '#fdb718',
            data:
                [22,
                 50,
                 10,
                 8,
                 30,
                 30,
                 45],
                },{
            label: '지난 주',
            backgroundColor: '#777777',
            borderColor: '#777777',
            data:
                [10,
                 50,
                 22,
                 50,
                 60,
                 80,
                 100],
                }]
        };
    
        var wLine = {
          type: 'line',
          data: weekLineData
        };
    
          // === include 'setup' then 'config' above ===
        
        // 주간 그래프 끝
        
        // 월간 그래프 시작

       
        var monthLabels = [
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31'
        ];
        var monthLineData = {
            labels: monthLabels,
            datasets: [{
            label: '이번 달',
            backgroundColor: '#fdb718',
            borderColor: '#fdb718',
            data:
                [22,
                 50,
                 10,
                 8,
                 30,
                 30,
                 45,
                 22,
                 50,
                 10,
                 8,
                 30,
                 30,
                 45,
                 22,
                 50,
                 10,
                 8,
                 30,
                 30,
                 45,
                 22,
                 50,
                 10,
                 8,
                 30,
                 30,
                 45,
                 55,
                 100,
                 5
                ],
                },{
            label: '지난 달',
            backgroundColor: '#777777',
            borderColor: '#777777',
            data:
                [10,
                 50,
                 22,
                 50,
                 60,
                 80,
                 100,
                 10,
                 50,
                 22,
                 50,
                 60,
                 80,
                 100,
                 10,
                 50,
                 22,
                 50,
                 60,
                 80,
                 100,
                 10,
                 50,
                 22,
                 50,
                 60,
                 80,
                 100,
                 150,
                 15,
                 10
                ],
                }]
        };
            
        var mLine = {
            type: 'line',
            data: monthLineData
        };
        
              // === include 'setup' then 'config' above ===
        
        function duringLine() {
            var val = document.getElementById('duringLine').value;
            console.log(val);

            if(line != undefined){ // undefined = null;
                line.destroy();
            }
           
            if (val == 'week') {
                line = new Chart(lineArea, wLine);
            } else if (val == 'month'){
                line = new Chart(lineArea, mLine);
            }
        }

        // 월간 그래프 끝


        // lineGraph end
    </script>
    <script>
        // doughnutGraph start
        var doughnutArea = document.getElementById('myChartDoughnut').getContext('2d');
        var doughnut;

        var weekDoughnutData = {
            labels: [
              '음료',
              '냉동 식품',
              '간편 식품',
              '편의 용품',
              '과자'
            ],
            datasets: [{
                label: '품목별 판매액(만)',
                data: [30, 5, 10, 30, 50],
                backgroundColor: [
                    'red',
                    'blue',
                    'green',
                    'pink',
                    'violet'
                ],
                hoverOffset: 4
            }]
        };

        var monthDoughnutData = {
            labels: [
              '음료',
              '냉동 식품',
              '간편 식품',
              '편의 용품',
              '과자'
            ],
            datasets: [{
                label: '품목별 판매액(만)',
                data: [50, 25, 10, 10, 50],
                backgroundColor: [
                    'red',
                    'blue',
                    'green',
                    'pink',
                    'violet'
                ],
                hoverOffset: 4
            }]
        };

        var wDoughnut = {
          type: 'doughnut',
          data: weekDoughnutData,
          options: {
            
          }
        };

        var mDoughnut = {
          type: 'doughnut',
          data: monthDoughnutData,
          options: {
            
          }
        };

        function duringDoughnut() {
            var val = document.getElementById('duringDoughnut').value;
            console.log(val);

            if(doughnut != undefined){ // undefined = null;
                doughnut.destroy();
            }
           
            if (val == 'week') {
                doughnut = new Chart(doughnutArea, wDoughnut);
            } else if (val == 'month'){
                doughnut = new Chart(doughnutArea, mDoughnut);
            }
        }
        

        // doughnutGraph start
        
        // 시작 시 그래프 그리기
        $(function(){
            duringLine();
            duringDoughnut();
        })

    </script>
</body>
</html>