<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<!-- summernote 필수!! - SHJ4359 -->
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script src="/summernote/dist/lang/summernote-ko-KR.js"></script>

<script>
$(document).ready(function() {
	
	// 목록으로
	$("#btnNoticeBoardList").click(function() {
		location.href = "/notice_board/notice_list";
	});
	
	// 테스트
	$("#test").click(function() {
		var b_title = $("input[name=b_title]").val();
		console.log(b_title);
		var b_write = $("input[name=b_write]").val();
		console.log(b_write);
		var u_id = $("input[name=u_id]").val();
		console.log(u_id);
		var b_addinfo = $("select[name=b_addinfo]").val();
		console.log(b_addinfo);
		var b_detailinfo = $("select[name=b_detailinfo]").val();
		console.log(b_detailinfo);
		var name_b_content = $("textarea[name=b_content]").val();
		console.log(name_b_content);
		var b_content = $("#summernote").val();
		console.log(b_content);
	});
	
});
</script>

<!-- 공지사항 수정 시작 -->
	<div class="container-fluid">
	        
		<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="notice_list">공지사항</a> ＞ <a href="notice_read?b_no=${ noticeBoardVo.b_no }">${ noticeBoardVo.b_title }</a> ＞ 공지사항 수정</p>
		
		<!-- 페이지 헤더 -->
		<h1 class="h3 mb-2 text-gray-800">공지사항 수정</h1><br>
		
		<!-- 공지사항 수정 부분 시작 - form -->
		<form role="form" method="post">
		
			<div class="form-group">
				<label>공지사항 제목</label>
				<input type="text" class="form-control" name="b_title" value="${ noticeBoardVo.b_title }"/>
			</div>
			
			<div class="form-group">
				<label>작성자</label>
				<input type="text" class="form-control" name="b_writer" value="${ noticeBoardVo.b_writer }" />
			</div>
			
			<div class="form-group">
				<label>ID</label>
				<input type="text" class="form-control" name="u_id" value="${ noticeBoardVo.u_id }"/>
			</div>
			
			<div class="form-group">
				<label>시/도</label>
				<select class="form-control" name="b_addinfo" id="b_addinfo">
					<option value="notice">공지사항</option>
					<option value="seoul">서울</option>
					<option value="inchen">인천</option>
				</select>
			</div>
			
			<div class="form-group">
			<label>구</label>
				<select class="form-control" name="b_detailinfo" id="b_detailinfo">
					<option value="notice">공지사항</option>
					<option value="seoul">서울</option>
					<option value="inchen">인천</option>
				</select>
			</div>
			
			<div class="form-group">
				<label>공지사항 내용</label><br>
				  <textarea id="summernote" name="b_content">${ noticeBoardVo.b_content }</textarea>
				  <script>
				        $('#summernote').summernote({
							lang: 'ko-KR',
				            height: 350,
				            minHeight: null,
				            maxHeight: null,
				            focus: true  
				        });
				        var postForm = function() {
				        	var content = $('textarea[name="b_content"]').html($('#summernote').code());
				        }
				  </script>
			</div>

			<button type="submit" class="btn btn-primary">수정</button>
<!-- 			<button type="button" class="btn btn-primary" id="test">테스트</button> -->
			<button type="button" class="btn btn-success" id="btnNoticeBoardList">목록</button>
		</form>
		<!-- 공지사항 수정 부분 끝 - form -->
	</div>
	<!-- 공지사항 수정 끝 -->

<%@include file="../include/footer.jsp" %>