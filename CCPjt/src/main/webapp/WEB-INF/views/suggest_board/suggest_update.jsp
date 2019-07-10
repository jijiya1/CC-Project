<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<script>
$(document).ready(function() {
	$("#btnUdt").click(function() {
		$("#UpdateForm").submit();
	});
	$("#btnReadList").click(function() {
		location.href="/suggest_board/suggest_read?b_no=${vo.b_no}&a_no=${a_no}";
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
				<input type="hidden" name="a_no" value="${vo.a_no}"/>
				<div class="form-group">
					<label for="b_title">글제목</label>
					<input type="text" class="form-control" id="b_title"
						name="b_title" value="${vo.b_title}"/>
				</div>
				
				<div class="form-group">
					<label for="u_name">작성자</label>
					<input type="text" class="form-control" id="u_name"
						name="u_name" value="${vo.u_name}" readonly="readonly"/>
				</div>

				<div class="form-group">
					<label for="b_content">글내용</label>
					<textarea rows="10" cols="80" id="b_content"
						class="form-control" name="b_content" >${vo.b_content}</textarea>
				</div>

				<div class="row">
					<div class="col-md-12">
					
				<button type="button" class="btn btn-primary" id="btnUdt"
						value="수정완료" style="float: right;" data-toggle="tooltip" data-placement="top" title="작성">
				<span class="fas fa-check"></span></button>
				
				<button type="button" class="btn btn-success" id="btnReadList" 
						value="목록" style="float: right;" data-toggle="tooltip" data-placement="top" title="목록">
					<span class="fas fa-list"></span></button>	
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>