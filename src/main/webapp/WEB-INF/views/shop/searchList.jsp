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
	   	   		<option value="10" <c:out value="${cri.amount==10?'selected':''}"/>>10</option>
	   	   		<option value="20" <c:out value="${cri.amount==20?'selected':''}"/>>20</option>
	   	   		<option value="30" <c:out value="${cri.amount==30?'selected':''}"/>>30</option>
	   	   		<option value="40" <c:out value="${cri.amount==40?'selected':''}"/>>40</option>
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
		    <li class="page-item active"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">4</a></li>
		    <li class="page-item"><a class="page-link" href="?pageNum=5">5</a></li>
		    <li class="page-item"><a class="page-link" href="#">6</a></li>
		    <li class="page-item"><a class="page-link" href="#">7</a></li>
		    <li class="page-item"><a class="page-link" href="#">8</a></li>
		    <li class="page-item"><a class="page-link" href="#">9</a></li>
		    <li class="page-item"><a class="page-link" href="#">10</a></li>
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
<form action="search" id="actionForm" method="post">
	<input type="hidden" name="pageNum" value="6" />
	<input type="hidden" name="amount" value="10" />
	<input type="hidden" name="type" value="3" />
	<input type="hidden" name="keyword" value="${keyword}" />
</form>
<script>    
$(function(){
    var pageBtn = $("ul > li");    //  ul > li 이를 pageBtn 으로 칭한다. (클릭이벤트는 li에 적용 된다.)
    pageBtn .find("a").click(function(){   // pageBtn 에 속해 있는  a 찾아 클릭.
	    pageBtn .removeClass("active");     // pageBtn 속에 (active) 클래스를 삭제.
	    $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
	})
 	$(".page-item").click(function(e){
		e.preventDefault();
		// 폼 전송하기
		actionForm.submit();
		
	})
});
</script>
<%@include file="../includes/footer.jsp" %> 