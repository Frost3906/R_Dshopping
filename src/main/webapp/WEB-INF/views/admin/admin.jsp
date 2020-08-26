<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<div class="container" style="min-height: 100%; margin-bottom: -120px;">
	<div class="row mb-3">
		<h1>Manager Page</h1>
	</div>
	<div class="row">
      <div class="col-lg-12">
        <div class="row list">
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="h-100">
              <a href="/member/member_manage?pageNum=1&amount=10"><img class="card-img-top" src="/resources/img/usericon.png" width="253px" height="253px"></a>
              <div>
              	<h3 style="text-align: center;">User</h3>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="h-100">
              <a href="product_manage?pageNum=1&amount=10&manageKeyword="><img class="card-img-top" src="/resources/img/producticon.png" width="253px" height="253px"></a>
              <div>
              	<h3 style="text-align: center;">Product</h3>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="h-100">
              <a href="order_manage?pageNum=1&amount=10&manageKeyword="><img class="card-img-top" src="/resources/img/ordericon.png" width="253px" height="253px"></a>
              <div>
              	<h3 style="text-align: center;">Order</h3>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="h-100">
              <a href="home_manage"><img class="card-img-top" src="/resources/img/homeicon.png" width="253px" height="253px"></a>
              <div>
              	<h3 style="text-align: center;">Banner / Category</h3>
              </div>
            </div>
          </div>
        </div>
        <!-- /.row .list -->

      </div>
		
	</div>
</div>
<%@ include file="../includes/footer.jsp" %> 