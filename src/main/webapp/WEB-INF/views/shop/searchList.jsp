<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
  <!-- Page Content -->
  <div class="container mt-3">
	<div>
		<h1>Search List</h1>
	</div>
  	<div class="row mb-3">
  		<div class="col-auto mr-auto">
  			<!-- 검색어 보여주기 -->
  			<h5 class="mb-0 mt-3">result for "${keyword}"</h5>
  		</div>
  		<div class="col-auto">
  			<%@ include file="../option/listAmount.jsp" %> 
  		</div>
  	</div>
    <div class="row">
      <div class="col-lg-12">
        <div class="row list">
        	<!-- 상품 카드 위치 -->
  			<%@ include file="optionshop/productCard.jsp" %> 
        </div>
        <!-- /.row .list -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->
    
	<div>
		<!-- 페이지 나누기 부분 -->
  		<%@ include file="../option/pagination.jsp" %> 
	</div>
  </div>
  <!-- /.container -->
<!-- 정보를 전달할 히든 폼 -->
<form action="search" id="actionForm">
	<input type="hidden" name="keyword" value="${keyword}" />
	<input type="hidden" name="pageNum" value="${pageNum}" />
	<input type="hidden" name="amount" value="${amount}" />
</form>
<input type="hidden" id="productAmt" name="productAmt" value="${productAmt}" />
<!-- 모달 추가 -->
<%@ include file="../option/paginationModal.jsp" %> 
<!-- 페이지 나누기 관련 js -->
<script src="/resources/js/paging.js"></script>
<%@include file="../includes/footer.jsp" %> 