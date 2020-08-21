<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container mt-5 mb-5">
<h1>끝내주는 결제 페이지</h1>
	<div class="row">
      <div class="col-lg-12">
        <div class="row mt-5">
        	<img src="http://placehold.it/400x400" style='width: 400px; height: 552px;'/>
        	<div class="product-details ml-5 col-lg">
        		<form action="" method="post" role="form">
	        	<h1>Shipping Info</h1>
	        	<br>
	 			
	 			<ul class="list-group list-group-flush">
	 				<li class="list-group-item">
		 					<div class="float-left">Full name</div>
		 					<div class="float-right">
								<input type="text" id="fullname" name="fullname"/>
							</div>
	 			  	</li>	 			
	 				<li class="list-group-item">
		 					<div class="float-left">Street address</div>
		 					<div class="float-right">
								<input type="text" id="streetaddress" name="streetaddress"/>
								<input type="text" id="detailaddress" name="detailaddress"/>
							</div>
	 			  	</li>
	 				<li class="list-group-item">
		 					<div class="float-left">city</div>
		 					<div class="float-right">
								<input type="text" id="city" name="city"/>
							</div>
	 			  	</li>	 			  		 			
	 				<li class="list-group-item">
		 					<div class="float-left">State / Province / Region</div>
		 					<div class="float-right">
								<input type="text" id="state" name="state"/>
							</div>
	 			  	</li>
	 				<li class="list-group-item">
	 						<div class="float-left">Zip Code</div>
	 						<div class="float-right">
								<input type="text" id="zipcode" name="zipcode"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">	
	 						<div class="float-left">Custom ID Number</div>
	 						<div class="float-right">
								<input type="text" id="customid" name="customid"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">
	 						<div class="float-left">Phone number</div>
	 						<div class="float-right">
								<input type="text" id="phonenum" name="phonenum"/>
	 						</div>
	 				</li>
	 			</ul>       	
        	<div class="mb-3">
        		<button class="btn btn-success btn-lg float-right mt-3" id="submit_info" name="submit_info">Next</button>
        	</div>
        		
        		<input type="hidden" name='_csrf' value='${_csrf.token}'/>
        	</form>
        	</div>
        		
        </div>
        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
      	
</div>

<script>
$(function(){
	$("#submit_info").on("click",function(){
		$("form[role='form']").submit();
	})
})
</script>

<%@ include file="../includes/footer.jsp" %> 

