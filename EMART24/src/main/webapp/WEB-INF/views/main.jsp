<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="/emart24/resources/images/emart.ico">
<title>이마트24</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profit.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

	<c:import url="common/nav.jsp" />
		
	<c:import url="common/header.jsp" />
	
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
	</section>


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