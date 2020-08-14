<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container mt-5 mb-5">
	<div class="row">
		<button type="button" class="btn btn-danger btn-lg float-right mt-3" onclick="location.href='admin'">뒤로가기</button>
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
				  	<button onclick="location.href='product_modify?p_code=${vo.p_code}'">수정</button>
				  	<button onclick="location.href='product_delete?p_code=${vo.p_code}'">삭제</button>
				  </th>
			    </tr>
			  </tbody>
			</c:forEach>
		</table>
        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
      	
</div>

<script>

</script>

<%@ include file="../includes/footer.jsp" %> 

