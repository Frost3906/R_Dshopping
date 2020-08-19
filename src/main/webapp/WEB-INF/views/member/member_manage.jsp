<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container mt-5 mb-5">
	<div>
		<h1>회원 관리</h1>
	</div>
  	<div class="row mb-3">
  		<div class="col-auto mr-auto">
  		</div>
  		<div class="col-auto">
  		<select class="form-control" id="amount" name="amount">
			<option value="10" <c:out value="${memberPage.amount==10?'selected':''}"/>>10</option>
			<option value="20" <c:out value="${memberPage.amount==20?'selected':''}"/>>20</option>
			<option value="30" <c:out value="${memberPage.amount==30?'selected':''}"/>>30</option>
			<option value="50" <c:out value="${memberPage.amount==50?'selected':''}"/>>50</option>
		</select>
  		</div>
  	</div>
	<div class="row">
      <div class="col-lg-12"><table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">E-mail</th>
		      <th scope="col">FirstName</th>
		      <th scope="col">LastName</th>
		      <th scope="col">Membership Level</th>
		      <th scope="col">Country</th>
		      <th scope="col">Mobile</th>
		    </tr>
		  </thead>
		  	<tbody>
			  <c:forEach var="list" items="${list}">	
			    <tr>
			      <th scope="col"><a href="" class="manageMember">${list.username}</a></th>
			      <th scope="col">${list.firstName}</th>
			      <th scope="col">${list.lastName}</th>
			      <th scope="col">${list.memLevel}</th>
			      <th scope="col">${list.country}</th>
			      <th scope="col">${list.mobile}</th>
			    </tr>
			</c:forEach>
		  </tbody>
		</table>        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
	<div>
		<!-- 페이지 나누기 부분 -->		
  		<div style="display: table; margin-left: auto; margin-right: auto;">
		  <ul class="pagination mb-3">
		    <li class="page-item">
		      <a class="page-link page-select" href="1" tabindex="-1" aria-disabled="true">First</a>
		    </li>
		    <li class="page-item"><a class="page-link page-move" href="#">...</a></li>
		    <li class="page-item <c:if test='${memberPage.prev}'>disabled</c:if>">
		      <a class="page-link page-select" href="${memberPage.previousPage}" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <c:forEach var="idx" begin="${memberPage.startPage}" end="${memberPage.endPage}">
		    	<li class="page-item ${pageNum==idx?'active':''}"><a class="page-link page-select" href="${idx}">${idx}</a></li>
		    </c:forEach>
		    <li class="page-item <c:if test='${memberPage.next}'>disabled</c:if>">
		      <a class="page-link page-select" href="${memberPage.nextPage}">Next</a>
		    </li>
		    <li class="page-item"><a class="page-link page-move" href="#">...</a></li>
		    <li class="page-item">
		      <a class="page-link page-select" href="${memberPage.lastPage}">Last</a>
		    </li>
		  </ul>
		</div>
  		
  		 
	</div>
	<div class="row">
		<button type="button" class="btn btn-danger btn-lg float-right mt-3" onclick="location.href='/admin/admin'">뒤로가기</button>
	</div>
	
  	<div class="mb-3" style="display: flex; justify-content: center;">
  		<div style="margin-right: 5px;">
  			<h4>Search in Member : </h4>
  		</div>
  		<div>
		    <!-- 검색 및 검색 버튼 -->
		    <form class="form-inline my-2 my-lg-0" method="get" action="product_manage" style="display: contents;" >
		      <input class="form-control mr-sm-2" style="margin-right: 8px; width: 350px;" name="manageKeyword" type="search" placeholder="Input E-mail(RD_Shop@RDS.com)" aria-label="Search" <c:if test="${!empty manageKeyword}">value="${manageKeyword}"</c:if>>
		      <input type="hidden" name="pageNum" value="1" />
		      <input type="hidden" name="amount" value="${amount}" />
		      <input type="hidden" name="manageKeyword" value="${manageKeyword}" />
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    </form>  		
  		</div>
  	</div>
</div>

<!-- 정보를 전달할 히든 폼 -->
<form action="member_manage" id="actionForm">
	<input type="hidden" name="keyword" value="${memberPage.memberCri.keyword}" />
	<input type="hidden" name="pageNum" value="${memberPage.nowPage}" />
	<input type="hidden" name="amount" value="${memberPage.amount}" />
</form>
<input type="hidden" id="totalMember" name="totalMember" value="${memberPage.total}" />


<%-- Manage Modify Member Modal --%>
<div class="modal fade"  id="manageMemberModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modify Member Info</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	     <form action="" method="post" id="sendInfo">	     	
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Email Address</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="username" class="form-control form-control-sm" readonly>
                </div>
            </div>
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Password</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="password" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Mobile</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="mobile" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Member Level</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="memLevel" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">First Name</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="firstName" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Last Name</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="lastName" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Country</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="country" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Street</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="street" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Address</label>
                </div>
                <div class="col-md-8 ">
                    <input type="text" name="address" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Postcode</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="postcode" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Auth</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="auth" class="form-control form-control-sm">
                </div>
            </div>	                 
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success sendInfo" >Modify</button>
        <button type="button" class="btn btn-danger manageDelete" >Delete</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 페이지 나누기 모달 추가 -->
<%@ include file="../option/paginationModal.jsp" %> 
<script>
$(function(){
	
	//var manageMemberForm=$("#sendInfo");
	
	//MemberModal의 modify 버튼 클릭
	$(".sendInfo").click(function(){
		var manageMemberForm=$("#sendInfo");
		
		//manageMemberForm.setAttribute("action", "/member/manageModify");
		manageMemberForm.setAttribute("action", manageModify);
		manageMemberForm.submit();		
	})
	
	//MemberModal의 delete 버튼 클릭
	$(".manageDelete").click(function(){
		var manageMemberForm=$("#sendInfo");
		
		//manageMemberForm.setAttribute("action", "/member/manageDelete");
		manageMemberForm.setAttribute("action", manageDelete);
		manageMemberForm.submit();		
	})
	
	
	$(".manageMember").click(function(e){
		e.preventDefault();
		
		let username=$(this).text();
		console.log(username);
		
		$.ajax({
			type:"get",
			url:"/member/manage_member/get",
			data:{username:username},
			success:function(result){
				console.log(result)
				$("#manageMemberModal").modal("show");
				$("input[name='username']").val(result.username);
				$("input[name='password']").val(result.password);
				$("input[name='mobile']").val(result.mobile);
				$("input[name='memLevel']").val(result.memLevel);
				$("input[name='firstName']").val(result.firstName);
				$("input[name='lastName']").val(result.lastName);
				$("input[name='country']").val(result.country);
				$("input[name='street']").val(result.street);
				$("input[name='address']").val(result.address);
				$("input[name='postcode']").val(result.postcode);
				$("input[name='auth']").val(result.auth);
			},
		    error:function(request,status,error){
		        alert("실패");
		    }
		})
	})
	
	//페이지 나누기  관련 Script
	// 정보를 보낼 hidden 폼인 actionForm 가져오기
	let actionForm = $("#actionForm");
	
	// 페이지 나누기 버튼 동작 부분
 	$(".page-select").click(function(e){
		e.preventDefault();
		// 전송해야 할 폼 가져온 후 pageNum 의 값 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// 폼 전송하기
		actionForm.submit();		
	});
	
	// 한페이지에 보여줄 리스트 수 조절 옵션 부분
	$("#amount").change(function(){
		// 전송해야 할 폼 가져온 후 amount 값을 변경한 후
		actionForm.find("input[name='amount']").val($(this).val());
		// amount 변경시 1번 페이지로 이동
		actionForm.find("input[name='pageNum']").val("1");
		// 폼 전송하기
		actionForm.submit();
	});
	
	let productAmt = $("#totalMember")
	
	$(".page-move").click(function(e){
		e.preventDefault();
		$('#myModal').modal("show");
		// 전송해야 할 폼 가져온 후 pageNum 의 값 변경
		$(".page-sel-move").unbind("click").bind("click",function(){
			if($("#pageNumSel").val()>productAmt.val() || $("#pageNumSel").val()<1){
				alert("존재하지 않는 페이지 번호 입니다.");
			} else {
				actionForm.find("input[name='pageNum']").val($("#pageNumSel").val());
				actionForm.submit();
			}
		})
	});
});
</script>

<%@ include file="../includes/footer.jsp" %> 

