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
  	<div>
  		<h6>
  			<c:if test="${category3==null && category2!=null}">
  				소분류 : 
	  			<c:forEach var="list" items="${category3List}">
  					<a href="?category1=${category1}&category2=${category2}&category3=${list}" style="color:black;">
	  					<c:out value="${list}"/>  					
  					</a>
	  			</c:forEach>
  			</c:if>
 			<c:if test="${category2==null}">
				중분류 : 
	  			<c:forEach var="list" items="${category2List}">
  					<a href="?category1=${category1}&category2=${list}" style="color:black;">
	  					<c:out value="${list}"/>  					
  					</a>
	  			</c:forEach>
  			</c:if>
  		</h6>
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
		                  <a href="product?p_code=${vo.p_code}">${vo.p_code}.${vo.p_name}</a>
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

  </div>
  <!-- /.container -->
<%@include file="../includes/footer.jsp" %> 