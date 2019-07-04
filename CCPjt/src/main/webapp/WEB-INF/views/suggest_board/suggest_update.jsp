<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/summernote/dist/lang/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {
	$("#btnUdt").click(function() {
		$("#UpdateForm").submit();
	});
	$("#btnReadList").click(function() {
		location.href="/suggest_board/suggest_read?b_no=${vo.b_no}";;
	});
});
</script>
<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="suggest_list">자유게시판</a> ＞ ${vo.b_title}</p>
<h1>글수정</h1>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<form role="form" method="post" action="suggest_update-run" id="UpdateForm">
				<input type="hidden" name="b_no" value="${vo.b_no}"/>
				<div class="form-group">
					<label for="b_title">글제목</label>
					<input type="text" class="form-control" id="b_title"
						name="b_title" value="${vo.b_title}"/>
				</div>
				
				<div class="form-group">
					<label for="b_writer">작성자</label>
					<input type="text" class="form-control" id="b_writer"
						name="b_writer" value="${vo.b_writer}" readonly="readonly"/>
				</div>

					<div class="form-group">
				<label>글 내용</label><br>
				  <textarea id="summernote" name="b_content">${vo.b_content}</textarea>
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

				<div class="row">
					<div class="col-md-12">
					
				<button type="button" class="btn btn-success" id="btnUdt"
						value="수정완료" style="float: right;">
				<span class="fas fa-check"></span></button>
				
				<button type="button" class="btn btn-success" id="btnReadList" 
						value="목록" style="float: right;">
					<span class="fas fa-list"></span></button>	
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>