<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<!-- summernote 필수!! - SHJ4359 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/summernote/dist/lang/summernote-ko-KR.js"></script>

<script>
$(document).ready(function() {
	// 목록으로
	$("#btnNoticeBoardList").click(function() {
		location.href = "/notice_board/notice_list";
	});
});
</script>

<!-- 공지사항 작성 시작 -->
	<div class="container-fluid">
	        
		<p class="mb-4"><a href="/">홈</a> > <a href="notice_list">공지사항</a> > 공지사항 작성</p>
		
		<!-- 페이지 헤더 -->
		<h1 class="h3 mb-2 text-gray-800">공지사항 작성</h1><br>
		
		<form role="form" method="post">
		
			<div class="form-group">
				<label for="title">공지사항 제목</label>
				<input type="text" class="form-control" name="title" />
			</div>
			
			<div class="form-group">
				<label for="writer">작성자</label>
				<input type="text" class="form-control" name="writer" />
			</div>
			
			<div class="form-group">
				<label for="writer">공지사항 내용</label>
				<div id="summernote" name="notice_contents"></div>
			    <script>
				      $('#summernote').summernote({
				  		lang: 'ko-KR',
				        height: 350,
				        minHeight: null,
				        maxHeight: null,
				        focus: true  
					});
				</script>
			</div>

			<button type="submit" class="btn btn-primary">글쓰기</button>
			<button type="button" class="btn btn-success" id="btnNoticeBoardList">목록으로</button>
		</form>

	</div>

<%@include file="../include/footer.jsp" %>