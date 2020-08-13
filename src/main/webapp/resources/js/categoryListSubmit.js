/**
 *  카테고리 리스트 페이지 히든 폼 전송 js
 */


$(function(){
	// 정보를 보낼 hidden 폼인 actionForm 가져오기
	let actionForm = $("#actionForm");
	

	// 중분류 카테고리 클릭시 폼 전송
	$(".downCategory2").click(function(e){
		e.preventDefault();
		// amount 변경시 1번 페이지로 이동
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='categoryKeyword']").val("");
		actionForm.append('<input type="hidden" name="category2" value="'+$(this).attr("href")+'" />')
		// 폼 전송하기
		actionForm.submit();
	})
	// 소분류 카테고리 클릭시 폼 전송
	$(".downCategory3").click(function(e){
		e.preventDefault();
		// amount 변경시 1번 페이지로 이동
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='categoryKeyword']").val("");
		actionForm.append('<input type="hidden" name="category3" value="'+$(this).attr("href")+'" />')
		// 폼 전송하기
		actionForm.submit();
	})
	// 대분류 카테고리 돌아가기
	$(".upCategory1").click(function(e){
		e.preventDefault();
		// amount 변경시 1번 페이지로 이동
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='categoryKeyword']").val("");
		actionForm.find("input[name='category1']").val($(this).attr("href"));
		actionForm.find("input[name='category2']").remove();
		actionForm.find("input[name='category3']").remove();
		// 폼 전송하기
		actionForm.submit();
	})
	// 중분류 카테고리 돌아가기
	$(".upCategory2").click(function(e){
		e.preventDefault();
		// amount 변경시 1번 페이지로 이동
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='categoryKeyword']").val("");
		actionForm.find("input[name='category2']").val($(this).attr("href"));
		actionForm.find("input[name='category3']").remove();
		// 폼 전송하기
		actionForm.submit();
	})
	// 소분류 카테고리 돌아가기
	$(".upCategory3").click(function(e){
		e.preventDefault();
		// amount 변경시 1번 페이지로 이동
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='categoryKeyword']").val("");
		actionForm.find("input[name='category3']").val($(this).attr("href"));
		// 폼 전송하기
		actionForm.submit();
	})
});