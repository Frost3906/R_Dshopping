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
						<col style="width: 10px;"/>
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
				<tbody id="t_body">
					<c:set var="sum" value="0" />
					<c:forEach var="vo" items="${mycart}">
							<tr>
								<td>섬네일이미지</td>
								<td><a href="/shop/product?p_code=${vo.p_code}">${vo.p_name}</a></td>
								<td><input type="number" class="amount" min="0" value="${vo.cart_Stock}"/></td>
								<td>
									<div class="price">${vo.p_price}</div>
								</td>
								<td>
									<div class="t_price">${vo.p_price*vo.cart_Stock}</div>
								</td>
							</tr>
							<c:set var="sum" value="${sum + (vo.p_price * vo.cart_Stock)}"/>
					</c:forEach>
				</tbody>
			
			</table>
			<span class="border-bottom">
			</span>
			<c:if test="${empty mycart}">
				<div class="text-center">상품이 없습니다.</div>
			</c:if>
			<div>
				<div class="float-right mb-3">
					총 상품금액
					<div class="total_price mb-3 sum_price">
					  ${sum}
					</div>
					<button type="button" class="btn btn-primary btn-lg">Check</button>
				</div>
			</div>
		</div>
    </div>
    <!-- /.row -->
	</form>
  </div>
  <!-- /.container -->
<%@include file="../includes/footer.jsp" %> 

<script>

$(function(){

	//갯수에 맞춰 가격 출력하는 스크립트
	$(".amount").on("propertychange change keyup paste input", function(){
		
		let amount = $(this).val();
		let price = $(this).parent().parent().children().eq(3).text();
		let total_price = amount * price;
		$(this).parent().parent().children().eq(4).html(total_price);
		
	})
	
})
</script>


