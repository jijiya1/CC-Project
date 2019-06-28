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
	
	function getReplyList() {
		var url = "/reply/list/${complaint_boardVo}";
		$.getJSON(url, function(receivedData){
			var strHtml = "";
			$(receivedData).each(function() {
				strHtml += "<tr>"
						+ "<td>" + this.r_no + "</td>"
						+ "<td>" + this.r_content + "</td>"
						+ "<td>" + this.r_writer + "</td>"
				strHtml += "</tr>"		
			});
			$("#btnReplyList").html(strHtml);
		});
	}
	//댓글 쓰기
	$("#RepWrite").click(function() {

});
	
	//댓글 목록 리스트 열기	
	$("#btnReplyList").click(function() {
		getReplyList();
	});				
});

</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal" href="#modal-container-817227" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>
	
			<div class="modal fade" id="modal-container-817227" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								댓글 수정
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="hidden" id="modal_index">
							<input type="hidden" id="modal_r_no">
							<div class="form-group">
								<label for="title">댓글 내용</label>
								<input type="text" class="form-control" id="r_content"/>
							</div>
							<div class="form-group">
								<label for="title">작성자</label>
								<input type="text" class="form-control" id="r_writer"/>
							</div>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary"id="RepWrite">
								작성완료
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>					
				</div>				
			</div>		
		</div>
	</div>
</div>
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
<hr>

<div class="row" style="background-color: #bfd2ef">
		<div class="col-md-12">
			<div class="form-group">
				<label for="title">댓글 내용</label>
				<input type="text" class="form-control" id="r_content"/>
			</div>
			<div class="form-group">
				<label for="title">작성자</label>
				<input type="text" class="form-control" id="r_writer"/>
			</div>
			<div class="form-group">
				<input type="button" class="btn btn-success" id="btnReply"
					value="작성완료"/>
			</div>
		</div>
	</div>
<div class="row">
	<div class="col-md-12">
		<p><input type="button" value="댓글목록" id="btnReplyList"
			class="btn btn-primary"></p>
		<table class="table">
			<thead>
				<tr>				
					<th>번호</th>
					<th>댓글내용</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
			</thead>
		</table>
	</div>
</div>	
<%@ include file="../include/footer.jsp"%>