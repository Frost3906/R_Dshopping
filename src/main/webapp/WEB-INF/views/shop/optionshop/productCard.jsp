<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<c:forEach var="vo" items="${product}">	
		          <div class="col-lg-4 col-md-6 mb-4">
		            <div class="card h-100">
		              <a href="product?p_code=${vo.p_code}"><img class="card-img-top" src="/upload/${vo.image}" width="253px" height="253px"></a>
		              <div class="card-body">
		                <h4 class="card-title">
		                  <a href="product?p_code=${vo.p_code}">${vo.p_code}.</a>
		                </h4>
		                <h4 class="card-title">
		                  <a href="product?p_code=${vo.p_code}">${vo.p_name}</a>
		                </h4>
		                <h5>${vo.p_price}</h5>
		                <p class="card-text">${vo.p_content}</p>
		              </div>
		              <div class="card-footer">
		                <small class="text-muted">
		                	<c:if test="${vo.p_rating==0}">
		                		&#9734; &#9734; &#9734; &#9734; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==1}">
		                		&#9733; &#9734; &#9734; &#9734; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==2}">
		                		&#9733; &#9733; &#9734; &#9734; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==3}">
		                		&#9733; &#9733; &#9733; &#9734; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==4}">
		                		&#9733; &#9733; &#9733; &#9733; &#9734;
		                	</c:if>
		                	<c:if test="${vo.p_rating==5}">
		                		&#9733; &#9733; &#9733; &#9733; &#9733;
		                	</c:if>
		                </small>
		              </div>
		            </div>
		          </div>
	        </c:forEach>