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

<!-- <form class="g-signin2" action="" id="SNSSignIn" data-onsuccess="onSignIn"> -->
	<div class="g-signin2" data-onsuccess="onSignIn">
		<input type="hidden" name=googleID />
		<input type="hidden" name=firstName />
		<input type="hidden" name=lastName />
		<input type="hidden" name=email />
	</div>
<!-- </form>  -->

<script>
	/* var googleForm=$("#SNSSignIn"); */
	
	function onSignIn(googleUser) {		
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('FirstName: ' + profile.getGivenName());
	  console.log('LastName: ' + profile.getFamilyName());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
	  let googleID=profile.getId();
	  let firstName=profile.getGivenName();
	  let lastName=profile.getFamilyName();
	  let email=profile.getEmail();
	  
	  /* $("input[name='googleID']").val(googleID);
	  $("input[name='firstName']").val(firstName);
	  $("input[name='lastName']").val(lastName);
	  $("input[name='email']").val(email);
	  
	  console.log($("input[name='googleID']").val(googleID));
	  console.log($("input[name='firstName']").val(firstName));
	  console.log($("input[name='lastName']").val(lastName));
	  console.log($("input[name='email']").val(email)); */
	  
	  
		let data = {
				googleID:googleID,
				firstName:firstName,
				lastName:lastName,
				email:email
		  };
	  console.log(data);
	  /* $.ajax({
		  url:"/auth/google/callback",
		  type:"get",
		  data:data,
		  datatype:"json",
		  success:function(result){
			  alert("성공")
			  window.location.href="/"	 		  
		  },
		  error:function(){
			  alert("실패")
		  }		  
	  }) */ 
	}
</script>

<%@ include file="../includes/footer.jsp" %> 


