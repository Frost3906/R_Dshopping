<%@include file="../includes/header.jsp"  %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/myPage/js/modify.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<div class="row mp_main">
  <div class="col-3">
	<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	  <a class="nav-link active" id="v-pills-order-tab" data-toggle="pill" href="#v-pills-order" role="tab" aria-controls="v-pills-order" aria-selected="true">Order</a>
	  <a class="nav-link" id="v-pills-shipping-tab" data-toggle="pill" href="#v-pills-shipping" role="tab" aria-controls="v-pills-shipping" aria-selected="false">Shipping</a>
	  <a class="nav-link" id="v-pills-account-tab" data-toggle="pill" href="#v-pills-account" role="tab" aria-controls="v-pills-account" aria-selected="false">Your Account</a>	  
	  <a class="nav-link" id="v-pills-question-tab" data-toggle="pill" href="#v-pills-question" role="tab" aria-controls="v-pills-question" aria-selected="false">Question</a>
	</div>
  </div>	
  <div class="col-9">
	<div class="tab-content" id="v-pills-tabContent">
	  <%-- 구매 내역 --%>
	  <div class="tab-pane fade show active" id="v-pills-order" role="tabpanel" aria-labelledby="v-pills-order-tab">
	  	<div class="row">
	      <div class="col-lg-12"><table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">Image</th>
			      <th scope="col">Product Name</th>
			      <th scope="col">Rating</th>
			      <th scope="col">Quantity</th>
			      <th scope="col">Price</th>
			      <th scope="col">Total Price</th>
			    </tr>
			  </thead>	
				  <tbody>
				    <tr>
				      <th scope="col"><img src="http://placehold.it/100x100" alt="" class="img-thumbnail"></th>				      
				      <th scope="col"></th>				      
				      <th scope="col"></th>				      
				      <th scope="col"></th>				      
				      <th scope="col"></th>				      
				      <th scope="col"></th>				      
				    </tr>
				  </tbody>
			</table>	        	
	        <!-- /.row -->
	      </div>
	      <!-- /.col-lg-9 -->
	    </div>
	  </div>
	  <%-- 배송 조회 --%>
	  <div class="tab-pane fade" id="v-pills-shipping" role="tabpanel" aria-labelledby="v-pills-shipping-tab">
	  	Shipping
	  </div>
	  <%-- 회원정보 수정 --%>	  
	  <div class="tab-pane fade" id="v-pills-account" role="tabpanel" aria-labelledby="v-pills-account-tab">
	  	<form id="modify" action="modify" method="post">
		  	<table>
		  		<tbody>
			  		<tr>
			  			<th scope="row">
			  				E-Mail  				
			  			</th>
			  			<td scope="col"> 
			  				<input type="text" name="username" class="form-control form-control-sm" value="${auth.username}" readonly>
			  			</td>
			  		</tr>
			  		<tr>
			  			<th scope="row">
			  				Current Password  				
			  			</th>
			  			<td scope="row">
			  				<input type="password" name="password" class="form-control form-control-sm">
			  			</td>
		  			</tr>
		  			<tr>
			  			<th scope="row">
			  				New Password   				
			  			</th>
			  			<td scope="row">
			  				<input type="password" name="new_password" class="form-control form-control-sm">
			  			</td>
			  		</tr>
			  		<tr>
			  			<th scope="row">
			  				Confirm Password   				
			  			</th>
			  			<td scope="row">
			  				<input type="password" name="confirm_password" class="form-control form-control-sm">
			  			</td>				  	
			  		</tr>	
			  		<tr>
			  			<th scope="row">
			  				Mobile   				
			  			</th>
			  			<td scope="row">
			  				<input type="text" name="mobile" class="form-control form-control-sm">
			  			</td>				  	
			  		</tr>	
			  		<tr>
			  			<th scope="row">
			  				Street  				
			  			</th>
			  			<td scope="row">
			  				<input type="text" name="street" class="form-control form-control-sm">
			  			</td>				  	
			  		</tr>	
			  		<tr>
			  			<th scope="row">
			  				Address  				
			  			</th>
			  			<td scope="row">
			  				<input type="text" name="address" class="form-control form-control-sm">
			  			</td>				  	
			  		</tr>	
			  		<tr>
			  			<th scope="row">
			  				City  				
			  			</th>
			  			<td scope="row">
			  				<input type="text" name="City" class="form-control form-control-sm">
			  			</td>				  	
			  		</tr>	
			  		<tr>
			  			<th scope="row">
			  				Postcode  				
			  			</th>
			  			<td scope="row">
			  				<input type="text" name="postcode" class="form-control form-control-sm">
			  			</td>				  	
			  		</tr>	
		  		</tbody>
		  	</table>
		  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<button type="submit" class="btn btn-secondary">Confirm</button>
			<button type="reset" class="btn btn-secondary">Cancel</button>
		</form>
	  </div>
	  <%-- QnA 리스트 --%>
	  <div class="tab-pane fade" id="v-pills-question" role="tabpanel" aria-labelledby="v-pills-settings-tab">
	  	<table class="table table-striped">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">No</th>
		      <th scope="col">Title</th>
		      <th scope="col">Answer</th>		      
		      <th scope="col">Writer</th>
		      <th scope="col">Reporting Date</th>
		    </tr>
		  </thead>		 
		  <tbody id=qnaList>		  
		    <%-- Mypage QnA 리스트 출력 --%>
		  </tbody>
		</table>
		
		<%-- 페이지 분할 --%>
		<%-- <%@include file="../option/pagination.jsp"%> --%>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination" style="justify-content: center">
		  <c:if test="${memberPage.prev}">
		    <li class="page-item" >
		      <a class="page-link" style="color:black" href="${memberPage.startPage-1 }" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>	
		    </c:if>	    
		    <c:forEach var="idx" begin="${memberPage.startPage}" end="${memberPage.endPage}">
		    <li class="page-item ${memberPage.memberCri.pageNum==idx?'active':''}"><a class="page-link" style="color:black" href="${idx}">${idx}</a></li>
		    </c:forEach>
		    <c:if test="${memberPage.next}">
		    <li class="page-item">
		      <a class="page-link" style="color:black" href="${memberPage.endPage+1}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    </c:if>
		  </ul>
		</nav>
	  </div>
	</div>
  </div>
</div>
<script>
let username='${auth.username}';
console.log(username);
	
//QnA 리스트
function qnaList(){	
	$.ajax({
	    type:"get",
	    url : "/member/myPage/qnaList",
	    data: {username:username},
	    success : function(result){
	        let str = "";
	        
	        console.log(result);
	        console.log(result.length);
	        console.log(result[0].bno);
	        console.log(result[0].title);
	        console.log(result[0].writer);
	        console.log(moment(result[0].regdate).format('YYYY-MM-DD HH:mm:ss'));
	        
	        if(result.length > 0){
	            for(i=0; i < result.length; i++){
	                str+="<tr id='qna'>";
	                str+="<th>"+result[i].bno+"</th>";
	                str+="<td><a href='#'>"+result[i].title+"</a></td>";	                
	                str+="<td>"+result[i].answer+"</td>";
	                str+="<td>"+result[i].writer+"</td>";
	                str+="<td>"+moment(result[i].regdate).format('YYYY-MM-DD HH:mm:ss')+"</td>";                	
	                str+="</tr>";	                
	            }	            
	        } 	        
	        $("#qnaList").html(str);	        
	    },
	    error:function(request,status,error){
	        alert("fail");
	   }
	});	
}

qnaList();

</script>
<%@include file="../includes/footer.jsp"  %>