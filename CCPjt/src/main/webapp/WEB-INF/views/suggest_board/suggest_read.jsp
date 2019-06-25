<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<script>
$(document).ready(function() {
	
	//수정
	$("#btnUpt").click(function() {
		location.href="/suggest_board/suggest_update?b_no=${vo.b_no}";
	});
	//삭제
	$("#btnDel").click(function() {
		location.href = "/suggest_board/suggest_delete?b_no=${vo.b_no}";
	});
	//목록
	$("#btnList").click(function() {
		location.href="/suggest_board/suggest_list";
	});
});
</script>	
<h1>글조회</h1>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" method="post">
				<div class="form-group">
					<label for="b_title">글제목</label>
					<input type="text" class="form-control" id="b_title"
						name="b_title" value="${vo.b_title}"readonly/>
				</div>
				<div class="form-group">
					<label for="b_writer">작성자</label>
					<input type="text" class="form-control" id="b_writer"
						name="b_writer" value="${vo.b_writer}"readonly/>
				</div>
				<div class="form-group">
					<label for="b_content">글내용</label>
					<textarea rows="10" cols="80" id="b_content"
						class="form-control" name="b_content" readonly>${vo.b_content}</textarea>
				</div>
				<div class="form-group">
					<label for="b_readcount">조회수</label>
					<input type="text" class="form-control" id="b_readcount"
						value="${vo.b_readcount}" readonly/>
				</div>								
				</form>
			</div>	
		</div>
		<div class="row">
		<div class="col-md-12">
			<input type="button" class="btn btn-warning" value="수정"
				id="btnUpt"/>
			<input type="button" class="btn btn-danger" value="삭제"
				id="btnDel"/>			
			<input type="button" class="btn btn-success" value="목록"
				id="btnList"/>
		</div>
	</div>
	</div>	 
<%@ include file="../include/footer.jsp"%>