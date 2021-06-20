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
                            <option name="during" value="lastWeek">지난 주</option>
                            <option name="during" value="thisWeek">이번 주</option>
                            <option name="during" value="lastMonth">지난 달</option>
                            <option name="during" value="thisMonth">이번 달</option>
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
					var weekLineList = data.weekLineList
					var weekLineData = [];
		
		
					for (var i in weekLineList) {
						// console.log(weekList[i]);
						weekLineData.push(weekLineList[i]);
					}
		
					// console.log('weekLineData[0].sale : ' + weekLineData[0].saleSum);
					// 월간 데이터 처리
					
					var lastMonthLineList = data.lastLineMonthList;
					var lastMonthLineData = [];
					var thisMonthLineList = data.thisLineMonthList;
					var thisMonthLineData = [];
					
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
					
					for (var i in lastMonthLineList) {
						// console.log("lastMonthList.saleDate 입력 확인 : " + dateChange(lastMonthList[i].saleDate));
						// console.log("lastMonthList.saleSum 입력 확인 : " + lastMonthList[i].saleSum);
						lastMonthLineData.push(lastMonthLineList[i]);
						// console.log("lastMonthData[i].salenum : " + lastMonthData[i].saleSum);
					}
					
					// 이번 달 데이터 처리
					/*
					$.each(data.thisMonthList,function(key, value){
		
							thisMonthData.push(data.thisMonthList[]);
		
					});
					*/
					
					for (var i in thisMonthLineList) {
						// console.log("thisMonthList.saleDate 입력 확인 : " + dateChange(thisMonthList[i].saleDate));
						// console.log("thisMonthList.saleSum 입력 확인 : " + thisMonthList[i].saleSum);
						thisMonthLineData.push(thisMonthLineList[i]);
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
			        var weekLine = {
			          labels: weekLabels,
			          datasets: [{
			            label: '이번 주',
			            backgroundColor: '#fdb718',
			            borderColor: '#fdb718',
			            data:
			                []
			                },{
			            label: '지난 주',
			            backgroundColor: '#777777',
			            borderColor: '#777777',
			            data:
			                []
			                }]
			        };
			    
			        wLine = {
			          type: 'line',
			          data: weekLine
			        };
			    
			        // === include 'setup' then 'config' above ===
			        
			        var weekLineDataset = weekLine.datasets;	
			        
			        // console.log("dataset 길이 : " + dataset.length);
			        // console.log("weekData 확인 : " + weekData);
			        // console.log(dataset);
					
					for(var i = weekLineDataset.length -1; i >= 0; i--){
						
						if (i == 1) {
							for(var j = 0; j < 7; j++) {
								// console.log("첫 if 문 출력확인 : " + weekData[j]);
								// console.log(weekDataset[i]);
								weekLineDataset[i].data.push(weekLineData[j].saleSum);
								// console.log('if ( i == 1) weekData[j].saleSum' + weekLineData[j].saleSum);
							}
						} else if (i == 0) {
							for(var j = 7; j < weekLineData.length; j++) {
								weekLineDataset[i].data.push(weekLineData[j].saleSum);
								// console.log('if ( i == 0) weekData[j].saleSum' + weekLineData[j].saleSum);
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
			        var monthLine = {
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
			                []
			                }]
			        };
			            
			        mLine = {
			            type: 'line',
			            data: monthLine
			        };
			        
			        var monthLineDataset = monthLine.datasets;
			        
					for(var i = monthLineDataset.length -1; i >= 0; i--){
						
						if (i == 1) {
							for(var j = 0; j < lastMonthLineData.length; j++) {
								// console.log("첫 if 문 출력확인 : " + weekMonthData[j]);
								monthLineDataset[i].data.push(lastMonthLineData[j].saleSum);
								// console.log("lastMonthLineDataset : " + monthLineDataset[i].data[j]);
							}
						} else if (i == 0) {
							for(var j = 0; j < thisMonthLineData.length; j++) {
								monthLineDataset[i].data.push(thisMonthLineData[j].saleSum);
								// console.log("thisMonthLineDataset : " + monthLineDataset[i].data[j]);
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
    
    var doughnutArea = document.getElementById('myChartDoughnut').getContext('2d');
    var doughnut;
    var lastWDoughnut;
    var thisWDoughnut;
    var lastMDoughnut;
    var thisMDoughnut;
    
	    $.ajax({ 
			url : "/emart24/sale/doughnut.do",
			type : "get",
			async : true,
			data : {
				date : date.getTime()
				}, success : function( data ) {
					
					var lastWeekDoughnutList = data.lastWeekDoughnutList;
					var lastWeekDoughnutData = [];
					
					var thisWeekDoughnutList = data.thisWeekDoughnutList;
					var thisWeekDoughnutData = [];
					
					var lastMonthDoughnutList = data.lastMonthDoughnutList;
					var lastMonthDoughnutData = [];
					
					var thisMonthDoughnutList = data.thisMonthDoughnutList;
					var thisMonthDoughnutData = [];
					
					for (var i in lastWeekDoughnutList) {
						// console.log(lastWeekDoughnutList[i]);
						lastWeekDoughnutData.push(lastWeekDoughnutList[i]);
						// console.log(lastWeekDoughnutData[i]);
					}
					
					for (var i in thisWeekDoughnutList) {
						//c onsole.log(thisWeekDoughnutList[i]);
						thisWeekDoughnutData.push(thisWeekDoughnutList[i]);
						// console.log(thisWeekDoughnutData[i]);
					}
					
					
					for (var i in lastMonthDoughnutList) {
						console.log(lastMonthDoughnutList[i]);
						lastMonthDoughnutData.push(lastMonthDoughnutList[i]);
						console.log(lastMonthDoughnutData[i].saleSum);
					}
					for (var i in thisMonthDoughnutList) {
						//console.log(thisDoughnutMonthList[i]);
						thisMonthDoughnutData.push(thisMonthDoughnutList[i]);
						//console.log(thisDoughnutMonthData[i]);
					}
					
					// console.log('weekDoughnutData.length : ' + weekDoughnutData.length);
					// console.log('weekDoughnutData.saleSum : ' + weekDoughnutData[0].saleSum);
					
					var lastWeekDoughnut = {
			                labels: [
			                  '음료',
			                  '냉동 식품',
			                  '편의 식품',
			                  '과자',
			                  '간편식'
			                ],
			                datasets: [{
			                    label: '품목별 판매액(만)',
			                    data: [lastWeekDoughnutData[0].saleSum,
			                    	   lastWeekDoughnutData[1].saleSum,
			                    	   lastWeekDoughnutData[2].saleSum,
			                    	   lastWeekDoughnutData[3].saleSum,
			                    	   lastWeekDoughnutData[4].saleSum],
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
					
			    	var thisWeekDoughnut = {
			                labels: [
			                  '음료',
			                  '냉동 식품',
			                  '편의 식품',
			                  '과자',
			                  '간편식'
			                ],
			                datasets: [{
			                    label: '품목별 판매액(만)',
			                    data: [thisWeekDoughnutData[0].saleSum,
			                    	   thisWeekDoughnutData[1].saleSum,
			                    	   thisWeekDoughnutData[2].saleSum,
			                    	   thisWeekDoughnutData[3].saleSum,
			                    	   thisWeekDoughnutData[4].saleSum],
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

			     	// console.log(weekDoughnutDataset.data);
			     	/*
					for(var i = 1; i <= weekDoughnutData.length -1; i++){
						weekDoughnutDataset.data.push(weekDoughnutData[i].saleSum);
						console.log(weekDoughnutDataset.data[i]);
					}
			     	*/

			    	var lastMonthDoughnut = {
			                labels: [
			                	'음료',
				            	'냉동 식품',
				            	'편의 식품',
				            	'과자',
				                '간편식'
			                ],
			                datasets: [{
			                    label: '품목별 판매액(만)',
			                    data: [lastMonthDoughnutData[0].saleSum,
			                    	   lastMonthDoughnutData[1].saleSum,
			                    	   lastMonthDoughnutData[2].saleSum,
			                    	   lastMonthDoughnutData[3].saleSum,
			                    	   lastMonthDoughnutData[4].saleSum],
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

			    	var thisMonthDoughnut = {
			                labels: [
			                	'음료',
				            	'냉동 식품',
				            	'편의 식품',
				            	'과자',
				                '간편식'
			                ],
			                datasets: [{
			                    label: '품목별 판매액(만)',
			                    data: [thisMonthDoughnutData[0].saleSum,
			                    	   thisMonthDoughnutData[1].saleSum,
			                    	   thisMonthDoughnutData[2].saleSum,
			                    	   thisMonthDoughnutData[3].saleSum,
			                    	   thisMonthDoughnutData[4].saleSum],
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
						/*
						for(var i = monthDoughnutDataset.length -1; i >= 0; i--){
						
						}
			    		*/
			    		lastWDoughnut = {
					    	type: 'doughnut',
					    	data: lastWeekDoughnut,
					    	options: {
					                
					        }
					    };
			    		
			            thisWDoughnut = {
			              type: 'doughnut',
			              data: thisWeekDoughnut,
			              options: {
			                
			              }
			            };

			            lastMDoughnut = {
					    	type: 'doughnut',
					    	data: lastMonthDoughnut,
					    	options: {
					                
					        }
					    };

			            thisMDoughnut = {
			              type: 'doughnut',
			              data: thisMonthDoughnut,
			              options: {
			                
			              }
			            };

					
					alert("전송 성공!");
				}, error : function( error ) { 
					
					
					alert("전송 실패!");
				}
			});
	    
        function duringDoughnut() {
            var val = document.getElementById('duringDoughnut').value;
            console.log(val);

            if(doughnut != undefined){ // undefined = null;
                doughnut.destroy();
            }
            
            if (val == 'lastWeek') {
                doughnut = new Chart(doughnutArea, lastWDoughnut);
            } else if (val == 'thisWeek') {
                doughnut = new Chart(doughnutArea, thisWDoughnut);
            } else if (val == 'lastMonth'){
                doughnut = new Chart(doughnutArea, lastMDoughnut);
            } else if (val == 'thisMonth'){
                doughnut = new Chart(doughnutArea, thisMDoughnut);
            }
        }
	
	</script>

</body>
</html>