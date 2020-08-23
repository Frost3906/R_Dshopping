<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
  <!-- Page Content -->
  <div class="container">
        <h1 class="my-4">Carts</h1>

    	<div class="row">

			<div class="cart_goods">

				<table class="table table-bordered table-hover" id="cartTable">
					<colgroup>
						<col style="width: 50px;"/>
						<col style="width: 200px;"/>
						<col style="width: 432px;"/>
						<col style="width: 10px;"/>
						<col style="width: 110px;"/>
						<col style="width: 200px;"/>
						<col style="width: 50px;"/>
					</colgroup>
				<thead>
				<tr>
					<th id="Select"><input type="checkbox" id="allselect" name="allselect"/></th>
					<th id="Image"></th>
					<th id="Info">Info</th>
					<th id="Count">amount</th>
					<th id="Cost">Price</th>
					<th id="Total_Price">Total Price</th>
					<th id="delete"></th>
				</tr>			
				</thead>
				<tbody id="t_body">
					<c:set var="sum" value="0" />
					<c:forEach var="vo" items="${mycart}">
							<tr>
								<td><input type="checkbox" class="selectbox" id="selectbox" name="selectbox" data-cartNum="${vo.cartNum}"/></td>
								<td><img src='upload/${vo.image}' style='max-width: auto; height: auto;'/></td>
								<td><a href="/shop/product?p_code=${vo.p_code}">${vo.p_name}</a></td>
								<td><input type="number" class="amount" min="0" value="${vo.cart_Stock}" data-cartNum="${vo.cartNum}"/></td>
								<td>
									<div class="price">${vo.p_price}</div>
								</td>
								<td>
									<div class="t_price">${vo.p_price*vo.cart_Stock}</div>
								</td>
								<td><button type="button" class="delete_btn btn-default" data-cartNum="${vo.cartNum}">X</button></td>
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
					<div class="total_price mb-3 sum_price">${sum}</div>
					<button type="button" class="btn btn-danger btn-lg" id="selectDelete" data-cartNum="">Delete</button>
					<button type="button" class="btn btn-primary btn-lg" id="checkCart">Check</button>
				</div>
			</div>
		</div>
    </div>
    <!-- /.row -->
    <form action="check" method="post" role="total">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
  </div>
  <!-- /.container -->
<%@include file="../includes/footer.jsp" %> 


<script>

</script>


<script>






$(function(){
	
	
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
	
	$("#checkCart").on("click",function(){
		
		if("${auth.username}"==""){
			let login = confirm("Please Sign In");
			if(login){
				location.href="/member/signIn";
			}
		}else{
			if("${mycart}"=="[]"){
				let empty = confirm("Cart is Empty");
				if(empty){
					location.href="/";
				}
			}else{
				let JsonArray = new Array();


				$(".amount").each(function(){
					let Json = new Object();
					Json.amount = $(this).val();
					Json.cartNum = $(this).attr("data-cartNum");
					JsonArray.push(Json);
				}); 
				


				console.log(JsonArray);
				
				$.ajax({
		   			url : "/shop/updateCart",
		    		type : "post",
		    		contentType: 'application/json',
		    		dataType: 'json',
		    		data : JSON.stringify(JsonArray),
	 				beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
		    		success : function(result){
		    			if(result==1){
		    				
		    				//location.href="/shop/check";
		    			}
		    			else{
		    				alert("잠시 후 다시 시도해 주십시오.");
		    			}
		    	
		    		}	
				});
				let total = $('.sum_price').text();
				let str = "<input type='hidden' id='total' name='total' value='"+total+"'/>";
				console.log(str);
				$("form[role='total']").append(str).submit();
			
			
			}
		
		}
	})
	
	
	
	//선택 삭제
	$("#selectDelete").on("click",function(){
		
		if($("input[class='selectbox']").is(":checked")){
			let confirm_val = confirm("정말 삭제하시겠습니까?");
			  
		  	if(confirm_val) {
		  		var checkArr = new Array();

		  		$("input[class='selectbox']:checked").each(function(){
		  		checkArr.push($(this).attr("data-cartNum"));
		
				});
		    
				$.ajax({
		   			url : "/shop/removeFromCart",
		    		type : "post",
		    		data : { selectbox : checkArr },
	 				beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
		    		success : function(result){
		    			if(result==1){
				    		location.href = "/shop/cart";
		    			}
		    			else{
		    				alert("잠시 후 다시 시도해 주십시오.");
		    			}
		    	
		    		}	
				});
		  
			} 
		}
		
	 });
	
	//개별 삭제
	$(".delete_btn").on("click",function(){
		let confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val){
			
			var checkArr = new Array();

	  		checkArr.push($(this).attr("data-cartNum"));
	  		
	  		$.ajax({
	   			url : "/shop/removeFromCart",
	    		type : "post",
	    		data : { selectbox : checkArr },
 				beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
	    		success : function(result){
	    			if(result==1){
			    		location.href = "/shop/cart";
	    			}
	    			else{
	    				alert("잠시 후 다시 시도해 주십시오.");
	    			}
	    	
	    		}	
			});
		}
		
	})
	
	
	
	
	
	
	//전체 선택 스크립트
	$("#allselect").on("click",function(){
		
		 let checked = $("#allselect").prop("checked");
		 console.log(checked);
		 if(checked) {
		  $(".selectbox").prop("checked", true);
		 } else {
		  $(".selectbox").prop("checked", false);
		 }
	});

	$(".selectbox").on("click",function(){
		  $("#allselect").prop("checked", false);
	});
	
	 
	
	//갯수에 맞춰 가격 출력하는 스크립트
	$(".amount").on("change", function(){
		let sum_price = 0;
		let amount = $(this).val();
		
		// if amount 값이 0이 되면 카트에서 삭제여부 묻기
		if(amount==0){
			let confirm_val = confirm("정말 삭제하시겠습니까?");
			
			if(confirm_val){
				
				var checkArr = new Array();


		  		checkArr.push($(this).attr("data-cartNum"));
		  		
		  		$.ajax({
		   			url : "/shop/removeFromCart",
		    		type : "post",
		    		data : { selectbox : checkArr },
	 				beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
		    		success : function(result){
		    			if(result==1){
				    		location.href = "/shop/cart";
		    			}
		    			else{
		    				alert("잠시 후 다시 시도해 주십시오.");
		    			}
		    	
		    		}	
				});
			}
			
		}
		
		
		let price = $(this).parent().parent().children().eq(4).text();
		let total_price = amount * price;
		$(this).parent().parent().children().eq(5).html(total_price);
		$(".sum_price").html(total_price);

 		
		//.sum_price의 가격 변경
		for (let i = 0; i < $('#cartTable > tbody > tr').length; i++) {
			sum_price += Number($('#cartTable > tbody > tr').eq(i).children().eq(5).text());
		}
		$(".sum_price").html(sum_price);
	})
	
	
	
	
})
</script>


