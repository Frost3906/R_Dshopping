<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>

<div class="container">
	<div class="row">
      <div class="col-lg-12">
        <div class="row mt-5">
        	<!-- 상품 카드 위치 -->
        	<img src="http://placehold.it/400x400" alt=""/>
        	<div class="product-details ml-5">
	        	<h1>상품 이름</h1>
	        	<p>상품설명</p>
	 			<br>
	 			<ul class="list-group list-group-flush">
	 				<li class="list-group-item">가격   	${vo.price}</li>
	 				<li class="list-group-item">판매단위	${vo.price}</li>
	 				<li class="list-group-item">중량/용량	${vo.price}</li>
	 				<li class="list-group-item">배송구분	${vo.price}</li>
	 				<li class="list-group-item">포장타입	${vo.price}</li>
	 				
	 			</ul>       	
        	</div>
        		
        	
        </div>
        		<div class="float-right mb-3">
        			<button class="btn btn-success btn-lg mt-3">장바구니 담기</button>
        		</div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
	
	
</div>