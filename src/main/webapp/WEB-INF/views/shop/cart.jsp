<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
  <!-- Page Content -->
  <div class="container">
        <h1 class="my-4">Carts</h1>
	
	<form action="">
    	<div class="row">

			<div class="cart_goods">

				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col style="width: 375px;"/>
						<col style="width: 432px;"/>
						<col style="width: 115px;"/>
						<col style="width: 110px;"/>
						<col style="width: auto;"/>
					</colgroup>
				<thead>
				<tr>
					<th id="Select">..</th>
					<th id="Info">Info</th>
					<th id="Count">amount</th>
					<th id="Cost">Price</th>
					<th id="unSelect">..</th>
				</tr>			
				</thead>
				<tbody>
					<c:forEach var="vo" items="${mycart}">
							<tr>
								<td>${vo.price}</td>
								<td>${vo.price}</td>
								<td>${vo.price}</td>
								<td>${vo.price}</td>
								<td>${vo.price}</td>
							</tr>
					</c:forEach>
				</tbody>
			
			</table>
			<span class="border-bottom">
			</span>
			<c:if test="${empty list}">
				<div class="text-center">상품이 없습니다.</div>
			</c:if>
			<div>
				<div class="float-right mb-3">
					<button class="btn btn-primary btn-lg">Check</button>
				</div>
			</div>
		</div>
    </div>
    <!-- /.row -->
	</form>
  </div>
  <!-- /.container -->
<%@include file="../includes/footer.jsp" %> 


