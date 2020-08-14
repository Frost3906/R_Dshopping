<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container mt-5 mb-5">
	<div>
		<h1>상품 관리</h1>
	</div>
  	<div class="row mb-3">
  		<div class="col-auto mr-auto">
  			<!-- 검색어 보여주기 -->
  			<h5 class="mb-0 mt-3">result for "${keyword}"</h5>
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
		      <th scope="col">상품코드</th>
		      <th scope="col">상품명</th>
		      <th scope="col">가격</th>
		      <th scope="col">재고</th>
		      <th scope="col">별점</th>
		      <th scope="col">상품설명</th>
		      <th scope="col">카테고리1</th>
		      <th scope="col">카테고리2</th>
		      <th scope="col">카테고리3</th>
		      <th scope="col">속성</th>
		      <th scope="col">관리</th>
		    </tr>
		  </thead>
		  <c:forEach var="vo" items="${vo}">	
			  <tbody>
			    <tr>
			      <th scope="col">${vo.p_code}</th>
			      <th scope="col">${vo.p_name}</th>
			      <th scope="col">${vo.p_price}</th>
			      <th scope="col">${vo.p_stock}</th>
			      <th scope="col">${vo.p_rating}</th>
			      <th scope="col">${vo.p_content}</th>
			      <th scope="col">${vo.p_category1}</th>
			      <th scope="col">${vo.p_category2}</th>
			      <th scope="col">${vo.p_category3}</th>
			      <th scope="col">${vo.property}</th>
			      <th scope="col">
				  	<button onclick="location.href='/shop/product?p_code=${vo.p_code}'">조회</button>
				  	<button onclick="location.href='product_modify?p_code=${vo.p_code}&pageNum=${pageNum}&amount=${amount}'">수정</button>
				  	<button class="product-delete">삭제</button>
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
	<div class="row">
		<button type="button" class="btn btn-danger btn-lg float-right mt-3" onclick="location.href='admin'">뒤로가기</button>
	</div>
      	
</div>

<!-- 정보를 전달할 히든 폼 -->
<form action="product_manage" id="actionForm">
	<input type="hidden" name="keyword" value="${keyword}" />
	<input type="hidden" name="pageNum" value="${pageNum}" />
	<input type="hidden" name="amount" value="${amount}" />
</form>
<input type="hidden" id="productAmt" name="productAmt" value="${productAmt}" />
<!-- 페이지 나누기 모달 추가 -->
<%@ include file="../option/paginationModal.jsp" %> 
<!-- 페이지 나누기 관련 js -->
<script src="/resources/js/paging.js"></script>
<%@ include file="../includes/footer.jsp" %> 

