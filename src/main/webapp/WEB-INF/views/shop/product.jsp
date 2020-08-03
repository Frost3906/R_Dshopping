<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>

<div class="container">
	<div class="row">
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
	 				<li class="list-group-item">가격   	${vo.p_price}</li>

	 				<li class="list-group-item">판매단위	</li>
	 				<li class="list-group-item">중량/용량	</li>
	 				<li class="list-group-item">배송구분	</li>
	 				<li class="list-group-item">포장타입	</li>
	 			</ul>       	
        	</div>
        		
        	
        </div>
        	<div class="check float-right mb-3">
        		<p>총 상품 금액 : ${vo.p_price}원</p>
        		<button class="btn btn-success btn-lg mt-3">장바구니 담기</button>
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
      		<a name="goods-description"></a>
      		<br>
      		<div>
      		<ul class="nav nav-tabs mt-5" role="tablist">
				<li class="nav-item col-sm text-center"><a class="nav-link active" href="#goods-description" data-toggle="tab">상품설명</a></li>
      			<li class="nav-item col-sm text-center"><a class="nav-link" href="#goods-infomation" data-toggle="tab" >상세정보</a></li>
      			<li class="nav-item col-sm text-center"><a class="nav-link" href="#goods-review" data-toggle="tab" >구매후기</a></li>
      			<li class="nav-item col-sm text-center"><a class="nav-link" href="#goods-qna" data-toggle="tab" >상품문의</a></li>
      		</ul>
      		<div class="tab-content">
      			<div id="goods-description" class="container tab-pane active">
      				상품에 대한 설명
      			</div>
      			<div id="goods-infomation" class="container tab-pane">
      				제품 상세
      			</div>
       			<div id="goods-review" class="container tab-pane">
      				상품 리뷰
      			</div>     			
       			<div id="goods-qna" class="container tab-pane">
      				Q & A
      			</div>     			      			
       			
      			<pre>
      			1
      			2
      			3
      			4
      			5
      			6
      			7
      			8
      			9
<!--       			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			</pre>
      			
      		</div>
      		<a name="goods-infomation"></a>
      		<br>
      		<div>
      		<ul class="list-group list-group-horizontal mt-5">
				<li class="list-group-item col-sm text-center"><a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a></li>
      			<li class="list-group-item col-sm text-center"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor  __active">상세정보</a></li>
      			<li class="list-group-item col-sm text-center"><a href="#goods-review" class="goods-view-infomation-tab-anchor">구매후기</a></li>
      			<li class="list-group-item col-sm text-center"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의</a></li>
      		</ul>
      			상품에 대한 상세정보
      				<pre>
      			1
      			2
      			3
      			4
      			5
      			6
      			7
      			8
      			9
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			</pre>
      			
      		</div>
      		<a name="goods-review"></a>
      		<br>
      		<div>
      		<ul class="list-group list-group-horizontal mt-5">
				<li class="list-group-item col-sm text-center"><a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a></li>
      			<li class="list-group-item col-sm text-center"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
      			<li class="list-group-item col-sm text-center"><a href="#goods-review" class="goods-view-infomation-tab-anchor  __active">구매후기</a></li>
      			<li class="list-group-item col-sm text-center"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의</a></li>
      		</ul>
      			상품 구매 후기
      				<pre>
      			1
      			2
      			3
      			4
      			5
      			6
      			7
      			8
      			9
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			</pre>
      			
      		</div>
      		<a name="goods-qna"></a>
      		<br>
      		<div>
      		<ul class="list-group list-group-horizontal mt-5">
      			<li class="list-group-item col-sm text-center"><a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a></li>
      			<li class="list-group-item col-sm text-center"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
      			<li class="list-group-item col-sm text-center"><a href="#goods-review" class="goods-view-infomation-tab-anchor">구매후기</a></li>
      			<li class="list-group-item col-sm text-center"><a href="#goods-qna" class="goods-view-infomation-tab-anchor __active">상품문의</a></li>
      		</ul>
      			상품 문의
      				<pre>
      			1
      			2
      			3
      			4
      			5
      			6
      			7
      			8
      			9
      			
      			
      			 -->
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			
      			</pre>
      			
      		</div>
      	</div>
</div>