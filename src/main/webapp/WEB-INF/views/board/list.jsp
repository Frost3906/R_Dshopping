<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<div class="container">
		<h1 class="page-header ml-2">Board List</h1>
	<div>
	<div>
		<div>
			<div class="float-right mb-3">
				<button id='regBtn' type='button' class='btn btn-xs pull-right btn-success' onclick="location.href='register'">Register New Board</button>
			</div>
			<!-- /.panel-heading -->
			<div>
				<table class="table table-striped table-boardered table-hover">
					<thead>
						<tr>
							<th>번  호</th>
							<th>제  목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<!-- 게시판 리스트 반복문 -->
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.bno}</td>
								<td><a href="<c:out value='${vo.bno}'/>" class="move">${vo.title}</a><strong>[${vo.replycnt }]</strong></td>
								<td>${vo.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row">	<!-- start search -->
					<div class="col-md-12">
						<div class="col-md-8">	<!-- search Form -->
							<form action="" id="searchForm">
								<input type="hidden" name="pageNum" value="${cri.pageNum}" />
								<input type="hidden" name="amount" value="${cri.amount}" />
								<select name="type" id="">
									<option value="" <c:out value="${empty cri.type?'selected':''}" />>------</option>
									<option value="T" <c:out value="${cri.type=='T'?'selected':''}" />>제목</option>
									<option value="C" <c:out value="${cri.type=='T'?'selected':''}" />>내용</option>
									<option value="W" <c:out value="${cri.type=='T'?'selected':''}" />>작성자</option>
									<option value="TC" <c:out value="${cri.type=='T'?'selected':''}" />>제목 or 내용</option>
									<option value="TW" <c:out value="${cri.type=='T'?'selected':''}" />>제목 or 작성자</option>
									<option value="TCW" <c:out value="${cri.type=='T'?'selected':''}" />>제목 or 내용 or 작성자</option>
								</select>
								<input type="text" name="keyword" value="${cri.keyword}" />
								<button class="btn btn-success" type="button">검색</button>
							</form>
						</div>
						<div class="col-md-2 col-md-offset-2">
							<!-- 페이지 목록 갯수 지정하는 폼 -->
							<select class="form-control" name="amount">
								<option value="10" <c:out value="${criteria.amount == 10?'selected':''}"/>>10</option>
								<option value="20" <c:out value="${criteria.amount == 20?'selected':''}"/>>20</option>
								<option value="30" <c:out value="${criteria.amount == 30?'selected':''}"/>>30</option>
								<option value="40" <c:out value="${criteria.amount == 40?'selected':''}"/>>40</option>
							</select>
						</div>
					</div>
				</div>	<!-- end search -->
				<!-- start Pagination -->
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageVO.prev}">
							<li class="paginate_button previous"><a href="${pageVO.startPage-1}">Previous</a></li>
						</c:if>
						<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
							<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a href="${idx}">${idx}</a></li>
						</c:forEach>
						<c:if test="${pageVO.next}">
							<li class="paginate_button next"><a href="${pageVO.endPage+1}">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- end Pagination -->
			</div>
			<!-- end panel-heading  -->
		</div>
		</div>
</div>


	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- end row -->

<!-- 페이지 번호를 누르면 동작하는 폼 -->
<form action="list" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" /> <!-- ==pageVO.cri.type -->
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>            
<!-- 모달 추가 -->
<div class="modal" tabindex="-1" role="dialog" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">$times;</span>
				</button>
			</div>
			<div>
				<p>처리가 완료되었습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 스크립트 -->
<script>
	$(function() {
		let result = '${result}';
		checkModal(result);
		history.replaceState({}, null, null);
		
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		// 사용자가 페이지 번호를 누르면 동작하는 스크립트
		let actionForm = $("#actionForm");
		$(".paginate_button a").click(function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		})
		
		$(".form-control").change(function() {
			actionForm.find("input[name='amount']").val($(this).val());
			actionForm.submit();
		})
		
		
		// 타이틀 클릭시 페이지 나누기 정보가 있는 폼 보내기
		$(".move").click(function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") +"'/>");
			actionForm.attr("action","read");
			actionForm.submit();
		})
		
		// 검색 버튼 클릭시 동작하는 스크리브
		$(".btn-default").click(function() {
			let searchForm = $("#searchForm");
			
			let type = $("select[name='type']").val();
			let keyword = $("input[name='keyword']").val();
			
			if (type == '') {
				alert('검색 기준을 입력해 주세요');
				return false;
			} else if(keyword === '') {
				alert('검색어를 입력해 주세요');
				return false;
			}
			searchForm.find("intput[name='pageNum']").val("1");
			searchForm.submit();
		})
	})
</script>
<%@ include file="../includes/footer.jsp" %>