<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
  <!-- Page Content -->
  <div class="container mt-3">
  	<div>
  		<h1>Search List</h1>
  	</div>
  	<div>
  		<h5>result for "${keyword}"</h5>
  	</div>
    <div class="row">
      <div class="col-lg-12">
        <div class="row list">
        	<!-- 상품 카드 위치 -->
			<c:forEach var="vo" items="${product}">	
		          <div class="col-lg-4 col-md-6 mb-4">
		            <div class="card h-100">
		              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
		              <div class="card-body">
		                <h4 class="card-title">
		                  <a href="#">${vo.p_code}.${vo.p_name}</a>
		                </h4>
		                <h5>${vo.p_price}</h5>
		                <p class="card-text">${vo.p_content}</p>
		              </div>
		              <div class="card-footer">
		                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
		              </div>
		            </div>
		          </div>
	        </c:forEach>
        </div>
        <!-- /.row .list -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  <!-- 
<script>
	$(function(){

		let listSpace = $(".list");
		showList(12);
		
		function showList(num){
			let str = "";
			for(var i = 0 ; i < num ; i++){
				str += '<div class="col-lg-4 col-md-6 mb-4">';
				str += '<div class="card h-100">';
				/* 이미지 클릭시 경로 */
				str += '<a href="#">';
				/* 상품 이미지 */
				str += '<img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>';
				str += '<div class="card-body">';
				str += '<h4 class="card-title">';
				/* 상품 이름 클릭시 경로 */
				str += '<a href="#">';
				/* 상품 이름 */
				str += 'Item '+i+'</a>';
				str += '</h4>';
				/* 상품 가격 */
				str += '<h5>$24.99</h5>';
				str += '<p class="card-text">';
				/* 상품 설명 */
				str += '상품 설명';
				str += '</p>';
				str += '</div>';
				str += '<div class="card-footer">';
				/* 상품 평점 */
				str += '<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>';
				str += '</div>';
				str += '</div>';
				str += '</div>';
			}
			listSpace.html(str);
		}
	})
	
</script> -->
<%@include file="../includes/footer.jsp" %> 