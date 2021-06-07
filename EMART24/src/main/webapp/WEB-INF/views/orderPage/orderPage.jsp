<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	
	<c:import url="views/common/nav.jsp" />
		
	<c:import url="views/common/header.jsp" />
	
    <div class="area orderPage">
        <h2>발주 관리</h2>

        <h3>발주 신청</h3>

        <!-- 검색창 -->
        <form action="" method="post" class="searchBar">
            <!-- 상품카테고리 -->
            <h4>상품 카테고리 &nbsp;</h4> 
            <div class="category">
                <select name="Pdt" id="Pdt">
                    <option value="음료">음료</option>
                    <option value="냉동식품">냉동식품</option>
                    <option value="편의물품">편의물품</option>
                    <option value="과자">과자</option>
                    <option value="간편식">간편식</option>
                </select>
            </div>
            <!-- 카테고리 끝 -->

            <!-- 상품 번호 -->
            <h4>상품 번호 &nbsp;</h4>
            <div class="pdtNo">
                <input type="number" id="pdtNo_num">
            </div>
            <!-- 상품 번호끝 -->

            <!-- 상품명 -->
            <h4>상품명 &nbsp;</h4>
            <div class="search">
                <input type="text" class="search_text">
            </div>
            <!-- 상품명 끝-->

            <!-- 버튼 -->
            <button class="btn click">검색</button>

        </form>
        <!-- 검색창 끝-->

        <!-- 검색 리스트 -->
        <form action="">
            <table class="searchList">
                <tr>
                    <td class="td1">상품명</td>
                    <td>비비고 고기만두</td>
                    <td class="td1">금액</td>
                    <td>2,500</td>
                    <td class="td1">수량 <select name="Pdt" id="Pdt">
                            <option value="음료">음료</option>
                            <option value="냉동식품">냉동식품</option>
                            <option value="편의물품">편의물품</option>
                            <option value="과자">과자</option>
                            <option value="간편식">간편식</option>
                        </select>
                    </td>
                    <td><button class="btn click">추가</button></td>
                </tr>
                <tr>
                    <td class="td1">상품명</td>
                    <td>비비고 고기만두</td>
                    <td class="td1">금액</td>
                    <td>2,500</td>
                    <td class="td1"> 수량 <select name="Pdt" id="Pdt">
                            <option value="음료">음료</option>
                            <option value="냉동식품">냉동식품</option>
                            <option value="편의물품">편의물품</option>
                            <option value="과자">과자</option>
                            <option value="간편식">간편식</option>
                        </select>
                    </td>
                    <td><button class="btn click">추가</button></td>
                </tr>
                <tr>
                    <td class="td1">상품명</td>
                    <td>비비고 고기만두</td>
                    <td>금액</td>
                    <td>2,500</td>
                    <td>수량 <select name="Pdt" id="Pdt">
                            <option value="음료">음료</option>
                            <option value="냉동식품">냉동식품</option>
                            <option value="편의물품">편의물품</option>
                            <option value="과자">과자</option>
                            <option value="간편식">간편식</option>
                        </select>
                    </td>
                    <td><button class="btn click">추가</button></td>
                </tr>
                <tr>
                    <td class="td1">상품명</td>
                    <td>비비고 고기만두</td>
                    <td>금액</td>
                    <td>2,500</td>
                    <td>수량 <select name="Pdt" id="Pdt">
                            <option value="음료">음료</option>
                            <option value="냉동식품">냉동식품</option>
                            <option value="편의물품">편의물품</option>
                            <option value="과자">과자</option>
                            <option value="간편식">간편식</option>
                        </select>
                    </td>
                    <td><button class="btn click">추가</button></td>
                </tr>
            </table>
        </form>
        <!-- 검색 리스트 끝-->

        <!-- 발주 리스트 -->
        <form action="">
            <table class="table">
                <thead class="thead">
                    <tr>
                        <th>
                            <h4>발주 번호</h4>
                        </th>
                        <th>
                            <h4>상품 번호</h4>
                        </th>
                        <th>
                            <h4>상품명</h4>
                        </th>
                        <th>
                            <h4>수량</h4>
                        </th>
                        <th>
                            <h4>금액</h4>
                        </th>
                        <th>
                            <h4>발주 날짜</h4>
                        </th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody class="tbody">
                    <tr>
                        <td>51</td>
                        <td>13</td>
                        <td>젤리</td>
                        <td>5</td>
                        <td>5000</td>
                        <td>6월 6일</td>
                        <td><button class="btn click">삭제</button></td>
                    </tr>
                </tbody>
                <tfoot class="tfoot">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>총 금액</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
        </form>
        <!-- 발주 리스트 끝 -->

        <button class="btn submit">다시 작성</button>
        <button class="btn submit">발주하기</button>
        
    </div>
</body>
</html>