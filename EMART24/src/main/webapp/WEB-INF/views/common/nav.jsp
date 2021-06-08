<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<link rel="stylesheet" href="/emart24/resources/css/common/nav.css" />
	
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
                 <a href="${pageContext.request.contextPath}/common/">
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