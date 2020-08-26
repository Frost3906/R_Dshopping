<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-5 mb-5">
	<div>
		<h1>Product Manage</h1>
	</div>
  	<div class="row mb-3">
  		<div class="col-auto mr-auto">
  			<!-- 검색어 보여주기 -->
  			<h5 class="mb-0 mt-3">result for "${manageKeyword}"</h5>
  		</div>
  		<div class="col-auto">
  		<select class="form-control" id="amount" name="amount">
			<option value="10" <c:out value="${amount==10?'selected':''}"/>>10</option>
			<option value="20" <c:out value="${amount==20?'selected':''}"/>>20</option>
			<option value="30" <c:out value="${amount==30?'selected':''}"/>>30</option>
			<option value="50" <c:out value="${amount==50?'selected':''}"/>>50</option>
		</select>
  		</div>
  	</div>
	<div class="row">
      <div class="col-lg-12"><table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">Code</th>
		      <th scope="col">Name</th>
		      <th scope="col">Price</th>
		      <th scope="col">Stock</th>
		      <th scope="col">Rating</th>
		      <th scope="col">Content</th>
		      <th scope="col">Big_Category</th>
		      <th scope="col">Mid_Category</th>
		      <th scope="col">Small_Category</th>
		      <th scope="col">Tag</th>
		      <th scope="col">Manage</th>
		    </tr>
		  </thead>
		  <c:forEach var="vo" items="${vo}">	
			  <tbody>
			    <tr>
			      <th scope="col">${vo.p_code}</th>
			      <th scope="col">${vo.p_name}</th>
			      <th scope="col">${vo.p_price} $</th>
			      <th scope="col">${vo.p_stock}</th>
			      <th scope="col">${vo.p_rating}</th>
			      <th scope="col">${vo.p_content}</th>
			      <th scope="col">${vo.p_category1}</th>
			      <th scope="col">${vo.p_category2}</th>
			      <th scope="col">${vo.p_category3}</th>
			      <th scope="col">${vo.property}</th>
			      <th scope="col">
				  	<button onclick="location.href='/shop/product?p_code=${vo.p_code}'">Go to Product</button>
				  	<button onclick="location.href='product_modify?p_code=${vo.p_code}&pageNum=${pageNum}&amount=${amount}&manageKeyword=${manageKeyword}'">Modify</button>
				  	<button class="product-delete" value="${vo.p_code}">Delete</button>
				  </th>
			    </tr>
			  </tbody>
			</c:forEach>
		</table>
        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
	<div>
		<!-- 페이지 나누기 부분 -->
  		<%@ include file="../option/pagination.jsp" %> 
	</div>
	
  	<div class="row mb-3" style="display: flex; justify-content: center;">
  		<div style="margin-right: 5px;">
  			<h4>Search in Category : </h4>
  		</div>
  		<div>
		    <!-- 검색 및 검색 버튼 -->
		    <form class="form-inline my-2 my-lg-0" method="get" action="product_manage" style="display: contents;" >
		      <input class="form-control mr-sm-2" style="margin-right: 8px; width: 200px;" name="keyword" type="search" placeholder="Search in Keyword" aria-label="Search" <c:if test="${!empty manageKeyword}">value="${manageKeyword}"</c:if>>
		      <input type="hidden" name="pageNum" value="1" />
		      <input type="hidden" name="amount" value="${amount}" />
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    </form>  		
  		</div>
  	</div>
	<div class="row">
		<button type="button" class="btn btn-danger btn-lg float-right mt-3" onclick="location.href='admin'">Go Back</button>
		<button type="button" class="btn btn-success btn-lg float-right mt-3" onclick="location.href='product_manage?pageNum=1&amount=10&manageKeyword='">Show ALL Index</button>
		<button type="button" class="btn btn-success btn-lg float-right mt-3" onclick="location.href='add'">Insert Product</button>
	</div>
</div>

<!-- 정보를 전달할 히든 폼 -->
<form action="product_manage" id="actionForm">
	<input type="hidden" name="manageKeyword" value="${manageKeyword}" />
	<input type="hidden" name="pageNum" value="${pageNum}" />
	<input type="hidden" name="amount" value="${amount}" />
</form>
<input type="hidden" id="productAmt" name="productAmt" value="${productAmt}" />
<!-- 페이지 나누기 모달 추가 -->
<%@ include file="../option/paginationModal.jsp" %> 
<!-- 페이지 나누기 관련 js -->
<script src="/resources/js/paging.js"></script>
<div class="modal" tabindex="-1" role="dialog" id="deleteModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="align-items: center">
      <div class="modal-header">
        <h5 class="modal-title">삭제하시겠습니까?</h5>
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
			      <th scope="col">내 용</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">상품코드</th>
			      <td><label id="delCode"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">상품이름</th>
			      <td><label id="delName"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">상품설명</th>
			      <td><label id="delContent"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">가격</th>
			      <td><label id="delPrice"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">재고</th>
			      <td><label id="delStock"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">대분류</th>
			      <td><label id="delCategory1"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">중분류</th>
			      <td><label id="delCategory2"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">소분류</th>
			      <td><label id="delCategory3"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">속성</th>
			      <td><label id="delProperty"></label></td>
			    </tr>
			  </tbody>
			</table>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary product-delete-btn" data-dismiss="modal">삭제</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(function(){
		$(".product-delete").click(function(e){
			e.preventDefault();
			$('#deleteModal').modal("show");
			// this의 p_code를 받아온 후 
			let deleteCode = $(this).val();
			// ajax로 코드를 보내서 db 조회 후 정보 뿌려주기
			$.ajax({
				type : 'GET',
				url : '/admin/deleteInfo',
				data : {"p_code" : deleteCode},
				success : function(result){
					// 정보 뿌려주기
					$("#delCode").text(result.p_code);
					$("#delName").text(result.p_name);
					$("#delContent").text(result.p_content);
					$("#delPrice").text(result.p_price);
					$("#delStock").text(result.p_stock);
					$("#delCategory1").text(result.p_category1);
					$("#delCategory2").text(result.p_category2);
					$("#delCategory3").text(result.p_category3);
					$("#delProperty").text(result.property);
				},
			    error:function(request,status,error){
			        alert("실패");
			    }
			})
			// product-delete-btn 에 href로 p_code, pageNum, amount 넘겨주면서 리스트로 이동
			let actionForm = $("#actionForm");
			var keyword = actionForm.find("input[name='manageKeyword']").val();
			if(!keyword){
				$(".product-delete-btn").attr('onClick',"location.href='product_delete?p_code="+deleteCode+"&pageNum="+${pageNum}+"&amount="+${amount}+"&manageKeyword="+"'");
			} else {
				$(".product-delete-btn").attr('onClick',"location.href='product_delete?p_code="+deleteCode+"&pageNum="+${pageNum}+"&amount="+${amount}+"&manageKeyword="+keyword+"'");
			}
		});
	})
</script>
<%@ include file="../includes/footer.jsp" %> 

