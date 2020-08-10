/**
 *  페이지 나누기 JS 파일
 */

$(function(){
	// 정보를 보낼 hidden 폼인 actionForm 가져오기
	let actionForm = $("#actionForm");
	
	// 페이지 나누기 버튼 동작 부분
 	$(".page-item a").click(function(e){
		e.preventDefault();
		// 전송해야 할 폼 가져온 후 pageNum 의 값 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// 폼 전송하기
		actionForm.submit();		
	})
	
	// 한페이지에 보여줄 리스트 수 조절 옵션 부분
	$(".form-control").change(function(){
		// 전송해야 할 폼 가져온 후 amount 값을 변경한 후
		actionForm.find("input[name='amount']").val($(this).val());
		// amount 변경시 1번 페이지로 이동
		actionForm.find("input[name='pageNum']").val("1");
		// 폼 전송하기
		actionForm.submit();
	})
});