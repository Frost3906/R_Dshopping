<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %> 
<div class="container mt-5 mb-5">
	<div class="row">
      <div class="col-lg-12">
        <div class="row mt-5">
        	<!-- 상품 카드 위치 -->
        	<div class="uploadResult">
	 			<ul></ul>
	 		</div>
        	<div class="product-details ml-5 col-lg">
        		<form action="" method="post" role="form" id="add">
	        	<h1>화면 이미지 등록</h1>
	        	<br>
	 			<ul>
	 			<c:forEach var="vo" items="${vo}">
	 				<li>
		 					<div class="float-left"><c:out value="${vo.category}"></c:out></div>
		 					<div class="float-right">
		 						<label for="p_code" class="error">*</label>
			 					<input type="file" id="${vo.category}" name="${vo.category}"/>
							</div>	 					
	 				</li>
	 			</c:forEach>
	 			</ul>
	 			
	 			
        	<div class="mb-3">
        		<button type="button" class="btn btn-success btn-lg float-right mt-3" id="add_product">이미지 등록</button>
				<button type="button" class="btn btn-danger btn-lg float-right mt-3" onclick="history.back()">뒤로가기</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />    
        	</div>
        	</form>
        	</div>
        		
        </div>
        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
      	
</div>

<script>
$(function(){

	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
		
	$("#add_product").click(function(e){
		//submit 버튼 기능 막기
		e.preventDefault();
		$("#add").validate({
			rule:{
				p_code:{
					required: true
				},
				p_name:{
					required: true
				},
				p_price:{
					required: true
				},
				p_stock:{
					required: true
				}
			}
		});
		//게시글 등록 + 파일첨부 한번에 처리
		//첨부파일 내용 수집
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
		console.log(str);
		
		
		//해당 폼 전송
		$("form[role='form']").append(str).submit();

		

	})
	
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

