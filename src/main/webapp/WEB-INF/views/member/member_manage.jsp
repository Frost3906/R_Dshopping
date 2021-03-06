<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container mt-5 mb-5">
	<div>
		<h1>User Manage</h1>
	</div>
  	<div class="row mb-3">
  		<div class="col-auto mr-auto">
  		<c:if test="${auth.auth == 'ROLE_ADMIN'}">
  		<button type="button" class="btn btn-success" id="createAdminBtn">Create Admin Account</button>
  		</c:if>
  		<button type="button" class="btn btn-warning" id="createManagerBtn">Create Manager Account</button>
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
		      <th scope="col">Country</th>
		      <th scope="col">Role</th>
		      <th scope="col">Mobile</th>
		    </tr>
		  </thead>
		  	<tbody>
		  	<c:if test="${empty search}">
			  <c:forEach var="list" items="${list}">	
			    <tr>
			      <th scope="col"><a href="" class="manageMember">${list.username}</a></th>
			      <th scope="col">${list.firstName}</th>
			      <th scope="col">${list.lastName}</th>
			      <th scope="col">${list.country}</th>
			      <c:if test="${list.auth == 'ROLE_ADMIN'}">
			      <th scope="col">Admin</th>
			      </c:if>
			      <c:if test="${list.auth == 'ROLE_MANAGER'}">
			      <th scope="col">Manager</th>
			      </c:if>
			      <c:if test="${list.auth == 'ROLE_MEMBER'}">
			      <th scope="col">Member</th>
			      </c:if>
			      <th scope="col">${list.mobile}</th>
			    </tr>
			</c:forEach>
			</c:if>
		  	<c:if test="${!empty search}">
			  <c:forEach var="list" items="${search}">	
			    <tr>
			      <th scope="col"><a href="" class="manageMember">${list.username}</a></th>
			      <th scope="col">${list.firstName}</th>
			      <th scope="col">${list.lastName}</th>
			      <th scope="col">${list.country}</th>
			      <c:if test="${list.auth == 'ROLE_ADMIN'}">
			      <th scope="col">Admin</th>
			      </c:if>
			      <c:if test="${list.auth == 'ROLE_MANAGER'}">
			      <th scope="col">Manager</th>
			      </c:if>
			      <c:if test="${list.auth == 'ROLE_MEMBER'}">
			      <th scope="col">Member</th>
			      </c:if>
			      <th scope="col">${list.mobile}</th>
			    </tr>
			</c:forEach>
			</c:if>
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
		<button type="button" class="btn btn-danger btn-lg float-right mt-3" onclick="location.href='/admin/admin'">Go Back</button>
	</div>
	
  	<div class="mb-3" style="display: flex; justify-content: center;">
  		<div style="margin-right: 5px;">
  			<h4>Search in Member : </h4>
  		</div>
  		<div>
		    <!-- 검색 및 검색 버튼 -->
		    <form class="form-inline my-2 my-lg-0" method="get" action="/member/member_manage" style="display: contents;" >
		      <input class="form-control mr-sm-2" style="margin-right: 8px; width: 350px;" name="keyword" type="search" placeholder="Input E-mail or Admin ID" aria-label="Search" <c:if test="${!empty manageKeyword}">value="${manageKeyword}"</c:if>>
		      <input type="hidden" name="pageNum" value="1" />
		      <input type="hidden" name="amount" value="10" />		      
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    </form>  		
  		</div>
  	</div>
</div>

<!-- 정보를 전달할 히든 폼 -->
<form action="/member/member_manage" id="actionForm">
	<input type="hidden" name="keyword" value="${memberPage.memberCri.keyword}" />
	<input type="hidden" name="pageNum" value="${memberPage.memberCri.pageNum}" />
	<input type="hidden" name="amount" value="${memberPage.amount}" />
	<input type="hidden" id="total" name="total" value="${memberPage.total}" />
</form>

<%-- Manage Member ModifyModal --%>
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
                    <label for="">StreetAddress</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="streetAddress" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">DetailAddress</label>
                </div>
                <div class="col-md-8 ">
                    <input type="text" name="detailAddress" class="form-control form-control-sm">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Zipcode</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="zipcode" class="form-control form-control-sm">
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
	      <div class="modal-footer">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        <button type="button" class="btn btn-success manageModify" >Modify</button>
	        <button type="button" class="btn btn-danger manageDelete" >Delete</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
         </form>
      </div>
    </div>
  </div>
</div>

<%-- Create Admin Account Modal --%>
<div class="modal fade" id="createAdminModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Create Admin Account</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	     <form action="createAdmin" method="post">	     	
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Admin ID</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="username" class="form-control form-control-sm" required="required">
                </div>
            </div>
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Password</label>
                </div>
                <div class="col-md-8">
                    <input type="password" name="password" class="form-control form-control-sm" required="required">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Mobile</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="mobile" class="form-control form-control-sm" required="required">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">First Name</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="firstName" class="form-control form-control-sm" required="required">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Last Name</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="lastName" class="form-control form-control-sm" required="required">
                </div>
            </div>	
          <input type="hidden" name="auth" class="form-control form-control-sm" value="ROLE_ADMIN">
                               
	      <div class="modal-footer">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        <button type="submit" class="btn btn-success" >Create</button>
	        <button type="reset" class="btn btn-danger" >Reset</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
         </form>
      </div>
    </div>
  </div>
</div>
<%-- Create Manager Account Modal --%>
<div class="modal fade" id="createManagerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Create Manager Account</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	     <form action="createManager" method="post">	     	
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Manager ID</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="username" class="form-control form-control-sm" required="required">
                </div>
            </div>
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Password</label>
                </div>
                <div class="col-md-8">
                    <input type="password" name="password" class="form-control form-control-sm" required="required">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Mobile</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="mobile" class="form-control form-control-sm" required="required">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">First Name</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="firstName" class="form-control form-control-sm" required="required">
                </div>
            </div>	                 
	     	<div class="row form-row">
                <div class="col-md-4 mb-2">
                    <label for="">Last Name</label>
                </div>
                <div class="col-md-8">
                    <input type="text" name="lastName" class="form-control form-control-sm" required="required">
                </div>
            </div>	
          <input type="hidden" name="auth" class="form-control form-control-sm" value="ROLE_MANAGER">
                               
	      <div class="modal-footer">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        <button type="submit" class="btn btn-success" >Create</button>
	        <button type="reset" class="btn btn-danger" >Reset</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
         </form>
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
	$(".manageModify").click(function(){
		var manageMemberForm=$("#sendInfo");
		
		manageMemberForm.attr("action", "manageModify");
		manageMemberForm.submit();		
	});
	
	//MemberModal의 delete 버튼 클릭
	$(".manageDelete").click(function(e){
		e.preventDefault();
		var manageMemberForm=$("#sendInfo");
		
		manageMemberForm.attr("action", "manageDelete");
		manageMemberForm.submit();		
	});
	
	//Manage Modal에 회원 정보 띄우기
	$(".manageMember").click(function(e){
		e.preventDefault();
		//$("#manageMemberModal").modal("show");
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
				$("input[name='mobile']").val(result.mobile);
				$("input[name='firstName']").val(result.firstName);
				$("input[name='lastName']").val(result.lastName);
				$("input[name='country']").val(result.country);
				$("input[name='streetAdress']").val(result.streetAdress);
				$("input[name='detailAddress']").val(result.detailAddress);
				$("input[name='zipcode']").val(result.zipcode);
				$("input[name='auth']").val(result.auth);
			},
		    error:function(request,status,error){
		        alert("실패");
		    }
		})
	});
	
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
	$("#createAdminBtn").click(function(){
		$("#createAdminModal").modal("show")
	})
	$("#createManagerBtn").click(function(){
		$("#createManagerModal").modal("show")
	})
});
</script>

<%@ include file="../includes/footer.jsp" %> 

