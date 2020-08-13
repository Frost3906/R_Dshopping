<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
  <!-- Page Content -->
  <div class="container">

    <div class="row">
<!-- 
      <div class="col-lg-3">

        <h1 class="my-4">TEST GIT</h1>
        <div class="list-group">
          <a href="shop/categoryList?category1=서적&pageNum=1&amount=6" class="list-group-item">서적 카테고리 리스트 페이지 테스트</a>
          <a href="shop/categoryList?category1=전자제품&pageNum=1&amount=6" class="list-group-item">전자제품 카테고리 리스트 페이지 테스트</a>
          <a href="shop/cart" class="list-group-item">장바구니 테스트</a>
        </div>

      </div> -->
      <!-- /.col-lg-3 -->

      <div class="col-lg-12">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/1110x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/1110x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/1110x350" alt="Third slide">
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

        <div class="row" style="justify-content: center; text-align: center;">

        	<!-- 상품 카드 위치 -->
			<c:forEach var="vo" items="${category}">	
		          <div class="col-lg-3 col-md-6 mb-4">
		            <div class="card h-100">
	                	<h4><a href="shop/categoryList?category1=${vo}&pageNum=1&amount=6&categoryKeyword=">${vo}</a></h4>
		              <a href="shop/categoryList?category1=${vo}&pageNum=1&amount=6&categoryKeyword="><img class="card-img-top" src="http://placehold.it/700x800" alt=""></a>
		              <div class="card-footer" style="padding: 0px">
		              	<a href="shop/categoryList?category1=${vo}&pageNum=1&amount=6&categoryKeyword="> > see more</a>
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


