<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html style="height: 100%;">

<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- 소셜 로그인 ClientID(구글) -->
  <meta name = "google-signin-client_id"content = "245346684776-185hq3i3j9iujvt4cl5e42pc4egbh0tg.apps.googleusercontent.com">


  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop</title>	
  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/shop-homepage.css" rel="stylesheet">
 
  <!-- myPage CSS -->
  <link rel="stylesheet" href="../resources/myPage/css/style.css" />
  
  <!-- SignUp Validation -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>

  <!-- 구글 로그인 -->
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

  <style>
  	th {
  		text-align: center;
  	}
  	td {
  		text-align: center;  		
  	}
    #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade .on{
        color: gold;
    }
	
  </style>
  
</head>

<body style="height: 100%;">
	<!-- Navigation -->
	<div class="fixed-top bg-dark">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="display: block;">
		
			<div class="container">
			
				<div>
				</div>
				<div>
			      <!-- <div class="collapse navbar-collapse" id="navbarResponsive"> -->
			      <div style="display: flex;">
			        <ul class="navbar-nav ml-auto" style="display: contents;">
			        <!-- 로그인 상황에 따른 navbar 변경(로그인 시) -->
			          <c:if test="${!empty auth}">
			          	<li class="nav-item active">			          
			            <a class="nav-link" style="padding: 8px;" href="/">Home
			              <span class="sr-only">(current)</span>
			            </a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" style="padding: 8px;" href="/shop/cart">Cart</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" style="padding: 8px;" href="/member/myPage?pageNum=1&amount=10" style="text-decoration: underline;">HI!! ${auth.firstName}</a>
			          </li>
			          <li class="nav-item">
			          <form action="/member/logout" method="post" id="logoutForm">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>		
			            <a class="nav-link" id="logout" style="padding: 8px;" href="/member/logout">LogOut</a>
			            <!-- <button>LogOut</button> -->
						</form>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" style="padding: 8px;" href="/board/list">Help</a>
			          </li>   			     		
   			     		
   			          <c:if test="${auth.auth=='ROLE_ADMIN'|| auth.auth=='ROLE_MANAGER'}">
			          	<li><a class="nav-link" style="padding: 8px;" href="/admin/admin">Manage</a></li>
			          </c:if>
			     
			          </c:if>
			          <!-- 로그인 상황에 따른 navbar 변경(비로그인 시) -->
			          <c:if test="${empty auth}">			          
			          <li class="nav-item active">			          
			            <a class="nav-link" style="padding: 8px;" href="/">Home
			              <span class="sr-only">(current)</span>
			            </a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" style="padding: 8px;" href="/shop/cart">Cart</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" style="padding: 8px;" href="/member/login">Sign in</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" style="padding: 8px;" href="/member/signUp">Sign up</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" style="padding: 8px;" href="/board/list">Help</a>
			          </li>
			          <!-- 권한에 따라 관리자 페이지 표시여부 -->
			          
			          <!--  empty -->
			          </c:if>
					</ul>
			      </div>
				</div>				
	    	</div>	    
	    	
	    	
			<div class="container" style="justify-content: center; padding: 15px;">
				<div style="display: flex; align-items: center;">
					<!-- 홈 로고 --><!-- 
				    <button class="navbar-toggler mr-3" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				        <span class="navbar-toggler-icon"></span>
				    </button>			 -->
	      			<a class="navbar-brand" href="/">Shop</a>
				    <!-- 검색 및 검색 버튼 -->
				    <form class="form-inline my-2 my-lg-0" method="get" action="/shop/search" style="display: contents;" >
				      <input class="form-control mr-sm-2" style="margin-right: 8px; width: 400px;" name="keyword" type="search" placeholder="Search" aria-label="Search" <c:if test="${!empty keyword}">value="${keyword}"</c:if>>
				      <input type="hidden" name="pageNum" value="1" />
				      <input type="hidden" name="amount" value="6" />
				      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				    </form>
				</div>
			</div>
		</nav>
	</div>
<script>
	let info='${info}';
	if (info !== ""){
		alert(info);
	}
	
	let logoutForm=$("#logoutForm");
	$("#logout").click(function(e){
		e.preventDefault();
		logoutForm.submit();
	})
</script>
