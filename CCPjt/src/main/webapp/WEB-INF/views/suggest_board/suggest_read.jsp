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
		var url = "/reply/list/${vo.b_no}";
		$.getJSON(url, function(receivedData) {
			console.log(receivedData);
			var strHtml = "";
			$(receivedData).each(function(i) {
				
			  strHtml +=    "<tr>"
					  +  	"<td>" + this.r_no + "</td>" 
					  +  	"<td>" + this.r_content + "</td>" 
					  +  	"<td>" + this.r_writer + "</td>"					  
					  +		"<td>" + this.b_upcount + "</td>"
					  +		"<td>" + this.b_downcount + "</td>"
					  +		"<td>" + this.r_createddate + "</td>"
					  +     "<td>" + this.r_modifieddate + "</td>"
			  strHtml +=  "<td>" 
					  + 	"<input type='button' value='수정' class='btn-xs btn-warning'"
					  +     " data-reply_text='" + this.r_content + "'"
					  +     " data-replyer='" + this.r_writer + "'"
					  +		" data-rno='" + this.r_no + "'"
					  +		" data-index='" + i + "'>" 
					  + 	"</td>"
					  +  	"<td>"
					  + 	"<input type='button' value='삭제' class='btn-xs btn-danger'"
					  +     " data-rno='" + this.r_no + "'"
					  +		" data-bno='" + this.b_no + "'"
					  +		" data-index='" + i + "'>"
					  +	    "</td>";
			 strHtml  +=    "</tr>";
			});
			$("#replyList").html(strHtml);
		}); 
	}
	
	// 댓글 목록 버튼
	$("#btnReplyList").click(function() {
		getReplyList();
	});
	
	// 댓글 쓰기 버튼
	$("#btnReply").click(function() {
		var b_no = "${vo.b_no}";
		var r_content = $("#r_content").val();
		var r_writer = $("#r_writer").val();
		var data = {
				"b_no" : b_no,
				"r_content" : r_content,
				"r_writer" : r_writer
		};
		var url = "/reply/insert";

		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(receivedData) {
				getReplyList();
			}
		});
	});
	//댓글 수정
	$("#replyList").on("click", ".btn-warning", function() {
		$("#modal").trigger("click");
		var r_content = $(this).attr("data-r_content");
		var r_writer = $(this).attr("data-r_writer");
		var r_no = $(this).attr("data-r_no");
		var index = $(this).attr("data-index");
		$("#modal_r_content").val(r_content);
		$("#modal_r_writer").val(r_writer);
		$("#modal_r_no").val(r_no);
		$("#modal_index").val(index);
	});
	
	// 모달창 작성완료 버튼
	$("#btnModalReply").click(function() {
		var r_content = $("#modal_r_content").val();
		var r_writer = $("#modal_r_writer").val();
		var r_no = $("#modal_r_no").val();
		var data = {
				"r_content" : r_content,
				"r_writer" : r_writer,
				"r_no" : r_no
		};
		var url = "/reply/update/" + r_no;
		$.ajax({
			"type" : "put",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "put"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(receivedData) {
				$("#btnModalReply").next().trigger("click");
				var index = $("#modal_index").val();
				var target_tr = $("#replyList > tr").eq(index);
				target_tr.find("td").eq(1).text(r_content);
				target_tr.find("td").eq(2).text(r_writer); 
			}
		});
	});
	

	//댓글 삭제
	("#replyList").on("click",".btn-danger", function() {
		var r_no = $(this).attr("data-r_no");
		var r_content = $(this).attr("data-r_content");
		var index = $(this).attr("data-index");
		
		var url = "/reply/delete/" + r_no + "/" + b_no;
		$.ajax({
			"type" : 'delete',
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overried" : "delete"
			},
			"success" : function(receivedData) {
				console.log(receivedData);
				if (receivedData == "success") {
					$("#replyList > tr").eq(index).fadeOut("1000");
				}
			}
		});
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<a style="display:none;"
			  id="modal" href="#modal-container-817227" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
	
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
								<input type="text" class="form-control" id="modal_r_content"/>
							</div>
							<div class="form-group">
								<label for="title">작성자</label>
								<input type="text" class="form-control" id="modal_r_writer"/>
							</div>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary"id="btnModalWrite">
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
<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="suggest_list">자유게시판</a> ＞ ${vo.b_title}</p>
<h1>글조회</h1>
<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
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
				<div class="form-group">
					<label for="b_readcount">첨부파일</label>
					<input type="text" class="form-control" id="b_readcount"readonly/>					
				</div>								
				</form>
			</div>	
		</div>
		<div class="row">
		<div class="col-md-12">
				
				<!-- 수정 -->
				<button type="button" class="btn btn-warning" value="수정"
					id="btnUpt"><span class="fas fa-pencil-alt"></span></button>
				<!-- 삭제 -->
				<button type="button" class="btn btn-danger" value="삭제"
					id="btnDel"><span class="fas fa-trash"></span></button>
				<!-- 목록 -->
				<button type="button" class="btn btn-success" value="목록"
					id="btnList"><span class="fas fa-list"></span></button>									
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
			
				<input type="button" class="btn btn-warning" id="btnReply"
					value="작성완료" style="float: right;"<span class="fas fa-pencil-alt"></span>/>
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
					<th>좋아요</th>
					<th>싫어요</th>
					<th>작성날짜</th>
					<th>수정날짜</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="replyList">
			
			</tbody>
		</table>
	</div>
</div>	
<%@ include file="../include/footer.jsp"%>