<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">TEST GIT</h1>
        <h1 class="my-4">TEST GIT2</h1>
        <div class="list-group">
          <a href="shop/categoryList?category1=서적" class="list-group-item">서적 카테고리 리스트 페이지 테스트</a>
          <a href="shop/categoryList?category1=전자제품" class="list-group-item">전자제품 카테고리 리스트 페이지 테스트</a>
          <a href="shop/cart" class="list-group-item">장바구니 테스트</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

        	<!-- 상품 카드 위치 -->
			<c:forEach var="vo" items="${product}">	
		          <div class="col-lg-4 col-md-6 mb-4">
		            <div class="card h-100">
		              <a href="shop/product?p_code=${vo.p_code}"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
		              <div class="card-body">
		                <h4 class="card-title">
		                  <a href="shop/product?p_code=${vo.p_code}">${vo.p_code}.</a>
		                </h4>
		                <h4 class="card-title">
		                  <a href="shop/product?p_code=${vo.p_code}">${vo.p_name}</a>
		                </h4>
		                <h5>${vo.p_price}</h5>
		                <p class="card-text">${vo.p_content}</p>
		              </div>
		              <div class="card-footer">
		                <small class="text-muted">
		                	<c:if test="${vo.p_rating==0}">
		                		&#9734; &#9734; &#9734; &#9734; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==1}">
		                		&#9733; &#9734; &#9734; &#9734; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==2}">
		                		&#9733; &#9733; &#9734; &#9734; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==3}">
		                		&#9733; &#9733; &#9733; &#9734; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==4}">
		                		&#9733; &#9733; &#9733; &#9733; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==5}">
		                		&#9733; &#9733; &#9733; &#9733; &#9733;
		                	</c:if>
		                </small>
		              </div>
		            </div>
		          </div>
	        </c:forEach>
          
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
<%@ include file="../includes/footer.jsp" %> 


