<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container mt-5 mb-5">
	<div>
		<h1>회원 관리</h1>
	</div>
  	<div class="row mb-3">
  		<div class="col-auto mr-auto">
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
		      <th scope="col">E-mail</th>
		      <th scope="col">FirstName</th>
		      <th scope="col">LastName</th>
		      <th scope="col">Membership Level</th>
		      <th scope="col">Country</th>
		      <th scope="col">Mobile</th>
		      <th scope="col">Manage</th>
		    </tr>
		  </thead>
		  <c:forEach var="list" items="${list}">	
			  <tbody>
			    <tr>
			      <th scope="col">${list.email}</th>
			      <th scope="col">${list.firstName}</th>
			      <th scope="col">${list.lastName}</th>
			      <th scope="col">${list.memLevel}</th>
			      <th scope="col">${list.country}</th>
			      <th scope="col">${list.mobile}</th>
			      <th scope="col">
				  	<button onclick="location.href='#'">조회</button><!-- 회원 상세 페이지 작성? -->
				  	<button onclick="location.href='#'">수정</button>	<!-- Modal 사용 -->
				  	<button onclick="location.href='#'">삭제</button> <!-- Modal 사용 -->
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
		<button type="button" class="btn btn-danger btn-lg float-right mt-3" onclick="location.href='/admin/admin'">뒤로가기</button>
	</div>
	
  	<div class="mb-3" style="display: flex; justify-content: center;">
  		<div style="margin-right: 5px;">
  			<h4>Search in Member : </h4>
  		</div>
  		<div>
		    <!-- 검색 및 검색 버튼 -->
		    <form class="form-inline my-2 my-lg-0" method="get" action="product_manage" style="display: contents;" >
		      <input class="form-control mr-sm-2" style="margin-right: 8px; width: 350px;" name="manageKeyword" type="search" placeholder="Input E-mail(RD_Shop@RDS.com)" aria-label="Search" <c:if test="${!empty manageKeyword}">value="${manageKeyword}"</c:if>>
		      <input type="hidden" name="pageNum" value="1" />
		      <input type="hidden" name="amount" value="${amount}" />
		      <input type="hidden" name="manageKeyword" value="${manageKeyword}" />
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    </form>  		
  		</div>
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
					$("#delProperty").text(result.p_property);
				},
			    error:function(request,status,error){
			        alert("실패");
			    }
			})
			// product-delete-btn 에 href로 p_code, pageNum, amount 넘겨주면서 리스트로 이동
			$(".product-delete-btn").attr('onClick',"location.href='product_delete?p_code="+deleteCode+"&pageNum="+${pageNum}+"&amount="+${amount}+"'");
		});
	})
</script>
<%@ include file="../includes/footer.jsp" %> 

