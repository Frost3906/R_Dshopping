<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<c:forEach var="vo" items="${product}">	
		          <div class="col-lg-4 col-md-6 mb-4">
		            <div class="card h-100">
		              <a href="product?p_code=${vo.p_code}"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
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
		                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
		              </div>
		            </div>
		          </div>
	        </c:forEach>