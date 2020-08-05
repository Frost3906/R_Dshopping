<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/shop-homepage.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script> -->
 
  <!-- myPage CSS -->
  <link rel="stylesheet" href="../resources/myPage/css/style.css" />
  
  <!-- Sign-In&Out CSS -->
  <!-- <link rel="shortcut icon" href="/resources/signIn/images/fav.jpg">
  <link rel="stylesheet" href="/resources/signIn/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/signIn/css/fontawsom-all.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/signIn/css/style.css" /> -->

</head>

<body>
	<!-- Navigation -->
	<div class="fixed-top bg-dark">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		
			<div class="container">
			
				<div>
					<!-- 홈 로고 -->
				    <button class="navbar-toggler mr-3" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				        <span class="navbar-toggler-icon"></span>
				    </button>			
	      			<a class="navbar-brand" href="/">Shop</a>
				</div>
				
				<div>
				    <!-- 검색 및 검색 버튼 -->
				    <form class="form-inline my-2 my-lg-0" method="post" action="/shop/search">
				      <input class="form-control mr-sm-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
				      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				    </form>
				</div>
				
				<div>
			      <div class="collapse navbar-collapse" id="navbarResponsive">
			        <ul class="navbar-nav ml-auto">
			        <!-- 로그인 상황에 따른 navbar 변경(로그인 시) -->
			          <c:if test="${!empty auth}">
			          	<li class="nav-item active">			          
			            <a class="nav-link" href="/">Home
			              <span class="sr-only">(current)</span>
			            </a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="#">About</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="#">Services</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="/member/myPage" style="text-decoration: underline;">HI!! ${auth.firstName}</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="/member/logout">LogOut</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="#">Contact</a>
			          </li>
   			     
   			          <c:if test="${auth.role=='admin'}">
			          	<li><a class="nav-link" href="/admin/admin">Manage</a></li>
			          </c:if>
			     
			          </c:if>
			          <!-- 로그인 상황에 따른 navbar 변경(비로그인 시) -->
			          <c:if test="${empty auth}">			          
			          <li class="nav-item active">			          
			            <a class="nav-link" href="/">Home
			              <span class="sr-only">(current)</span>
			            </a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="#">About</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="#">Services</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="/member/signIn">Sign in</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="/member/signUp">Sign up</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="#">Contact</a>
			          </li>
			          <!-- 권한에 따라 관리자 페이지 표시여부 -->
			          
			          <!--  empty -->
			          </c:if>
					</ul>
			      </div>
				</div>				
	    	</div>	    
		</nav>
	</div>