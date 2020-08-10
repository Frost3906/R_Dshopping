<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
  <!-- Page Content -->
  <div class="container mt-3">
  	<div>
  		<h1>Category List</h1>
  	</div>
  	<div>
  		<h5>
  			result for "
  			<c:if test="${not empty category1}">
  				<a href="?category1=${category1}&pageNum=1&amount=6" style="color:black;">
	  				<c:out value="${category1}"/>
  				</a>
  			</c:if>
  			<c:if test="${not empty category2}">
  				<c:out value=" > "></c:out>
  				<a href="?category1=${category1}&category2=${category2}&pageNum=1&amount=6" style="color:black;">
	  				<c:out value="${category2}"/>
  				</a>
  			</c:if>
  			<c:if test="${not empty category3}">
  				<c:out value=" > "></c:out>
  				<a href="?category1=${category1}&category2=${category2}&category3=${category3}&pageNum=1&amount=6" style="color:black;">
  					<c:out value="${category3}"/>
  				</a>
  			</c:if>
  			 "
  		</h5>
  	</div>
  	<div class="row mb-3">
  		<div class="col-auto mr-auto">
	  		<h5 class="mb-0 mt-3">
	  			<c:if test="${category3==null && category2!=null}">
	  				소분류 : 
		  			<c:forEach var="list" items="${category3List}">
	  					<a class="downCategory3" href="${list}" style="color:black;">
		  					<c:out value="${list}"/>  					
	  					</a>
		  			</c:forEach>
	  			</c:if>
	 			<c:if test="${category2==null}">
					중분류 : 
		  			<c:forEach var="list" items="${category2List}">
	  					<a class="downCategory2" href="${list}" style="color:black;">
		  					<c:out value="${list}"/>
	  					</a>
		  			</c:forEach>
	  			</c:if>
	  		</h5>
  		</div>
  		<div class="col-auto">
  			<%@ include file="optionshop/listAmount.jsp" %> 
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
  		<%@ include file="optionshop/pagination.jsp" %> 
	</div>
  </div>
  <!-- /.container -->
<!-- 정보를 전달하는 히든 폼 -->
<form action="categoryList" id="actionForm">
	<input type="hidden" name="category1" value="${category1}" />
	<c:if test="${not empty category2}">
		<input type="hidden" name="category2" value="${category2}" />
	</c:if>
	<c:if test="${not empty category3}">
	<input type="hidden" name="category3" value="${category3}" />
	</c:if>
	<input type="hidden" name="pageNum" value="${pageNum}" />
	<input type="hidden" name="amount" value="${amount}" />
</form>            
<input type="hidden" id="productAmt" name="productAmt" value="${productAmt}" />
<!-- 모달 추가 -->
<%@ include file="optionshop/paginationModal.jsp" %>
<!-- 페이지 나누기 관련 js -->
<script src="/resources/js/paging.js"></script>
<!-- 카테고리 리스트 페이지 히든 폼 전송 js -->
<script src="/resources/js/categoryListSubmit.js"></script>
<%@include file="../includes/footer.jsp" %> 