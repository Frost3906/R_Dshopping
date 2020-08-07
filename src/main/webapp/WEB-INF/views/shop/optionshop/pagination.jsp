<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div style="display: table; margin-left: auto; margin-right: auto;">
		  <ul class="pagination mb-3">
		    <li class="page-item">
		      <a class="page-link" href="1" tabindex="-1" aria-disabled="true">First</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">...</a></li>
		    <li class="page-item <c:if test='${pageVO.prev}'>disabled</c:if>">
		      <a class="page-link" href="${pageVO.previousPage}" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
		    	<li class="page-item ${pageNum==idx?'active':''}"><a class="page-link" href="${idx}">${idx}</a></li>
		    </c:forEach>
		    <li class="page-item <c:if test='${pageVO.next}'>disabled</c:if>">
		      <a class="page-link" href="${pageVO.nextPage}">Next</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">...</a></li>
		    <li class="page-item">
		      <a class="page-link" href="${pageVO.lastPage}">Last</a>
		    </li>
		  </ul>
		</div>