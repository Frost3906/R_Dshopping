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
        		<form action="product_modify" method="post" id="product_modify">
	        	<h1>상품 수정</h1>
	        	<br>
	 			
	 			<ul class="list-group list-group-flush">
	 				<li class="list-group-item">
		 					<div class="float-left">상품 코드</div>
		 					<div class="float-right">
								<input type="text" id="p_code" name="p_code" value="${vo.p_code}"/>
							</div>
	 			  	</li>	 			
	 				<li class="list-group-item">
		 					<div class="float-left">상품 이름</div>
		 					<div class="float-right">
								<input type="text" id="p_name" name="p_name" value="${vo.p_name}"/>
							</div>
	 			  	</li>
	 				<li class="list-group-item">
		 					<div class="float-left">상품 설명</div>
		 					<div class="float-right">
								<input type="text" id="p_content" name="p_content" value="${vo.p_content}"/>
							</div>
	 			  	</li>	 			  		 			
	 				<li class="list-group-item">
		 					<div class="float-left">가격</div>
		 					<div class="float-right">
								<input type="text" id="p_price" name="p_price" value="${vo.p_price}"/>
							</div>
	 			  	</li>
	 				<li class="list-group-item">
	 						<div class="float-left">재고</div>
	 						<div class="float-right">
								<input type="number" id="p_stock" name="p_stock" value="${vo.p_stock}"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">	
	 						<div class="float-left">대분류</div>
	 						<div class="float-right">
								<input type="text" id="p_category1" name="p_category1" value="${vo.p_category1}"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">	
	 						<div class="float-left">중분류</div>
	 						<div class="float-right">
								<input type="text" id="p_category2" name="p_category2" value="${vo.p_category2}"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">	
	 						<div class="float-left">소분류</div>
	 						<div class="float-right">
								<input type="text" id="p_category3" name="p_category3" value="${vo.p_category3}"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">
	 						<div class="float-left">속성</div>
	 						<div class="float-right">
								<input type="text" id="property" name="property" value="${vo.property}"/>
	 						</div>
	 				</li>
	 			</ul>       	
        	<div class="mb-3">
        		<input type="hidden" name="pageNum" value="${pageNum}" />
        		<input type="hidden" name="amount" value="${amount}" />
        		<input type="hidden" name="p_code" value="${vo.p_code}" />
        		<button type="button" class="btn btn-danger btn-lg float-right mt-3" onclick="location.href='product_manage?pageNum=${pageNum}&amount=${amount}'">뒤로가기</button>
        		<button type="submit" class="btn btn-success btn-lg float-right mt-3">상품 수정</button>
        	</div>
        	</form>
        	</div>
        		
        </div>
        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
      	
</div>

<div class="modal" tabindex="-1" role="dialog" id="modifyModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="align-items: center">
      <div class="modal-header">
        <h5 class="modal-title">수정하시겠습니까?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
	      	<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">속 성</th>
			      <th scope="col">변경 전</th>
			      <th scope="col">변경 후</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">상품코드</th>
			      <td>${vo.p_code}</td>
			      <td><label id="modCode"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">상품이름</th>
			      <td>${vo.p_name}</td>
			      <td><label id="modName"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">상품설명</th>
			      <td>${vo.p_content}</td>
			      <td><label id="modContent"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">가격</th>
			      <td>${vo.p_price}</td>
			      <td><label id="modPrice"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">재고</th>
			      <td>${vo.p_stock}</td>
			      <td><label id="modStock"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">대분류</th>
			      <td>${vo.p_category1}</td>
			      <td><label id="modCategory1"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">중분류</th>
			      <td>${vo.p_category2}</td>
			      <td><label id="modCategory2"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">소분류</th>
			      <td>${vo.p_category3}</td>
			      <td><label id="modCategory3"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">속성</th>
			      <td>${vo.property}</td>
			      <td><label id="modProperty"></label></td>
			    </tr>
			  </tbody>
			</table>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<script>
$(function(){
	let modifyForm = $("#product_modify");
	$(".btn-success").click(function(e){
		e.preventDefault();
		$("#modCode").text($("#p_code").val());
		$("#modName").text($("#p_name").val());
		$("#modContent").text($("#p_content").val());
		$("#modPrice").text($("#p_price").val());
		$("#modStock").text($("#p_stock").val());
		$("#modCategory1").text($("#p_category1").val());
		$("#modCategory2").text($("#p_category2").val());
		$("#modCategory3").text($("#p_category3").val());
		$("#modProperty").text($("#property").val());
		$("#modifyModal").modal("show");
		$(".btn-secondary").click(function(){
			modifyForm.submit();
		})
	})
})
</script>

<%@ include file="../includes/footer.jsp" %> 

