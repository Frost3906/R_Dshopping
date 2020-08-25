<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-5">
	<button onclick="location.href='/member/member_manage?pageNum=1&amount=10'">회원관리</button>
	<button onclick="location.href='product_manage?pageNum=1&amount=10&manageKeyword='">상품관리</button>
	<button onclick="location.href='order_manage?pageNum=1&amount=10&manageKeyword='">주문관리</button>
	<button onclick="location.href='home_manage'">홈 화면 관리</button>
</div>
<%@ include file="../includes/footer.jsp" %> 