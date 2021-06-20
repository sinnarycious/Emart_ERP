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
	<script src="/emart24/resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/emart24/resources/css/common/reset.css">
    <link rel="stylesheet" href="/emart24/resources/css/eventPage.css">

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
         
<!-- 
            <h4>행사 일자</h4><input type="date" name="evntDateS1" id="evntDateS1"/> ~ <input type="date" name="evntDateS2" id="evntDateS2"/>
            <h4>행사 번호</h4><input type="number" name="evntNo" id="evntNo" style="width:100px;" min="0"/>
			<h4>행사명</h4><input type="text" name="evntTitle" id = "evntTitle" style="width:510px;" placeholder="행사명을 검색하세요. "/>
			

            <h4>행사 일자</h4><input type="date" name="evntDateS" id="evntDateS"/> ~ <input type="date" name="evntDateE" id="evntDateE"/>
			<h4>행사명</h4><input type="text" name="evntName" id = "evntName" style="width:700px;" placeholder="행사명을 검색하세요. "/>
 -->
            <button id="searchBtn" class="btn search">조회</button>

        </div>
        <c:set var="today" value="<%= new Date(new java.util.Date().getTime()) %>"/>
        <table class="recruit">
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
            <c:forEach items="${list}" var="e"> 
            <tr class="item">
                <td>${e.evntNo}</td>
                <td>${e.evntTitle}</td> 
                
                <td>${e.evntDateS} - ${e.evntDateE}</td>
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
        </table>
        <div class="pageNo">
            <c:out value="${pageBar}" escapeXml="false"/>
        </div>
    </div>
    </section>  
	<script>
		$('.item').on('click', function(){
			$('.evnt-content').hide(1000);
			
			$(this).next('.evnt-content').show(1000);
		});
		
		/* $('#searchBtn').on('click', function(){
				
				var evntDateS = $('#evntDateS').val();
				var evntDateD = $('#evntDateD').val();
				var evntTitle = $('#evntTitle').val();
				
				if(evntTitle != null){
 				$.ajax({ // jQuery 전용 함수
 					url : "${pageContext.request.contextPath}/event/searchInfo.do",
 					type : "get",
 					data : {
 						evntDateS : evntDateS,
 						evntDateD : evntDateD,
 						evntTitle : evntTitle,
 					}, 
 					dataType : 'json',
 					success : function( data ) {
 						alert("전송 성공!");
 						console.log(searchList);
 						
 					}, error : function( error ) {
 						alert("전송 실패!");
 					}
 				});
				}
			}); */

	</script> 


</body>
</html>


