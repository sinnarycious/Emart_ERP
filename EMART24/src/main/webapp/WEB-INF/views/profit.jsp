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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profit.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
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
    
	    // 밀리초를 yyyy-mm-dd로 변환
	    function dateChange( time ) {
	       var myDate = new Date(time);
	       return myDate.getFullYear() + '-' +('0' + (myDate.getMonth()+1)).slice(-2)+ '-' +  ('0' + myDate.getDate()).slice(-2); 
	    }

	    var lineArea = document.getElementById('myChartLine').getContext('2d');
		var date = new Date();
		var line;  // undefined
		var wLine;
		var mLine;
	
		
			$.ajax({ 
			url : "/emart24/sale/line.do",
			type : "get",
			async : true,
			data : {
				date : date.getTime()
				}, success : function( data ) {
					//console.log("data : " + data);
					//console.log("data(weekList) : " + data.weekList);
					//console.log("data(lastMonthList) : " + data.lastMonthList);
					//console.log("data(thisMonthList) : " + data.thisMonthList);
					
					// 주간 데이터 처리
					var weekList = data.weekLineList
					var weekData = [];
		
		
					for (var i in weekList) {
						// console.log(weekList[i]);
						weekData.push(weekList[i]);
					}
		
					console.log('weekData[0].sale : ' + weekData[0].saleSum);
					// 월간 데이터 처리
					
					var lastMonthList = data.lastLineMonthList;
					var lastMonthData = [];
					var thisMonthList = data.thisLineMonthList;
					var thisMonthData = [];
					
					// 지난 달 데이터 처리
					/*
					$.each(data.lastMonthList,function(key, value){
		
							// console.log(key);
		
							// console.log(data.lastMonthList[key]);
							
							lastMonthData.push(data.lastMonthList[key]);
							
							// console.log("lastData 입력 확인 : " + lastData[key]);
		
					});
					*/
					
					// console.log("lastData 순서 확인 : " + lastMonthData);
					
					for (var i in lastMonthList) {
						// console.log("lastMonthList.saleDate 입력 확인 : " + dateChange(lastMonthList[i].saleDate));
						// console.log("lastMonthList.saleSum 입력 확인 : " + lastMonthList[i].saleSum);
						lastMonthData.push(lastMonthList[i]);
						// console.log("lastMonthData[i].salenum : " + lastMonthData[i].saleSum);
					}
					
					// 이번 달 데이터 처리
					/*
					$.each(data.thisMonthList,function(key, value){
		
							thisMonthData.push(data.thisMonthList[]);
		
					});
					*/
					
					for (var i in thisMonthList) {
						// console.log("thisMonthList.saleDate 입력 확인 : " + dateChange(thisMonthList[i].saleDate));
						// console.log("thisMonthList.saleSum 입력 확인 : " + thisMonthList[i].saleSum);
						thisMonthData.push(thisMonthList[i]);
					}


			        // lineGraph start
		
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
			                [],
			                },{
			            label: '지난 주',
			            backgroundColor: '#777777',
			            borderColor: '#777777',
			            data:
			                [],
			                }]
			        };
			    
			        wLine = {
			          type: 'line',
			          data: weekLineData
			        };
			    
			        // === include 'setup' then 'config' above ===
			        
			        var weekDataset = weekLineData.datasets;	
			        
			        // console.log("dataset 길이 : " + dataset.length);
			        // console.log("weekData 확인 : " + weekData);
			        // console.log(dataset);
					
					for(var i = weekDataset.length -1; i >= 0; i--){
						
						if (i == 1) {
							for(var j = 0; j < 7; j++) {
								// console.log("첫 if 문 출력확인 : " + weekData[j]);
								// console.log(weekDataset[i]);
								weekDataset[i].data.push(weekData[j].saleSum);
								// console.log('if ( i == 1) weekData[j].saleSum' + weekData[j].saleSum);
							}
						} else if (i == 0) {
							for(var j = 7; j < weekData.length; j++) {
								weekDataset[i].data.push(weekData[j].saleSum);
								// console.log('if ( i == 0) weekData[j].saleSum' + weekData[j].saleSum);
							}
						}
						//console.log(weekDataset[i].data);
					}
					
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
			                []
			            },
			                {
			            label: '지난 달',
			            backgroundColor: '#777777',
			            borderColor: '#777777',
			            data:
			                [],
			                }]
			        };
			            
			        mLine = {
			            type: 'line',
			            data: monthLineData
			        };
			        
			        var monthDataset = monthLineData.datasets;
			        
					for(var i = monthDataset.length -1; i >= 0; i--){
						
						if (i == 1) {
							for(var j = 0; j < lastMonthData.length; j++) {
								// console.log("첫 if 문 출력확인 : " + weekData[j]);
								monthDataset[i].data.push(lastMonthData[j].saleSum);
								console.log("lastMonthDataset : " + monthDataset[i].data[j]);
							}
						} else if (i == 0) {
							for(var j = 0; j < thisMonthData.length; j++) {
								monthDataset[i].data.push(thisMonthData[j].saleSum);
								console.log("thisMonthDataset : " + monthDataset[i].data[j]);
							}
						}
						// console.log(monthDataset[i].data);
					}
			        
			        // === include 'setup' then 'config' above ===
			        
					alert("전송 성공!");
				}, error : function( error ) {
					alert("전송 실패!");
				}
			});
		
		
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
		/*
	    window.onload = function() {
	    	line = new Chart(lineArea, wLine);
	    }
		*/
	    // lineGraph end
	</script>
    <script>
    
    /*
        // lineGraph 원본 start
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
        
     	// 월간 그래프 끝
              // === include 'setup' then 'config' above ===
     */
     
     /*
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


        // lineGraph 원본 end
    */
    </script>
    <script>
    /*
    var doughnutArea = document.getElementById('myChartDoughnut').getContext('2d');
    var doughnut;
	    $.ajax({ 
			url : "/emart24/sale/doughnut.do",
			type : "get",
			async : true,
			data : {
				date : date.getTime()
				}, success : function( data ) {
					
					
					alert("전송 성공!");
				}, error : function( error ) { 
					
					
					alert("전송 실패!");
				}
			});
    
	*/
	</script>
	<script>
    /*
        // doughnutGraph 원본 start
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
        
	*/
        // doughnutGraph 원본 end
        
        // 시작 시 그래프 그리기
        $(function(){
            // duringLine();
            // duringDoughnut();
        })
        
    </script>
</body>
</html>