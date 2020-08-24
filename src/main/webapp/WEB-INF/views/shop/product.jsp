<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<div class="container mt-5 mb-5">
	<form action="" method="post" id="purchase" name="purchase">
	<div class="row">
      <div class="col-lg-12">
        <div class="row mt-5">
        	<!-- 상품 카드 위치 -->
        	<img src='/upload/${vo.image}' style='max-width: 50%; height: auto;'/>

        	<div class="product-details ml-5 col-lg">
	        	<h1>${vo.p_name}</h1>
	        	<br>
	        	<p>${vo.p_content}</p>
	 			<br>
	 			
	 			<ul class="list-group list-group-flush">
	 				<li class="list-group-item">
		 					<div class="float-left">가격</div>
		 					<div class="float-right">${vo.p_price}</div>
	 			  	</li>
	 				<li class="list-group-item">
	 						<div class="float-left">재고(${vo.p_stock}):</div>
	 						<div class="float-right">
							<c:if test="${vo.p_stock!=0}">
	 							<input  type="number" name="cartStock" id="cartStock" min="1" max="${vo.p_stock}" value="0">
	 						</c:if>
							<c:if test="${vo.p_stock==0}">
								품절
							</c:if>
	 						</div>
	 				</li>
	 				<li class="list-group-item">배송구분	</li>
	 				<li class="list-group-item">포장타입	</li>
	 			</ul>       	
        	</div>
        </div>
        	
        	<div class="check float-right">
        		<div>
        			총 상품 금액
        			<div id="price"></div> 
        		</div>
        		<button type="button" class="btn btn-success btn-lg mt-3 addCart">장바구니 담기</button>
        	</div>
        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->   				
	</div>
    </form>
    <div>
      		<h3>연관 상품</h3>
      		<div>
      			<ul class="list-group list-group-horizontal mb-5">
      				<li class="list-group-item">1</li>
      				<li class="list-group-item">2</li>
      				<li class="list-group-item">3</li>
      			</ul>
      		</div>
    </div>	
	<div>
      		<ul class="nav nav-tabs mt-5" id="productTab" role="tablist">
				<li class="nav-item col-sm text-center"><a class="nav-link active" href="#goods-description" data-toggle="tab" aria-controls="goods-description" aria-selected="true">상품설명</a></li>
      			<li class="nav-item col-sm text-center"><a class="nav-link" href="#goods-infomation" data-toggle="tab" aria-controls="goods-infomation" aria-selected="true">상세정보</a></li>
      			<li class="nav-item col-sm text-center"><a class="nav-link" href="#goods-review" data-toggle="tab" aria-controls="goods-review" aria-selected="false">구매후기</a></li>
      		</ul>
      		<div class="tab-content" id="productTabContent">
      			<div id="goods-description" class="tab-pane show active" aria-labelledby="goods-description-tab">
      				상품에 대한 설명
      			</div>
      			<div id="goods-infomation" class="tab-pane" aria-labelledby="goods-infomation-tab">
      				<img src='/upload/${vo.detailImage}' style='width: -webkit-fill-available; height: auto;'/>
      			</div>
      			<!-- 리뷰 시작 -->
       			<div id="goods-review" class="tab-pane" aria-labelledby="goods-review-tab">
      			<div class="review-board">
				<table class="table table-boardered">
					
					
					<colgroup>
						<col style="width: 70px;"/>
						<col style="width: auto;"/>
						<col style="width: 100px;"/>
						<col style="width: 200px;"/>
						<col style="width: 120px;"/>
					</colgroup>
					<thead class="table">
						<tr>
							<th>번  호</th>
							<th>제  목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>별  점</th>
						</tr>
					</thead>
					<tbody class="reviewList">
					</tbody>
				</table>
				<div class="noReview" style="text-align:center;"></div>
				
					
				<!-- 리뷰 끝 -->
				<!-- 리뷰 페이지 시작 -->
				<div class="review-footer">
				</div>
				<!-- 리뷰 페이지 끝 -->
				<div class="float-right">
					<button class="btn btn-primary writeReview">Write</button>
				</div>
				
				</div>
      			</div>     			
   			      			
      		</div>
    </div>
      		
</div>

<!--리뷰 쓰기 Modal -->
<div class="modal fade" id="review_write_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
        <form>
          <div>
          	<p id="star_grade">
        		<a href="#">★</a>
        		<a href="#">★</a>
        		<a href="#">★</a>
        		<a href="#">★</a>
        		<a href="#">★</a>
			</p>
          </div>        
          <div class="form-group">
            <label for="review_title" class="col-form-label">title</label>
            <input type="text" class="form-control" id="review_title">
          </div>
          <div class="form-group">
            <label for="review_content" class="col-form-label">content</label>
            <textarea class="form-control" id="review_content"></textarea>
          </div>

		  <div class="form-group">
          	<input type="file" id="imageFile" name="imageFile"/>
		  </div>
        </form>
          <div class="uploadResult">
          	<ul></ul>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success write" class="close" data-dismiss="modal">submit</button>
        <button type="button" class="btn btn-default closeBtn" class="close" data-dismiss="modal">cancel</button>
      </div>
    </div>
  </div>
</div>


<!--리뷰 읽기 Modal -->
<div class="modal fade" id="review_read_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="readReviewTitle"></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
          <div>
          	<p class="mb-3" id="readReviewEmail"></p>
          </div>
          <div>
			<p class="float-right" id="readReviewRegDate"></p>
          	<p id="readReviewStarGrade" style="color:gold"></p>
          </div>        
          <div class="form-group">
            <p id="readReviewContent"></p>
          </div>
          <div id="readReviewImage"></div>
      </div>
      <div class="modal-footer read-footer">
        
      </div>
    </div>
  </div>
</div>







<!-- Modal -->
<div class="modal fade" id="shoppingorcheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
        	장바구니에 물건을 담았습니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="location.href='/'">쇼핑 계속하기</button>
        <button type="button" class="btn btn-primary" onclick="location.href='/shop/cart'">장바구니 가기</button>
      </div>
    </div>
  </div>
</div>


<script>



$(function(){
	
	let username = "${auth.username}";
	let p_code = ${vo.p_code};
	let rating = 0;
	
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
	
	//리뷰 리스트 
	function listReview(page){
		console.log(page);
		if(page == -1){
			pageNum = Math.ceil(total / 10.0);
			listReview(pageNum);
			return;
		}
		
		
		
		$.ajax({
		    type:'GET',
		    url : '/shop/review/list',
		    data: {p_code:p_code, page:page},
		    success : function(result){
		        let html = "";
		        
		        if(result.list.length > 0){
		            
		        	
		            for(i=0; i < result.list.length; i++){
		                html += "<tr class='review'><td>"+result.list[i].reviewId+"</td>";
		                html += "<td>"+result.list[i].title+"</td>";
		                html += "<td>"+result.list[i].username+"</td>";
		                html += "<td>"+moment(result.list[i].regdate).format('YYYY-MM-DD HH:mm:ss')+"</td>";
		                
		                if(result.list[i].p_rating==0){
		                	html += "<td><small style='color:gold;'>&#9734;&#9734;&#9734;&#9734;&#9734;</small></td></tr>"
		                }else if(result.list[i].p_rating==1){
		                	html += "<td><small style='color:gold;'>&#9733;&#9734;&#9734;&#9734;&#9734;</small></td></tr>"
		                }else if(result.list[i].p_rating==2){
		                	html += "<td><small style='color:gold;'>&#9733;&#9733;&#9734;&#9734;&#9734;</small></td></tr>"
		                }else if(result.list[i].p_rating==3){
		                	html += "<td><small style='color:gold;'>&#9733;&#9733;&#9733;&#9734;&#9734;</small></td></tr>"
		                }else if(result.list[i].p_rating==4){
		                	html += "<td><small style='color:gold;'>&#9733;&#9733;&#9733;&#9733;&#9734;</small></td></tr>"
		                }else if(result.list[i].p_rating==5){
		                	html += "<td><small style='color:gold;'>&#9733;&#9733;&#9733;&#9733;&#9733;</small></td></tr>"
		                }
		                
		            }
		            
		        }
		        else if(result.list=== null || result.list.length===0){
					$(".noReview").html("후기가 없습니다.");
					return;
				}

		        $(".reviewList").html(html);
		        showReviewPage(result.reviewCnt);
		        
		    },
		    error:function(request,status,error){
		        alert("실패");
		   }
		});

	}
	
	let pageNum = 1;
	
	
	listReview(1);
	
	//댓글 페이지 나누기로 추가
	function showReviewPage(total){
		//댓글 페이지 영역 가져오기
		
		let reviewFooter = $(".review-footer");
		
		//마지막 페이지 계산
		let endPage = Math.ceil(pageNum/10.0)*10;
		//시작 페이지 계산
		let startPage = endPage - 9;
		//이전 버튼
		let prev = startPage != 1;
		//다음버튼
		let next = false;
		
		if(endPage * 10 >= total){
			endPage = Math.ceil(total/10.0);
		}
		if(endPage * 10 < total){
			next=true;		
		}
		//디자인 작성 후 댓글 페이지 영역에 보여주기
		let str = "<ul class='pagination pull-right' style='justify-content:center'>";
		if(prev){
			str+="<li class='page-item'><a class='page-link'";
			str+="href='"+(startPage -1)+"'>Prev</a></li>";
		}
		for(var i = startPage; i<= endPage; i++){
			let active = pageNum == i ? "active":"";
			str += "<li class='page-item "+active+"'>";
			str += "<a class='page-link' href='"+i+"'>"+i;
			str += "</a></li>";
		}
		if(next){
			str += "<li class='page-item'><a class='page-link'";
			str += "href='"+(endPage + 1 ) + "'>Next</a></li>";
		}
		str += "</ul></div>";
		reviewFooter.html(str);
		
		//댓글 페이지 번호를 누르면 실행되는 스크립트
		reviewFooter.on("click","li a",function(e){
			
			//href 방지
			e.preventDefault();
			
			pageNum = $(this).attr("href");
			listReview(pageNum);
		})
	}
	
	
	
	$(document.body).delegate('.review', 'click', function() {
		
		let reviewId = $(this).children().eq(0).text();
		let stargrade = $(this).children().eq(4).text();
		$.ajax({
		    type:'GET',
		    url : '/shop/review/get',
		    data: {reviewId:reviewId},
		    success : function(result){
		    	console.log(result.image);
		    	$("#review_read_modal").modal('show');
				$("#readReviewTitle").html(result.title);
				$("#readReviewEmail").html(result.username);
				$("#readReviewStarGrade").html(stargrade);
				$("#readReviewContent").html(result.content);
				$("#readReviewRegDate").html(moment(result.regdate).format('YYYY-MM-DD HH:mm:ss'));
				result.image = decodeURI(result.image);
				$("#readReviewImage").html("<img src='/upload/"+result.image+"' style='max-width: 100%; height: auto;'/>");
		    	if(result.username===username){
		    		let str = "<button type='button' class='btn btn-warning modBtn'>modify</button>";
		    		str += "<button type='button' class='btn btn-danger delBtn'>delete</button>";
					str += "<button type='button' class='btn btn-primary closeBtn' class='close' data-dismiss='modal'>close</button>";
		    		$('.read-footer').html(str);
		    	}else{
		    		let str = "<button type='button' class='btn btn-primary closeBtn' class='close' data-dismiss='modal'>close</button>";
			    	$('.read-footer').html(str);
		    	}
		    
		    },
		    error:function(request,status,error){
		        alert("실패");
		    }
		});
		
		

		

	});
	
	
	
	
	
	
	//탭 이동 활성화 스크립트
	$('#productTab a').on("click",function (e) {
		  e.preventDefault();
		  $(this).tab('show');
		  $('#productTab a').removeClass('active');
		  $(this).addClass('active');
	})


	//모달 초기화
	$('#review_write_modal').on('hidden.bs.modal', function (e) {
		$('#star_grade a').parent().children("a").removeClass("on");
		$('.uploadResult').html("<ul></ul>");
		$("input[type='file']").val("");
  		$(this).find('form')[0].reset();
	});
	
	
	
	//리뷰 작성 눌렀을때
	$(".writeReview").on("click", function(){
		$("#review_write_modal").modal('show');
		
	});
	
	//별점
	$('#star_grade a').click(function(){
    	$(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        $('.on').each(function(i){
        	rating=i+1;
        })
    });
	
	
	//모달 리뷰 작성 버튼
	$(".write").on("click", function(e){
		let title = $("#review_title").val();
		let content = $("#review_content").val();
		let image = $("#imageFile").val();
		
		let str = "";

		$(".uploadResult ul li").each(function(i,ele){
			let job = $(ele);
			console.log(job);
			image = encodeURI(job.data("path")+"/"+job.data("uuid")+"_"+job.data("filename"));
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+job.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+job.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+job.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+job.data("type")+"'>";			
		
		})
		
		
		let data = {
			username : username,
				p_code : p_code,
				p_rating : rating,
				title : title,
				content : content,
				image : image
				
		}
		
		
		$.ajax({
			url : "/shop/review/write",
			type : "post",
			data : data,
 			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			}, 
			success : function(result){
				
				$("#review_write_modal").modal('hide');
				listReview(1);
				
			},
			error : function(){
				alert("잠시 후 다시 시도 해 주세요")
			}

		})
		
	})
	
	
		$(".read-footer").on("click",".delBtn", function(e){

		let reviewId = $(this);
		console.log(reviewId);
		$.ajax({
			url : "/shop/review/delete",
			type : "post",
			data : {reviewId : reviewId},
 			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			}, 
			success : function(result){
				
				$("#review_read_modal").modal('hide');
				listReview(1);
				
			},
			error : function(){
				alert("잠시 후 다시 시도 해 주세요")
			}

		})
		
	})
	
	

	
	$("input[type='file']").change(function(){
			//form의 형태로 데이터를 구성할 수 있음
			//let formData = new FormData();
			var formData = new FormData();
			
			//첨부파일 목록 가져오기
			let imageFile = $("input[name='imageFile']");
			console.log(imageFile);
			let files= imageFile[0].files;
			console.log(files);
			
			//form의 형태로 붙이기
			for(var i=0;i<files.length;i++){
				if(!checkExtension(files[i].name, files[i].size)){
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

				},
				error:function(xhr,status,error){
					alert(xhr.responseText);
				}
			})
			
		})
		
		//첨부파일 제한 / 크기 제한
		function checkExtension(fileName, fileSize){
			let regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|bmp)$");
			let maxSize = 2097152;
			
			if(fileSize > maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			
			if(!(regex.test(fileName))){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				$("input[name='imageFile']").val("");
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
				var fileCallPath = encodeURIComponent(element.uploadPath+"/s_"+element.uuid+"_"+element.fileName);
				//원본 이미지 경로
				var oriPath = element.uploadPath+"/"+element.uuid+"_"+element.fileName;
				oriPath = oriPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='"+element.uploadPath+"' data-uuid='"+element.uuid+"'";
				str += " data-filename='"+element.fileName+"' data-type='"+element.fileType+"'>";					
				str += "<a href=\"javascript:showImage(\'"+oriPath+"\')\">";
				str += "<img src='/display?fileName="+ fileCallPath+"'><div>"+element.fileName+"</a>";
				str += "<button type='button' class='btn btn-danger btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='image'>";
				str += "<i class = 'fa fa-times'></i></button>";
				str += "</div></li>";
			}else{
				var fileCallPath = encodeURIComponent(element.uploadPath+"/"+element.uuid+"_"+element.fileName);
				str += "<li data-path='"+element.uploadPath +"' data-uuid='"+element.uuid+"'";
				str += " data-filename='"+element.fileName+"' data-type='"+element.fileType+"'>";
				str += "<a href='/download?fileName="+fileCallPath+"'>";
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
				$("input[type='file']").val("");
			},
			error:function(result){
				alert("실패");
			}
		})
		
		//다음 이벤트 발생을 막기
		e.stopPropagation();
	})
	
	
	//갯수에 맞춰 가격 출력하는 스크립트
	$("#cartStock").on("propertychange change keyup paste input", function(){
		let amount = $("#cartStock").val();
		let total_price = amount * ${vo.p_price};
		$('#price').html(total_price);
	})


	//카트에 담는 스크립트
	$(".addCart").click(function(){
		if("${auth.username}"!=""){
			if($("#cartStock").val()!=0){
				
				let cart_Stock = $("#cartStock").val();
				
				let data = {
						username : username,
						p_code : p_code,
						cart_Stock : cart_Stock
				};
				
				$.ajax({
					url : "/shop/addCart",
					type : "post",
					data : data,
	 				beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					}, 
					success : function(result){
						
						$("#shoppingorcheck").modal('show');
						
					},
					error : function(){
						alert("잠시 후 다시 시도 해 주세요");
					}

				})
			}
			else{
				alert("구매 수량을 확인 해 주세요");
			}
		}else{
			alert("로그인 후 이용 해 주세요");
		}
		
	})
	
		
})
	

</script>


<%@ include file="../includes/footer.jsp" %> 