<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon"
	href="/emart24/resources/images/emart.ico">
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
            <h2 class="profitTitle">수익</h2>
            <div class="area line">
                <div class="graphLine">
                    <h3 class="graphTop5">수익 그래프</h3>
                    <span>
                        <select name="during" id="duringLine" onchange="duringLine()">
                            <option selected name="during" value="week">주간</option>
                            <option name="during" value="month">월간</option>
                        </select>
                    </span>
                </div>
                <canvas id="myChartLine" width="1000px" height="380px"></canvas>
            </div>
        </div>
            <div class="area doughnut graphArea">
                <div class="day profit tag">
                    <h2 class="today"></h2>
                    <h6>오늘 매출</h6>
                </div>
                <div class="month profit tag off">
                    <h2 class="thisMonth"></h2>
                    <h6>이번 달 매출</h6>
                </div>
                <div id="ration" style="border : 1px solid var(--light-gray);">
                    <div class="doughnutAnno">
                        <h3 class="ration">판매량 비율</h3>
                        <select name="during" id="duringDoughnut" onchange="duringDoughnut()">
                            <option selected name="during" value="lastWeek">지난 주</option>
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
                            <h6 class="snackTop"></h6>
                            <h6 class="snackTop"></h6>
                            <h6 class="snackTop"></h6>
                            <h6 class="snackTop"></h6>
                            <h6 class="snackTop"></h6>
                        </div>
                    </div>
                </div>
            <div claas="categori drink">
                <div>
                    <h4>음료</h4>
                    <div>
                        <h6 class="drinkTop"></h6>
                        <h6 class="drinkTop"></h6>
                        <h6 class="drinkTop"></h6>
                        <h6 class="drinkTop"></h6>
                        <h6 class="drinkTop"></h6>
                    </div>
                </div>
            </div>
            <div claas="categori ice">
                <div>
                    <h4>냉동식품</h4>
                    <div>
                        <h6 class="iceTop"></h6>
                        <h6 class="iceTop"></h6>
                        <h6 class="iceTop"></h6>
                        <h6 class="iceTop"></h6>
                        <h6 class="iceTop"></h6>
                    </div>
                </div>
            </div>
            <div claas="categori simple">
                <div>
                    <h4>간편식</h4>
                    <div>
                        <h6 class="simpleTop"></h6>
                        <h6 class="simpleTop"></h6>
                        <h6 class="simpleTop"></h6>
                        <h6 class="simpleTop"></h6>
                        <h6 class="simpleTop"></h6>
                    </div>
                </div>
            </div>
            <div claas="categori convinience">
                <div>
                    <h4>편의용품</h4>
                    <div>
                        <h6 class="conTop"></h6>
                        <h6 class="conTop"></h6>
                        <h6 class="conTop"></h6>
                        <h6 class="conTop"></h6>
                        <h6 class="conTop"></h6>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <script>
    
	    // 밀리초를 yyyy-mm-dd로 변환
	    // Contoroller 에서 변환하므로 이 페이지에서 사용 X
	    /*
	    function dateChange( time ) {
	       var myDate = new Date(time);
	       return myDate.getFullYear() + '-' +('0' + (myDate.getMonth()+1)).slice(-2)+ '-' +  ('0' + myDate.getDate()).slice(-2); 
	    }
	    */

	    var lineArea = document.getElementById('myChartLine').getContext('2d');
		var date = new Date();
		var line;  // undefined
		var wLine;
		var mLine;
		var todaySum = 0;
		var thisMonthSum = 0;
	
		
			$.ajax({ 
			url : "/emart24/sale/line.do",
			type : "post",
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
						// console.log(weekLineList[i]);
						weekLineData.push(weekLineList[i]);
						// console.log(weekLineData[i].saleSum);
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
			            label: '이번 주(원)',
			            backgroundColor: '#fdb718',
			            borderColor: '#fdb718',
			            data:
			                []
			                },{
			            label: '지난 주(원)',
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
							if (weekLineData.length > 7) {
								for(var j = 0; j < 7; j++) {
									// console.log("첫 if 문 출력확인 : " + weekLineData[j]);
									// console.log(weekDataset[i]);
									
									weekLineDataset[i].data.push(weekLineData[j].saleSum);
									
									// console.log('if ( i == 1) weekLineData[j].saleSum' + weekLineData[j].saleSum);
								}
							} else {
								for(var j = 0; j < weekLineData.length; j++) {
									// console.log("첫 if 문 출력확인 : " + weekLineData[j]);
									// console.log(weekDataset[i]);
									
									weekLineDataset[i].data.push(weekLineData[j].saleSum);
									
									// console.log('if ( i == 1) weekLineData[j].saleSum' + weekLineData[j].saleSum);
								}
							}
						} else if (i == 0) {
							for(var j = 7; j < weekLineData.length; j++) {
								weekLineDataset[i].data.push(weekLineData[j].saleSum);
								console.log('if ( i == 0) weekLineData[j].saleSum' + weekLineData[j].saleSum);
							}
						}
						//console.log(weekDataset[i].data);
					}
					
					// 주간 그래프 끝
				
					// 월간 그래프 시작
		
					// Label 처리
			        var monthLabels = [];
					
					
					// 데이터 값이 대비가 되지 않는다.
					// (1 = i, 2 = j ... 가 아닌 1 = i, 1.5 = j 이런 식으로 입력된다.)
					if (lastMonthLineData.length != 0 && thisMonthLineData.length != 0) {
						if (lastMonthLineData.length >= thisMonthLineData.length) {
							for (var i = 1; i <= lastMonthLineData.length; i++){
								monthLabels.push(i);
								console.log('monthLabels.push(i) : ' + monthLabels.push(i));
							}
						} else if (lastMonthLineData.length < thisMonthLineData.length) {
							for (var i = 1; i <= thisMonthLineData.length; i++){
								monthLabels.push(i);
								// console.log('monthLabels.push(i ) : ' + monthLabels.push(i));
							}
						}
					} else {
						alert('판매가 진행되지 않았습니다!\n판매 상품이 등록되면 데이터를 확인할 수 있습니다!')
					}
			        var monthLine = {
			            labels: monthLabels,
			            datasets: [{
			            label: '이번 달(원)',
			            backgroundColor: '#fdb718',
			            borderColor: '#fdb718',
			            data:
			                []
			            },
			                {
			            label: '지난 달(원)',
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
								console.log("lastMonthLineDataset : " + monthLineDataset[i].data[j]);
							}
						} else if (i == 0) {
							for(var j = 0; j < thisMonthLineData.length; j++) {
								monthLineDataset[i].data.push(thisMonthLineData[j].saleSum);
								console.log("thisMonthLineDataset : " + monthLineDataset[i].data[j]);
							}
						}
						// console.log(monthDataset[i].data);
					}
			        
					duringLine();
			        // === include 'setup' then 'config' above ===
			        
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
					
					var todaySumList = data.todaySum;
					var todaySum = [];
					
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
						// console.log(lastMonthDoughnutList[i]);
						lastMonthDoughnutData.push(lastMonthDoughnutList[i]);
						// console.log(lastMonthDoughnutData[i].saleSum);
					}
					for (var i in thisMonthDoughnutList) {
						//console.log(thisDoughnutMonthList[i]);
						thisMonthDoughnutData.push(thisMonthDoughnutList[i]);
						//console.log(thisDoughnutMonthData[i]);
					}
					
					for (var i in todaySumList) {
						// console.log(todaySumList[i].saleSum);
						todaySum += todaySumList[i].saleSum;
						// console.log(todaySum)
					}
					
					if (todaySum <= 5) {
						todaySum = 5
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
			                    	'#6cf',
			                        '#99c',
			                        '#6c3',
			                        '#fc3',
			                        '#f66'
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
			                    	'#6cf',
			                        '#99c',
			                        '#6c3',
			                        '#fc3',
			                        '#f66'
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
			                    	'#6cf',
			                        '#99c',
			                        '#6c3',
			                        '#fc3',
			                        '#f66'
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
			                    	'#6cf',
			                        '#99c',
			                        '#6c3',
			                        '#fc3',
			                        '#f66'
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


					
			            for (var i in thisMonthDoughnutData){
			            	thisMonthSum += Number(thisMonthDoughnutData[i].saleSum);
			            }
			            
			           if (todaySum == 5) {
			        	   $(".doughnut").find('.today').text(0 + "원");
			           } else {
			        	   $(".doughnut").find('.today').text(todaySum + "원");
			           }
			           
			           if (thisMonthSum == 5) {
			        	   $(".doughnut").find('.thisMonth').text(0 + "원");
			           } else {
			        	   $(".doughnut").find('.thisMonth').text(thisMonthSum + "원");
			           }
			            
					duringDoughnut();
				}, error : function( error ) { 
					
					
					alert("전송 실패!");
				}
			});
	    
        function duringDoughnut(val) {
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
	<script>
		$.ajax({
			url : "/emart24/sale/top5.do",
			type : "get",
			async : true,
			success : function( data ) {

				var snack = data.snack;
				var drink = data.drink;
				var ice = data.ice;
				var simple = data.simple;
				var con = data.con;
				
				// console.log(snack);
				// console.log(drink);
				// console.log(ice);
				// console.log(simple);
				// console.log(con);
				
				$('.snackTop:eq(0)').text("1. " + snack[0].saleName)
				$('.snackTop:eq(1)').text("2. " + snack[1].saleName)
				$('.snackTop:eq(2)').text("3. " + snack[2].saleName)
				$('.snackTop:eq(3)').text("4. " + snack[3].saleName)
				$('.snackTop:eq(4)').text("5. " + snack[4].saleName)
				
				$('.drinkTop:eq(0)').text("1. " + drink[0].saleName)
				$('.drinkTop:eq(1)').text("2. " + drink[1].saleName)
				$('.drinkTop:eq(2)').text("3. " + drink[2].saleName)
				$('.drinkTop:eq(3)').text("4. " + drink[3].saleName)
				$('.drinkTop:eq(4)').text("5. " + drink[4].saleName)
				
				$('.iceTop:eq(0)').text("1. " + ice[0].saleName)
				$('.iceTop:eq(1)').text("2. " + ice[1].saleName)
				$('.iceTop:eq(2)').text("3. " + ice[2].saleName)
				$('.iceTop:eq(3)').text("4. " + ice[3].saleName)
				$('.icekTop:eq(4)').text("5. " + ice[4].saleName)
				
				$('.simpleTop:eq(0)').text("1. " + simple[0].saleName)
				$('.simpleTop:eq(1)').text("2. " + simple[1].saleName)
				$('.simpleTop:eq(2)').text("3. " + simple[2].saleName)
				$('.simpleTop:eq(3)').text("4. " + simple[3].saleName)
				$('.simpleTop:eq(4)').text("5. " + simple[4].saleName)
				
				$('.conTop:eq(0)').text("1. " + con[0].saleName)
				$('.conTop:eq(1)').text("2. " + con[1].saleName)
				$('.conTop:eq(2)').text("3. " + con[2].saleName)
				$('.conTop:eq(3)').text("4. " + con[3].saleName)
				$('.conTop:eq(4)').text("5. " + con[4].saleName)
				
				
				
			}, error : function( error ) {
				alert('전송 실패');
			}
		});
	</script>

</body>
</html>