<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>


<div class="row mp_main">
  <div class="col-3">
	<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	  <a class="nav-link active" id="v-pills-order-tab" data-toggle="pill" href="#v-pills-order" role="tab" aria-controls="v-pills-order" aria-selected="false">Order</a>
	  <!-- <a class="nav-link" id="v-pills-shipping-tab" data-toggle="pill" href="#v-pills-shipping" role="tab" aria-controls="v-pills-shipping" aria-selected="false">Shipping</a> -->
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
			  <thead class="thead-dark" >			  	
			    <tr>
			    	<th scope="col">OrderID</th>
			    	<th scope="col">Image</th>
				    <th scope="col">Product Name</th>
				    <th scope="col">Quantity</th>
				    <th scope="col">Price</th>
				    <th scope="col">Order Date</th>
			    </tr>
			  </thead>	
				  <tbody id="orderList">
				  	<%-- Mypage Order 리스트 출력 --%>
				  </tbody>
			</table>
			<div>
			<button style="justify-content: center">More</button>			
			</div>	    
	        <!-- /.row -->
	      </div>
	      <!-- /.col-lg-9 -->
	    </div>
	  </div>
	  <%-- 배송 조회 --%>
	  <!-- <div class="tab-pane fade" id="v-pills-shipping" role="tabpanel" aria-labelledby="v-pills-shipping-tab">
	  	Shipping
	  </div> -->
	  
	  <script src="/resources/myPage/js/modify.js"></script>
	  <%-- 회원정보 수정 --%>	  
	  <div class="tab-pane fade" id="v-pills-account" role="tabpanel" aria-labelledby="v-pills-account-tab">
	  	<form style="margin-left: 200px" id="modify" action="modify" method="post">
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">E-Mail</label>
			  			<input style="width: 500px" type="text" name="username" class="form-control form-control-sm" value="${auth.username}" readonly>
			  		</div>
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">New Password</label>
			  			<input style="width: 500px" type="password" name="new_password" class="form-control form-control-sm">
			  		</div>
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">Confirm Password</label>
			  			<input style="width: 500px" type="password" name="confirm_password" class="form-control form-control-sm">
			  		</div>
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">FirstName</label>
			  			<input style="width: 500px" type="text" name="firstName" class="form-control form-control-sm" value="${auth.firstName}">
			  		</div>
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">LastName</label>
			  			<input style="width: 500px" type="text" name="lastName" class="form-control form-control-sm" value="${auth.lastName}">
			  		</div>
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">Mobile</label>
			  			<input style="width: 500px" type="text" name="mobile" class="form-control form-control-sm" value="${auth.mobile}">
			  		</div>
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">Country</label>
			  			<input style="width: 500px" type="text" name="country" class="form-control form-control-sm">
			  		</div>
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">Street Address</label>
			  			<input style="width: 500px" type="text" name="streetAddress" class="form-control form-control-sm">
			  		</div>
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">Detail Address</label>
			  			<input style="width: 500px" type="text" name="detailAddress" class="form-control form-control-sm">
			  		</div>	
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">City</label>
			  			<input style="width: 500px" type="text" name="city" class="form-control form-control-sm">
			  		</div>	
			  		<div class="mb-3 font-weight-bold">
			  			<label for="">State</label>
			  			<input style="width: 500px" type="text" name="state" class="form-control form-control-sm">
			  		</div>			  			
			  		<div class="mb-5 font-weight-bold">
			  			<label for="">Zipcode</label>
			  			<input style="width: 500px" type="text" name="zipcode" class="form-control form-control-sm">
			  		</div>	
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
		      <th scope="col"></th>		      
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
		      <a class="page-link previousPage" style="color:black" href="${memberPage.previousPage}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>	
		    </c:if>	    
		    <c:forEach var="idx" begin="${memberPage.startPage}" end="${memberPage.endPage}">
		    <li class="page-item pageColor ${memberPage.memberCri.pageNum==idx?'active':''}"><a class="page-link idx_num" style="color:black" href="${idx}">${idx}</a></li>
		    </c:forEach>
		    <c:if test="${memberPage.next}">
		    <li class="page-item">
		      <a class="page-link nextPage" style="color:black" href="${memberPage.nextPage}" aria-label="Next">
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

<!-- 정보를 전달할 히든 폼 -->
<form action="myPage" id="actionForm">
	<input type="hidden" name="keyword" value="${memberPage.memberCri.keyword}" />
	<input type="hidden" name="pageNum" value="${memberPage.memberCri.pageNum}" />
	<input type="hidden" name="amount" value="${memberPage.memberCri.amount}" />
	<input type="hidden" name="total" value="${memberPage.total}" />
	<input type="hidden" name="writer" value="${auth.username}" />	
</form>
<script>

let username='${auth.username}';
let pageNum='${memberPage.memberCri.pageNum}';
let amount='${memberPage.amount}';
let total='${memberPage.total}';
console.log(username);
console.log(pageNum);
console.log(amount);
console.log(total);
console.log($("input[name='total']").val());

//페이지 나누기  관련 Script
// 정보를 보낼 hidden 폼인 actionForm 가져오기
let actionForm = $("#actionForm");
	
	
//타이틀 클릭시 페이지 나누기 정보가 있는 폼 보내기
$("#qnaList").on("click", ".moveQnA", function(e){
	e.preventDefault();
	
	actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") +"'/>");
	actionForm.attr("action","/board/read");
	actionForm.submit();
})
$("#orderList").on("click", ".moveOrder", function(e){
	e.preventDefault();
	
	actionForm.append("<input type='hidden' name='p_code' value='"+ $(this).attr("href") +"'/>");
	actionForm.attr("action","/shop/product");
	actionForm.submit();
})



// 페이지 나누기 버튼 동작 부분
//page 번호 누를시
$(".idx_num").click(function(e){
	e.preventDefault();
	let selectPage = $(this).attr("href");	
	
	//$(this).addClass("active");
	$(".pageColor").removeClass('active');
	$(this).parent().addClass("active");
	
	// 전송해야 할 폼 가져온 후 pageNum 의 값 변경
	actionForm.find("input[name='pageNum']").val(selectPage);
	qnaList(selectPage);
});	

// 다음 페이지 버튼을 누르면
$(".nextPage").click(function(e){
	// 실행을 멈추고
	e.preventDefault();
	// 현재 페이지가 어디인지 가져온 다음 (1)
	let nowPage = actionForm.find("input[name='pageNum']").val();	
	let nextPage=parseInt(nowPage)+1;	
	
	$(".pageColor").removeClass('active');
	
	// 그 페이지에 +1을 해주고			
	// ajax를 이용해서 현재페이지+1에 해당하는 정보를 가져온 후
	qnaList(nextPage);
	// 처리를 해주고
	// 늘어난 페이지 값을
	// 다시 hidden form에 넣어주기
	actionForm.find("input[name='pageNum']").val(parseInt(nowPage)+1);
});

// 다음 페이지 버튼을 누르면
$(".previousPage").click(function(e){
	// 실행을 멈추고
	e.preventDefault();
	// 현재 페이지가 어디인지 가져온 다음 (1)
	let nowPage = actionForm.find("input[name='pageNum']").val();	
	let prePage=parseInt(nowPage)-1;
	// 그 페이지에 +1을 해주고			
	// ajax를 이용해서 현재페이지+1에 해당하는 정보를 가져온 후
	qnaList(prePage);
	// 처리를 해주고
	// 늘어난 페이지 값을
	// 다시 hidden form에 넣어주기
	actionForm.find("input[name='pageNum']").val(parseInt(nowPage)-1);
});
//Order 리스트
function orderList(){
	
	$.ajax({
	    type:"get",
	    url : "/member/myPage/orderList",
	    data: {
		    	username:username
	    	},
	    success : function(result){
	        let str = "";
	        
	        if(result.length > 0){
	            for(i=0; i < result.length; i++){
	            	str+="<tr>";
	            	str+="<th scope='col'>"+result[i].orderId+"</th>";				      
	            	str+="<td scope='col'><img src='http://placehold.it/100x100' alt='' class='img-thumbnail'></th>";				      
            		str+="<td scope='col'><a class='moveOrder' href='"+result[i].p_code+"'>"+result[i].p_name+"</a></th>";				      
            		str+="<td scope='col'>"+result[i].cart_Stock+"</th>";				      
            		str+="<td scope='col'>"+(result[i].p_price*result[i].cart_Stock)+"</th>";				      
            		str+="<td scope='col'>"+moment(result[i].orderDate).format('YYYY-MM-DD HH:mm:ss')+"</th>";				      
            		str+="</tr>";                
	            }	            
	        } 	        
	        $("#orderList").html(str);	        
	    },
	    error:function(request,status,error){
	        alert("fail");
	   }
	});	
}
orderList();

//QnA 리스트
function qnaList(value){
	
	$.ajax({
	    type:"get",
	    url : "/member/myPage/qnaList",
	    data: {
		    	username:username,
		    	pageNum:value,
		    	amount:amount
	    	},
	    success : function(result){
	        let str = "";
	        
	        if(result.length > 0){
	            for(i=0; i < result.length; i++){
	                str+="<tr>";
	                str+="<th>"+result[i].bno+"</th>";    	                	
	                str+="<td><a class='moveQnA' href='"+result[i].bno+"'>"+result[i].title+"</a><strong>["+result[i].replycnt+"]</strong></td>";
	                if(result[i].replycnt > 0){
		                str+="<td style='color: red;'>답변완료<td>";	                	
	                }else{
	                	str+="<td>답변대기<td>";
	                }
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

qnaList(pageNum);

</script>
<%@include file="../includes/footer.jsp"  %>