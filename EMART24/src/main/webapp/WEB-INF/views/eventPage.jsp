<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon"
	href="/emart24/resources/images/emart.ico">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eventPage</title>
    <link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
    <link rel="stylesheet" href="/emart24/resources/css/eventPage.css">
    <script src="/emart24/resources/js/jquery-3.6.0.min.js"></script>

	<style>
	.evnt-content {
		display: none;
	}
	</style>
</head>
<body>
	<c:import url="common/nav.jsp" />		
	<c:import url="common/header.jsp" />
    
    <section class="wrap">
    
        <div class="area eventPage">
        <p>총 ${totalContents }건의 게시물이 있습니다.</p>
        <h2>행사 공지</h2>
        <h4>행사 조회</h4>
        <div class="searchBar">
         
            <h4>행사 일자</h4><input type="date" name="evntDateS1" id="evntDateS1"/> ~ <input type="date" name="evntDateS2" id="evntDateS2"/>
            <h4>행사 번호</h4><input type="number" name="evntNo" id="evntNo" style="width:100px;" />
			<h4>행사명</h4><input type="text" name="evntTitle" id = "evntTitle" style="width:510px;" placeholder="행사명을 검색하세요. "/>
			
            <button id="searchBtn" class="btn search">조회</button>

        </div>
        <c:set var="today" value="<%= new Date(new java.util.Date().getTime()) %>"/>
        <table class="recruit">
        <thead>
            <tr>
                <th>
              	<h4>행사 번호</h4> 
                </th>
                <th>
                <h4>제목</h4>
                </th>
                <th>
                <h4>시작 날짜</h4>
                </th>
                <th>
                <h4>종료 날짜</h4>
                </th>
                <th>
                <h4>상태</h4>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="e"> 
            <tr class="item">
                <td><span class="num" id="evntNo">${e.evntNo}</span></td>
                <td id="evntTitle">${e.evntTitle}</td>                
                <td id="evntDateS">${e.evntDateS}</td>
                <td id="evntDateE">${e.evntDateE}</td>
                <td>
				<c:if test="${e.evntDateE.getTime() >= today.getTime()  }">
					<button class="tag on">진행중</button>
				</c:if>
				<c:if test="${e.evntDateE.getTime() < today.getTime() }">
					<button class="tag off">종료</button>
				</c:if>
				</td>
				</tr>        
				<tr class="evnt-content">
				<td colspan=4>
					<img src="/emart24/resources/images/eventimage/${ e.evntContent }"/>
				</td>
				</tr>         
            </c:forEach>
            </tbody>
        </table>
        <div id="pageNo">
            <c:out value="${pageBar}" escapeXml="false"/>
        </div>
    </div>
    </section>  
	<script>
		$('.item').on('click', function(){
			$('.evnt-content').hide(1000);
			
			$(this).next('.evnt-content').show(1000);
		}); 
	
		  $('#evntTitle').on('keyup', function(event){
				if( event.keyCode == 13) {
					$('#searchBtn').click();
				}
			});
		
		 $('#searchBtn').on('click', function(){
			
			var evntDateS1 = $('#evntDateS1').val();
			var evntDateS2 = $('#evntDateS2').val();
			var evntTitle = $('#evntTitle').val();
			var evntNo = $('#evntNo').val();
		
			if(evntTitle != null){
				$.ajax({ 
					url : "${pageContext.request.contextPath}/event/searchInfo.do",
					type : "get",
					data : {
						evntDateS1 : evntDateS1,
						evntDateS2 : evntDateS2,
						evntTitle : evntTitle,
						evntNo : evntNo
					}, 
					dataType : 'json',
					success : function( data ) {

						$('tbody').empty();	// ORDER_ENTER 테이블 전체 데이터 값을 <tbody>에서 지움
						
						console.log(data);
						
						var search = data.search;
						for(var i in search){
 						var $tr = $('<tr>');

						var $evntNo = $('<td><span class="num" id="evntNo">' + search[i].evntNo + '</span></td>');
						var $evntTitle = $('<td id="evntTitle">' + search[i].evntTitle + '</td>');
						var $evntDateS = $('<td id="evntDateS">' + dateChange(search[i].evntDateS) + '</td>');
						var $evntDateE = $('<td id="evntDateE">' + dateChange(search[i].evntDateE) +'</td>');
						var $evntStatus = '';
	                       if( search[i].evntDateE >= new Date().getTime() ) {
	                           $evntStatus = $('<td>' 
	                                 + '<button class="tag on">진행중</button>'
	                                 + '</td></tr>');   
	                        } else {
	                        	$evntStatus = $('<td>' 
		                                 + '<button class="tag off">종료</button>'
		                                 + '</td></tr>');   
	                        }
						 							
							$tr.append($evntNo);
							$tr.append($evntTitle);
							$tr.append($evntDateS);
							$tr.append($evntDateE);
							$tr.append($evntStatus);

							$('tbody').append($tr);
							
							
						}
						
						$('#pageNo').empty();
						
						$('#pageNo').append(data.paging);
					}, error : function( error ) {
						alert("전송 실패!");
					}
				});
			}
		});
		 // 밀리초를 yyyy-mm-dd로 변환
         function dateChange( time ) {
            var myDate = new Date(time);
            return myDate.getFullYear() + '-' +('0' + (myDate.getMonth()+1)).slice(-2)+ '-' +  ('0' + myDate.getDate()).slice(-2); 
         }

                       

	</script> 


</body>
</html>


