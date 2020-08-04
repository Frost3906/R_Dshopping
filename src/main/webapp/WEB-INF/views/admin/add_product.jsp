<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container">
	<div class="row">
      <div class="col-lg-12">
        <div class="row mt-5">
        	<!-- 상품 카드 위치 -->
        	<img src="http://placehold.it/400x400" alt=""/>
        	<div class="product-details ml-5 col-lg">
        		<form action="">
	        	<h1>상품 이름</h1>
	        	<br>
	        	<p>${vo.p_content}</p>
	 			<br>
	 			
	 			<ul class="list-group list-group-flush">
	 				<li class="list-group-item">
		 					<div class="float-left">가격</div>
		 					<div class="float-right">
								<input type="text" />
							</div>
	 			  	</li>
	 				<li class="list-group-item">
	 						<div class="float-left">재고</div>
	 						<div class="float-right">
								<input type="text" />
	 						</div>
	 				</li>
	 				<li class="list-group-item">배송구분	
	 					<input type="text" />
	 				</li>
	 				<li class="list-group-item">포장타입	
	 					<input type="text" />
	 				</li>
	 			</ul>       	
        	</form>
        	</div>
        	<div class="check float-right mb-3">
        		<p>
        			총 상품 금액
        			<div id="price"></div> 
        		</p>
        		<button class="btn btn-success btn-lg mt-3">장바구니 담기</button>
        	</div>
        		
        	
        </div>
        	
        	
        	
        <!-- /.row -->
      </div>
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
      		<br>
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
</div>

<script>
$('#productTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show');
	  $('#productTab a').removeClass('active');
	  $(this).addClass('active');
})

function quantity(){
	let amount = $("#quantity").val();
	let total_price = amount * ${vo.p_price};
	$('#price').html(total_price);
}
</script>

