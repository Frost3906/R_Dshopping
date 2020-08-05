<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<div class="container mt-5 mb-5">
	<div class="row">
	<form action="" method="post" id="purchase" name="purchase">
      <div class="col-lg-12">
        <div class="row mt-5">
        	<!-- 상품 카드 위치 -->
        	<img src="http://placehold.it/400x400" alt=""/>
        	<div class="product-details ml-5 col-lg">
	        	<h1>${vo.p_name}</h1>
	        	<br>
	        	<p>${vo.p_content}</p>
	 			<br>
	 			
	 			<ul class="list-group list-group-flush">
	 				<li class="list-group-item">
		 					<div class="float-left">가격</div>
		 					<div class="float-right">${vo.p_price}</div>
	 			  	</li>
	 				<li class="list-group-item">
	 						<div class="float-left">재고(${vo.p_stock}):</div>
	 						<div class="float-right">
							<c:if test="${vo.p_stock!=0}">
	 							<input  type="number" name="cartStock" id="cartStock" min="1" max="${vo.p_stock}" value="0">
	 						</c:if>
							<c:if test="${vo.p_stock==0}">
								품절
							</c:if>
	 						</div>
	 				</li>
	 				<li class="list-group-item">배송구분	</li>
	 				<li class="list-group-item">포장타입	</li>
	 			</ul>       	
        	</div>
        </div>
        	
        	<div class="check float-right mb-3">
        		<div>
        			총 상품 금액
        			<div id="price"></div> 
        		</div>
        		<button type="button" class="btn btn-success btn-lg mt-3 addCart" data-toggle="modal" data-target="#shoppingorcheck">장바구니 담기</button>
        	</div>
        	
        <!-- /.row -->
      </div>
      </form>
      <!-- /.col-lg-9 -->   				
	</div>
    <div>
      		<h3>연관 상품</h3>
      		<div>
      			<ul class="list-group list-group-horizontal mb-5">
      				<li class="list-group-item">1</li>
      				<li class="list-group-item">2</li>
      				<li class="list-group-item">3</li>
      			</ul>
      		</div>
    </div>	
	<div>
      		<ul class="nav nav-tabs mt-5" id="productTab" role="tablist">
				<li class="nav-item col-sm text-center"><a class="nav-link active" href="#goods-description" data-toggle="tab" aria-controls="goods-description" aria-selected="true">상품설명</a></li>
      			<li class="nav-item col-sm text-center"><a class="nav-link" href="#goods-infomation" data-toggle="tab" aria-controls="goods-infomation" aria-selected="true">상세정보</a></li>
      			<li class="nav-item col-sm text-center"><a class="nav-link" href="#goods-review" data-toggle="tab" aria-controls="goods-review" aria-selected="false">구매후기</a></li>
      			<li class="nav-item col-sm text-center"><a class="nav-link" href="#goods-qna" data-toggle="tab" aria-controls="goods-qna" aria-selected="false">상품문의</a></li>
      		</ul>
      		<div class="tab-content" id="productTabContent">
      			<div id="goods-description" class="tab-pane show active" aria-labelledby="goods-description-tab">
      				상품에 대한 설명
      			</div>
      			<div id="goods-infomation" class="tab-pane" aria-labelledby="goods-infomation-tab">
      				제품 상세
      			</div>
       			<div id="goods-review" class="tab-pane" aria-labelledby="goods-review-tab">
      				상품 리뷰
      			</div>     			
       			<div id="goods-qna" class="tab-pane" aria-labelledby="goods-qna-tab">
      				Q & A
      			</div>     			      			
      		</div>
      		</div>
</div>
<!-- Modal -->
<div class="modal fade" id="shoppingorcheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
        	장바구니에 물건을 담았습니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" >쇼핑 계속하기</button>
        <button type="button" class="btn btn-primary" >장바구니 가기</button>
      </div>
    </div>
  </div>
</div>

<script>
$(function(){
	
	$('#productTab a').click(function (e) {
		  e.preventDefault();
		  $(this).tab('show');
		  $('#productTab a').removeClass('active');
		  $(this).addClass('active');
	})

	$("#cartStock").on("propertychange change keyup paste input", function(){
		let amount = $("#cartStock").val();
		let total_price = amount * ${vo.p_price};
		$('#price').html(total_price);
	})



	$(".addCart").click(function(){
		let p_code = ${vo.p_code};
		let cartStock = $("#cartStock").val();
		
		let data = {
				p_code : p_code,
				cartStock : cartStock
		};
		
		$.ajax({
			url : "/shop/addCart",
			type : "post",
			data : data,
			success : function(){
				
			},
			error : function(){
				
			}
		})
	 	

		
	})
	
})

</script>


<%@ include file="../includes/footer.jsp" %> 