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
    
    <link rel="stylesheet" href="css/common/reset.css">
    <link rel="stylesheet" href="css/common/nav.css">
    <link rel="stylesheet" href="css/common/header.css" />
    <script src="js/jquery-3.6.0.min.js"></script>
    
    <style>
        .area {
            padding-top: 0px;
        }
        .line {
            float:left;
            border: 2px solid var(--gray);
            width: 1100px;
            height: 460px;
            margin-left: 75px;
            margin-top: 10px;
        }
        .doughnut {
            float: right;
            border: 2px solid var(--gray);
            width: 400px;
            height: 470px;
            margin-right: 75px;
        }
        .profit {
            border: 2px solid var(--gray);
            top: 0px;
            height: 70px;
            margin-top: 10px;
            margin-bottom: 10px;
            display: inline-block;
            line-height: 35px;
        }
        .day {
            width: 150px;
            margin-right: 5px;
        }
        .month {
            width: 200px;
            margin-left: 5px;
        }
        .categoriArea {
            width: 1520px;
            height: 330px;
            top: 520px;
            left: 75px;
            position: absolute;
            border: 2px solid var(--gray);
        }
        .categoriArea h3{
            text-align: left;
            margin-left: 50px;
        }
        .categoriArea>div {
            width : 200px;
            height : 250px;
            border: 2px solid var(--yellow);
            display: inline-block;
            margin-top: 25px;
            margin-left: 25px;
            margin-right: 25px;
        }
        .categoriArea>div>div {
            width:180px;
            height:220px;
            border: 2px solid var(--yellow);
            margin-top: 12px;
        }
        .categoriArea>div>div>div {
            width:150px;
            height:180px;
            margin-top: 12px;
        }
        .categoriArea h4 {
            text-align: left;
        }
        .categoriArea h6 {
            text-align: left;
            line-height: 20px;
        }
        .graphLine {
            width: 1096px;
            text-align: justify;
        }
        .graphTop5 {
            display: inline-block;
            text-align: left;
            margin-top: 10px;
            position: relative;
            left : 30px;
        }
        #duringLine {
            text-align: right;
            margin-top: 10px;
            position: relative;
            right: 30px;
            float: right;
        }
        .profitTitle {
            text-align: left;
            margin-left: 80px;
        }
        .ration {
            display: inline-block;
            text-align: left;
            margin-top: 20px;
            position: relative;
            float: left;
            left : 20px;
        }
        #duringDoughnut {
            text-align: right;
            margin-top: 10px;
            margin-bottom: 10px;
            position: relative;
            right: 15px;
            float: right;
        }
        .doughnutAnno{
            width: 396px;
            height: 20px;
            border-top: 2px solid var(--gray);
        }
    </style>
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
        <div><h2 class="profitTitle">수익</h2></div>
        <div class="area line">
            <div class="graphLine">
                <h3 class="graphTop5">수익 그래프</h3>
                <span>
                    <select name="during" id="duringLine" onchagne="line()">
                        <option value="week">주간</option>
                        <option value="month">월간</option>
                    </select>
                </span>
            </div>
            <canvas id="myChartLine" width="1000px" height="380px"></canvas>
        </div>
        <div class="area doughnut graphArea">
            <div class="day profit">
                <h2>22만원</h2>
                <h4>오늘 매출</h4>
            </div>
            <div class="month profit">
                <h2>220만</h2>
                <h4>이번 달 매출</h4>
            </div>
            <div>
                <div class="doughnutAnno">
                    <h3 class="ration">판매량 비율</h3>
                    <select name="during" id="duringDoughnut">
                        <option value="week">주간</option>
                        <option value="month">월간</option>
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
        
        function line() {
            var duringArea = document.getElementById('duringLine');
            console.log(duringArea);
            var during = duringArea.options[duringArea.selectedIndex].value;
            console.log(during);
        }


        // 주간 그래프 시작
        function week() {
                var weekLabels = [
                  '월',
                  '화',
                  '수',
                  '목',
                  '금',
                  '토',
                  '일'
                ];
                var weekData = {
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
            
                var line = {
                  type: 'line',
                  data: weekData
                };
            
                  // === include 'setup' then 'config' above ===
            
                var weekLine = new Chart(
                  document.getElementById('myChartLine'),
                  line
                );
        }
        // 주간 그래프 끝

        // 월간 그래프 시작

        function week() {
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
                var monthData = {
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
            
                var line = {
                  type: 'line',
                  data: monthData
                };
            
                  // === include 'setup' then 'config' above ===
            
                var monthLine = new Chart(
                  document.getElementById('myChartLine'),
                  line
                );
        }

        // 월간 그래프 끝

        // lineGraph end
    </script>
    <script>
        // doughnutGraph start
        var dataDoughnut = {
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
        var doughnut = {
          type: 'doughnut',
          data: dataDoughnut,
          options: {
            
          }
        };
        var myChartDoughnut = new Chart(
          document.getElementById('myChartDoughnut'),
          doughnut
        );
        // doughnutGraph start
    </script>
</body>
</html>