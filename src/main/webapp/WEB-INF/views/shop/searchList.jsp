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
	   	   	<select class="form-control" name="amount">
	   	   		<option value="3" <c:out value="${amount==3?'selected':''}"/>>3</option>
	   	   		<option value="6" <c:out value="${amount==6?'selected':''}"/>>6</option>
	   	   		<option value="9" <c:out value="${amount==9?'selected':''}"/>>9</option>
	   	   		<option value="12" <c:out value="${amount==12?'selected':''}"/>>12</option>
	   	   	</select>
  		</div>
  	</div>
    <div class="row">
      <div class="col-lg-12">
        <div class="row list">
        	<!-- 상품 카드 위치 -->
			<c:forEach var="vo" items="${product}">	
		          <div class="col-lg-4 col-md-6 mb-4">
		            <div class="card h-100">
		              <a href="product?p_code=${vo.p_code}"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
		              <div class="card-body">
		                <h4 class="card-title">
		                  <a href="product?p_code=${vo.p_code}">${vo.p_code}.</a>
		                </h4>
		                <h4 class="card-title">
		                  <a href="product?p_code=${vo.p_code}">${vo.p_name}</a>
		                </h4>
		                <h5>${vo.p_price}</h5>
		                <p class="card-text">${vo.p_content}</p>
		              </div>
		              <div class="card-footer">
		                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
		              </div>
		            </div>
		          </div>
	        </c:forEach>
        </div>
        <!-- /.row .list -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->
    
	<div>
		<div style="display: table; margin-left: auto; margin-right: auto;">
		  <ul class="pagination mb-3">
		    <li class="page-item">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">First</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">...</a></li>
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <li class="page-item ${pageNum==1?'active':''}"><a class="page-link" href="1">1</a></li>
		    <li class="page-item ${pageNum==2?'active':''}"><a class="page-link" href="2">2</a></li>
		    <li class="page-item ${pageNum==3?'active':''}"><a class="page-link" href="3">3</a></li>
		    <li class="page-item ${pageNum==4?'active':''}"><a class="page-link" href="4">4</a></li>
		    <li class="page-item ${pageNum==5?'active':''}"><a class="page-link" href="5">5</a></li>
		    <li class="page-item ${pageNum==6?'active':''}"><a class="page-link" href="6">6</a></li>
		    <li class="page-item ${pageNum==7?'active':''}"><a class="page-link" href="7">7</a></li>
		    <li class="page-item ${pageNum==8?'active':''}"><a class="page-link" href="8">8</a></li>
		    <li class="page-item ${pageNum==9?'active':''}"><a class="page-link" href="9">9</a></li>
		    <li class="page-item ${pageNum==10?'active':''}"><a class="page-link" href="10">10</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">Next</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">...</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">Last</a>
		    </li>
		  </ul>
		</div>
	</div>
	
	
  </div>
  <!-- /.container -->
<form action="search" id="actionForm">
	<input type="hidden" name="keyword" value="${keyword}" />
	<input type="hidden" name="pageNum" value="${pageNum}" />
	<input type="hidden" name="amount" value="${amount}" />
</form>
<script>    
$(function(){
	let actionForm = $("#actionForm");
 	$(".page-item a").click(function(e){
		e.preventDefault();
		// 전송해야 할 폼 가져온 후 pageNum 의 값과 amount 값을 변경한 후
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// 폼 전송하기
		actionForm.submit();		
	})
	
	$(".form-control").change(function(e){
		e.preventDefault();
		// 전송해야 할 폼 가져온 후 amount 값을 변경한 후
		actionForm.find("input[name='amount']").val($(this).val());
		// 폼 전송하기
		actionForm.submit();
	})
});
</script>
<%@include file="../includes/footer.jsp" %> 