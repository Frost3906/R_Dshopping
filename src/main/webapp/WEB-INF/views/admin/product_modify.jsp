<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container mt-5 mb-5">
	<div class="row">
      <div class="col-lg-12">
        <div class="row mt-5">
        	<!-- 상품 카드 위치 -->
        	<div class="uploadResult">
	 			<ul></ul>
	 		</div>
        	<img src="http://placehold.it/400x400" alt=""/>
        	<div class="product-details ml-5 col-lg">
        		<form action="product_modify" method="post" id="product_modify">
	        	<h1>상품 수정</h1>
	        	<br>
	 			
	 			<ul class="list-group list-group-flush">
	 				<li class="list-group-item">
		 					<div class="float-left">상품 코드</div>
		 					<div class="float-right">
								<input type="text" id="p_code" name="p_code" value="${vo.p_code}"/>
							</div>
	 			  	</li>	 			
	 				<li class="list-group-item">
		 					<div class="float-left">상품 이름</div>
		 					<div class="float-right">
								<input type="text" id="p_name" name="p_name" value="${vo.p_name}"/>
							</div>
	 			  	</li>
	 				<li class="list-group-item">
		 					<div class="float-left">상품 설명</div>
		 					<div class="float-right">
								<input type="text" id="p_content" name="p_content" value="${vo.p_content}"/>
							</div>
	 			  	</li>	 			  		 			
	 				<li class="list-group-item">
		 					<div class="float-left">가격</div>
		 					<div class="float-right">
								<input type="text" id="p_price" name="p_price" value="${vo.p_price}"/>
							</div>
	 			  	</li>
	 				<li class="list-group-item">
	 						<div class="float-left">재고</div>
	 						<div class="float-right">
								<input type="number" id="p_stock" name="p_stock" value="${vo.p_stock}"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">	
	 						<div class="float-left">대분류</div>
	 						<div class="float-right">
								<input type="text" id="p_category1" name="p_category1" value="${vo.p_category1}"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">	
	 						<div class="float-left">중분류</div>
	 						<div class="float-right">
								<input type="text" id="p_category2" name="p_category2" value="${vo.p_category2}"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">	
	 						<div class="float-left">소분류</div>
	 						<div class="float-right">
								<input type="text" id="p_category3" name="p_category3" value="${vo.p_category3}"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">
	 						<div class="float-left">속성</div>
	 						<div class="float-right">
								<input type="text" id="property" name="property" value="${vo.property}"/>
	 						</div>
	 				</li>
	 				<li class="list-group-item">
	 						<div class="float-left">상품 이미지</div>
	 						<div class="float-right">
								<input type="file" id="productImage" name="productImage"/>
								<input type="hidden" id="image" name="image"/>

	 						</div>
	 				</li>
	 				<li class="list-group-item">
	 						<div class="float-left">상품 상세 이미지</div>
	 						<div class="float-right">
								<input type="file" id="detailImg" name="detailImg"/>
								<input type="hidden" id="detailImage" name="detailImage"/>

	 						</div>
	 				</li>
	 			</ul>       	
        	<div class="mb-3">
        		<input type="hidden" name="pageNum" value="${pageNum}" />
        		<input type="hidden" name="amount" value="${amount}" />
        		<input type="hidden" name="p_code" value="${vo.p_code}" />
        		<input type="hidden" name="manageKeyword" value="${manageKeyword}" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />    
        		<button type="button" class="btn btn-danger btn-lg float-right mt-3" onclick="location.href='product_manage?pageNum=${pageNum}&amount=${amount}&manageKeyword=${manageKeyword}'">뒤로가기</button>
        		<button type="submit" class="btn btn-success btn-lg float-right mt-3">상품 수정</button>
        	</div>
        	</form>
        	</div>
        		
        </div>
        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
      	
</div>

<div class="modal" tabindex="-1" role="dialog" id="modifyModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="align-items: center">
      <div class="modal-header">
        <h5 class="modal-title">수정하시겠습니까?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
	      	<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">속 성</th>
			      <th scope="col">변경 전</th>
			      <th scope="col">변경 후</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">상품코드</th>
			      <td>${vo.p_code}</td>
			      <td><label id="modCode"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">상품이름</th>
			      <td>${vo.p_name}</td>
			      <td><label id="modName"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">상품설명</th>
			      <td>${vo.p_content}</td>
			      <td><label id="modContent"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">가격</th>
			      <td>${vo.p_price}</td>
			      <td><label id="modPrice"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">재고</th>
			      <td>${vo.p_stock}</td>
			      <td><label id="modStock"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">대분류</th>
			      <td>${vo.p_category1}</td>
			      <td><label id="modCategory1"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">중분류</th>
			      <td>${vo.p_category2}</td>
			      <td><label id="modCategory2"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">소분류</th>
			      <td>${vo.p_category3}</td>
			      <td><label id="modCategory3"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">속성</th>
			      <td>${vo.property}</td>
			      <td><label id="modProperty"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">상품 이미지</th>
			      <td>${vo.image}</td>
			      <td><label id="modImage"></label></td>
			    </tr>
			    <tr>
			      <th scope="row">상품 상세 이미지</th>
			      <td>${vo.detailImage}</td>
			      <td><label id="modDetailImage"></label></td>
			    </tr>
			  </tbody>
			</table>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<script>
$(function(){
	let modifyForm = $("#product_modify");
	$(".btn-success").click(function(e){
		e.preventDefault();
		
		
		let str = "";
		let image = new Array();
		
		$(".uploadResult ul li").each(function(i,ele){
			let job = $(ele);
			console.log(job);
			image[i] = encodeURI(job.data("path")+"/"+job.data("uuid")+"_"+job.data("filename"));
			image[i] = decodeURI(image[i]);
			$("input[name='image']").val(image[0]);
			$("input[name='detailImage']").val(image[1]);
			//console.log($("#image").val());
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+job.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+job.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+job.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+job.data("type")+"'>";			
		})
		
		modifyForm.append(str);
		
		
		
		$("#modCode").text($("#p_code").val());
		$("#modName").text($("#p_name").val());
		$("#modContent").text($("#p_content").val());
		$("#modPrice").text($("#p_price").val());
		$("#modStock").text($("#p_stock").val());
		$("#modCategory1").text($("#p_category1").val());
		$("#modCategory2").text($("#p_category2").val());
		$("#modCategory3").text($("#p_category3").val());
		$("#modProperty").text($("#property").val());
		$("#modImage").text($("#image").val());
		$("#modDetailImage").text($("#detailImage").val());
		$("#modifyModal").modal("show");
		$(".btn-secondary").click(function(){
			modifyForm.submit();
		})
	})
	
	
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";

	
	$("input[type='file']").change(function(){
			//form의 형태로 데이터를 구성할 수 있음
			//let formData = new FormData();
			var formData = new FormData();
			//첨부파일 목록 가져오기
			let image = $(this);
			console.log(image);
			
			let files= image[0].files;
			console.log(files);
			//form의 형태로 붙이기
			for(var i=0;i<files.length;i++){
				if(!checkExtension(files[i].name, files[i].size)){
					$(this).val("");
					return false;
				}
				formData.append("uploadFile",files[i]);
				console.log(files[i]);
			}
			
			
			//processData : 데이터를 query string으로 변환할 것인지 결정
			//				기본값은 application/x-www-form-urlencoded로 true 이므로 false 지정
			
			
			//contentType : 기본값은 application/x-www-form-urlencoded
			//				파일의 경우에 enctype은  multipart/form-data로 보내야 하기 때문에 false로 지정
			
			
			$.ajax({
				url : '/upload',
				type : 'post',
 				beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				}, 
				processData : false,
				contentType : false,
				data : formData,

				success:function(result){
					console.log(result);
					showUploadFile(result);
//					$("input[name='uploadFile']").val("");
				},
				error:function(xhr,status,error){
					alert(xhr.responseText);
				}
			})
			
		})
		
		//첨부파일 제한 / 크기 제한
		function checkExtension(fileName, fileSize){
			let regex = new RegExp("(.*?)\.(JPG|jpg|jpeg|png|gif|bmp)$");
			let maxSize = 2097152;
			
			if(fileSize > maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			
			if(!(regex.test(fileName))){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}
	
	//업로드 된 파일 보여주기
	function showUploadFile(uploadResultArr){
		//결과를 보여줄 영역 가져오기
		let str = "";
		let uploadResult = $(".uploadResult ul");
		console.log(uploadResult);
		$(uploadResultArr).each(function(i,element){
			if(element.fileType){//이미지 파일
				//섬네일 이미지 경로
				var fileCallPath = encodeURIComponent(element.uploadPath+"/"+element.uuid+"_"+element.fileName);
				//원본 이미지 경로
				var oriPath = element.uploadPath+"/"+element.uuid+"_"+element.fileName;
				oriPath = oriPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='"+element.uploadPath+"' data-uuid='"+element.uuid+"'";
				str += " data-filename='"+element.fileName+"' data-type='"+element.fileType+"'>";					
				str += "<a href=\"javascript:showImage(\'"+oriPath+"\')\">";
				str += "<img src='/display?fileName="+ fileCallPath+"' style='max-width: 50%; height: auto;'><div>"+element.fileName+"</a>";
				str += "<button type='button' class='btn btn-danger btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='image'>";
				str += "<i class = 'fa fa-times'></i></button>";
				str += "</div></li>";
			}else{
				var fileCallPath = encodeURIComponent(element.uploadPath+"/"+element.uuid+"_"+element.fileName);
				str += "<li data-path='"+element.uploadPath +"' data-uuid='"+element.uuid+"'";
				str += " data-filename='"+element.fileName+"' data-type='"+element.fileType+"'>";
				str += "<a href='/download?fileName="+fileCallPath+"' style='max-width: 50%; height: auto;'>";
				str += "<img src='/resources/img/attach.png'><div>" + element.fileName+"</a>"
				str += "<button type='button' class='btn btn-danger btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='file'>";
				str += "<i class = 'fa fa-times'></i></button>";
				str += "</div></li>";
			}
			console.log(fileCallPath);
		})
		console.log(str);
		uploadResult.append(str);
	}
	
	//X를 누르면 목록에서 삭제 하기
	$(".uploadResult").on("click","button",function(e){
	
		console.log($(this));
		let targetFile = $(this).data("file");
		let type = $(this).data("type");
		let targetLi = $(this).closest("li");
		
		console.log(targetFile);
		console.log(type);
		console.log(targetLi);
		
		$.ajax({
			url : '/deleteFile',
			type : 'post',
 			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			}, 
			data : {
				fileName : targetFile,
				type : type
			},
			success:function(result){
				targetLi.remove();
				//$("input[type='file']").val("");
			},
			error:function(result){
				alert("실패");
			}
		})
		
		//다음 이벤트 발생을 막기
		e.stopPropagation();
	})
	
	
})
</script>

<%@ include file="../includes/footer.jsp" %> 

