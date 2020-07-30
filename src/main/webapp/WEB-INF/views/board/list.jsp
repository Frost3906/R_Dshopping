<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>

<div class="">
	<div class="">
		<h1 class="page-header">Board List</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div>
	<div>
		<div>
			<div>
				Board List Page
				<button id='regBtn' type='button' class='btn btn-xs pull-right btn-success' onclick="location.href='register'">Register New Board</button>
			</div>
			<!-- /.panel-heading -->
			<div>
				<table class="table table-striped table-boardered table-hover">
					<thead>
						<tr>
							<th>��  ȣ</th>
							<th>��  ��</th>
							<th>�ۼ���</th>
							<th>�ۼ���</th>
							<th>������</th>
						</tr>
					</thead>
					<today>
						<!-- �Խ��� ����Ʈ �ݺ��� -->
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${bo.bno})</td>
								<td><a href='<c:out value="${vo.gno}"/>' class="move">${vo.title}</a><strong>[${vo.replycnt}]</strong></td>
								<td>${vo.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate}"/></td>
							</tr>
						</c:forEach>
					</today>
				</table>
				<div class="row">	<!-- start search -->
					<div class="col-md-12">
						<div class="col-md-8">	<!-- search Form -->
							<form action="" id="searchForm">
								<input type="hidden" name="pageNum" value="${cri.pageNum"} />
								<input type="hidden" name="amount" value="${cri.amount"} />
								<select name="type" id="">
									<option value="" <c:out value="${empty cri.type?'selected':''}" />>------</option>
									<option value="T" <c:out value="${cri.type=='T'?'selected':''}" />>����</option>
									<option value="C" <c:out value="${cri.type=='T'?'selected':''}" />>����</option>
									<option value="W" <c:out value="${cri.type=='T'?'selected':''}" />>�ۼ���</option>
									<option value="TC" <c:out value="${cri.type=='T'?'selected':''}" />>���� or ����</option>
									<option value="TW" <c:out value="${cri.type=='T'?'selected':''}" />>���� or �ۼ���</option>
									<option value="TCW" <c:out value="${cri.type=='T'?'selected':''}" />>���� or ���� or �ۼ���</option>
								</select>
								<input type="text" name="keyword" value="${cri.keyword}" />
								<button class="btn btn-default" type="button">�˻�</button>
							</form>
						</div>
						<div class="col-md-2 col-md-offset-2">
							<!-- ������ ��� ���� �����ϴ� �� -->
							<select class="form-control" name="amount">
								<option value="10" <c:out value="${criteria.amount == 10?'selected':''}"/</c:out>>10</option>
								<option value="20" <c:out value="${criteria.amount == 20?'selected':''}"/</c:out>>20</option>
								<option value="30" <c:out value="${criteria.amount == 30?'selected':''}"/</c:out>>30</option>
								<option value="40" <c:out value="${criteria.amount == 40?'selected':''}"/</c:out>>40</option>
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
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>