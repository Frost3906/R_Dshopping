<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container mt-5 mb-5">
	<div class="row">
      <div class="col-lg-12">
        <div class="row mt-5">
        	<!-- 상품 카드 위치 -->
        	<img src="http://placehold.it/400x400" alt=""/>
        	<div class="product-details ml-5 col-lg">
        		<form action="" method="post">
	        	<h1>상품 등록</h1>
	        	<br>
	 			
	 			<ul class="list-group list-group-flush">
	 				<li class="list-group-item">
		 					<div class="float-left">상품 코드</div>
		 					<div class="float-right">
								<input type="text" id="p_code" name="p_code"/>
							</div>
	 			  	</li>	 			
	 				<li class="list-group-item">
		 					<div class="float-left">상품 이름</div>
		 					<div class="float-right">
								<input type="text" id="p_name" name="p_name"/>
							</div>
	 			  	</li>
	 				<li class="list-group-item">
		 					<div class="float-left">상품 설명</div>
		 					<div class="float-right">
								<input type="text" id="p_content" name="p_content"/>
							</div>
	 			  	</li>	 			  		 			
	 				<li class="list-group-item">
		 					<div class="float-left">가격</div>
		 					<div class="float-right">
								<input type="text" id="p_price" name="p_price"/>
							</div>
	 			  	</li>
	 				<li class="list-group-item">
	 						<div class="float-left">재고</div>
	 						<div class="float-right">
								<input type="number" id="p_stock" name="p_stock"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">	
	 						<div class="float-left">항목</div>
	 						<div class="float-right">
								<input type="text" id="p_code" name="p_code"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">
	 						<div class="float-left">속성</div>
	 						<div class="float-right">
								<input type="text" />
	 						</div>
	 				</li>
	 			</ul>       	
        	<div class="mb-3">
        		<button class="btn btn-success btn-lg float-right mt-3">상품 등록</button>
        	</div>
        	</form>
        	</div>
        		
        </div>
        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
      	
</div>

<script>

</script>

<%@ include file="../includes/footer.jsp" %> 

