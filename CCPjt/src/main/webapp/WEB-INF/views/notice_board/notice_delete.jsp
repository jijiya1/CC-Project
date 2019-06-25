<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	
	// 삭제 버튼
	$("#btnDelete").click(function() {
		var b_no = "${ noticeBoardVo.b_no }";
		$("input[name=b_no]").val(b_no);
		$("#hiddenData").submit();
	});
	
	// 취소 버튼
	$("#btnCancel").click(function() {
		location.href = "/notice_board/notice_read?b_no=${ noticeBoardVo.b_no }";
	});
	
});
</script>

	<!-- 글 삭제 폼 시작 -->
	<div class="container-fluid">
		
		<form id="hiddenData" action="/notice_board/notice_delete_action" method="post">
		<input type="hidden" name="b_no">
		
			<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="notice_list">공지사항</a> ＞ <a href="/notice_board/notice_read?b_no=${ noticeBoardVo.b_no }">${ noticeBoardVo.b_title }</a> ＞ 삭제</p> 
			
			<!-- 페이지 헤더 -->
			<h1 class="h3 mb-2 text-gray-800">${ noticeBoardVo.b_title } 삭제</h1><br>
			
			<p class="mb-4">
				정말로 삭제하시겠습니까?
			</p>
			
			<div>
				<Button type="button" class="btn btn-danger" id="btnDelete"><span class="fas fa-check"></span></Button>
				<Button type="button" class="btn btn-primary" id="btnCancel"><span class="fas fa-check"></span></Button>
			</div>
			<br>
			
		</form>
		
	</div>
	<!-- 글 삭제 폼 끝 -->

<%@include file="../include/footer.jsp" %>