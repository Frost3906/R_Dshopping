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
  				<a href="?category1=${category1}" style="color:black;">
	  				<c:out value="${category1}"/>
  				</a>
  			</c:if>
  			<c:if test="${not empty category2}">
  				<c:out value=" > "></c:out>
  				<a href="?category1=${category1}&category2=${category2}" style="color:black;">
	  				<c:out value="${category2}"/>
  				</a>
  			</c:if>
  			<c:if test="${not empty category3}">
  				<c:out value=" > "></c:out>
  				<a href="?category1=${category1}&category2=${category2}&category3=${category3}" style="color:black;">
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
	  					<a id="downCategory3" href="${list}" style="color:black;">
		  					<c:out value="${list}"/>  					
	  					</a>
		  			</c:forEach>
	  			</c:if>
	 			<c:if test="${category2==null}">
					중분류 : 
		  			<c:forEach var="list" items="${category2List}">
	  					<a id="downCategory2" href="${list}" style="color:black;">
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
<script src="/resources/js/paging.js"></script>
<script>
$(function(){
	// 정보를 보낼 hidden 폼인 actionForm 가져오기
	let actionForm = $("#actionForm");
	

	// 중분류 카테고리 클릭시 폼 전송
	$("#downCategory2").click(function(e){
		e.preventDefault();
		
		// amount 변경시 1번 페이지로 이동
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.append('<input type="hidden" name="category2" value="'+$(this).attr("href")+'" />')
		// 폼 전송하기
		actionForm.submit();
	})
	// 소분류 카테고리 클릭시 폼 전송
	$("#downCategory3").click(function(e){
		e.preventDefault();
		
		// amount 변경시 1번 페이지로 이동
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.append('<input type="hidden" name="category3" value="'+$(this).attr("href")+'" />')
		// 폼 전송하기
		actionForm.submit();
	})
});
</script>
<%@include file="../includes/footer.jsp" %> 