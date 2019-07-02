<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	
	// 툴팁
	$('[data-toggle="tooltip"]').tooltip();
	
	// 삭제 버튼
	$("#btnDelete").click(function() {
		var b_no = "${ noticeBoardVo.b_no }";
		$("input[name=b_no]").val(b_no);
		var a_no = "${ noticeBoardVo.a_no }";
		$("input[name=a_no]").val(a_no);
		$("#hiddenData").submit();
	});
	
	// 취소 버튼
	$("#btnCancel").click(function() {
		location.href = "/notice_board/notice_read?b_no=${ noticeBoardVo.b_no }&a_no=${ noticeBoardVo.a_no }";
	});
	
});
</script>

	<!-- 글 삭제 폼 시작 -->
	<div class="container-fluid">
		
		<form id="hiddenData" action="/notice_board/notice_delete_action" method="post">
		<input type="hidden" name="b_no">
		<input type="hidden" name="a_no">
		
			<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a> ＞ <a href="/notice_board/notice_list?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=10&searchType=b_addinfo&keyword=${ areaDataVo.a_no}">공지사항</a> ＞ <a href="/notice_board/notice_read?b_no=${ noticeBoardVo.b_no }&a_no=${ noticeBoardVo.a_no }">${ noticeBoardVo.b_title }</a> ＞ 삭제</p> 
			
			<!-- 페이지 헤더 -->
			<h1 class="h3 mb-2 text-gray-800">${ noticeBoardVo.b_title } 삭제</h1><br>
			
			<p class="mb-4">
				정말로 삭제하시겠습니까?
			</p>
			
			<div>
				<Button type="button" class="btn btn-danger" id="btnDelete" data-toggle="tooltip" data-placement="top" title="삭제"><span class="fas fa-check"></span></Button>
				<Button type="button" class="btn btn-primary" id="btnCancel" data-toggle="tooltip" data-placement="top" title="취소"><span class="fas fa-times"></span></Button>
			</div>
			<br>
			
		</form>
		
	</div>
	<!-- 글 삭제 폼 끝 -->

<%@include file="../include/footer.jsp" %>