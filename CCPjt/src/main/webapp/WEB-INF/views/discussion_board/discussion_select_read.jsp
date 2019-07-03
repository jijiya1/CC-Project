<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	
	// 툴팁
	$('[data-toggle="tooltip"]').tooltip();
	
	// 목록으로
	$("#btnSelectBoardList").click(function() {
		var url = "/selectDiscussion/discussion_select_board";
		
		$("#hiddenData").attr("action", url);
		$("#hiddenData").submit();
	});
	
	// 글 수정
	$("#btnUpdate").click(function() {
		var url = "/selectDiscussion/discussion_select_modify";
		
		$("#hiddenData").attr("action", url);
		$("#hiddenData").submit();
	});
	
	// 글 삭제
	$("#btnDelete").click(function() {
		var deleteChoice = confirm("글을 삭제 하시겠습니까?");
		
		if(deleteChoice == true) {
			var url = "/selectDiscussion/discussion_select_delete";
			
			$("#hiddenData").attr("action", url);
			$("#hiddenData").submit();
		} 
	});
	
	// 추천 버튼
	$("#btnUp").click(function (e) {
		
		e.preventDefault()
		var url = "/selectDiscussion/selectUpcountUpdate";
		var b_no = ${selectDiscussion_BoardVo.b_no};
		var u_email = ${selectDiscussion_BoardVo.b_no};
		var sendData = {
				"b_no" : b_no,
				"u_email" : u_email
		}
		
		$.ajax({
			"type" : "post",
			"url" : url ,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method_Override" : "post"
			},
        	"dataType" : "text",
        	"data" : JSON.stringify(sendData),
        	"success" : function (receviedData) {
        		console.log("성공");
        	}
		})
	})
	
});
</script>
	<div class="container-fluid">
	
		<!-- 히든 데이터 값 시작 -->
		<form id="hiddenData" action="">
			<input type="hidden" name="nowPage" value ="${pagingDto.nowPage }">
			<input type="hidden" name="a_no" value ="${areaDataVo.a_no }">
			<input type="hidden" name="countRow" value ="${pagingDto.countRow }">
			<input type="hidden" name="searchKeyword" value = "${pagingDto.searchKeyword }">
			<input type="hidden" name="b_no" value = "${selectDiscussion_BoardVo.b_no}">
			<input type="hidden" name="b_title" value = "${selectDiscussion_BoardVo.b_title}">
			<input type="hidden" name="b_content" value = "${selectDiscussion_BoardVo.b_content}">
			<input type="hidden" name="u_email" value = "${selectDiscussion_BoardVo.u_email}">
			<input type="hidden" name="b_writer" value = "${selectDiscussion_BoardVo.b_writer}">
		</form>
        
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞<a href="/discussion_board/discussion_main_board?a_no=${areaDataVo.a_no }">토론 게시판</a> ＞
		<a href="/selectDiscussion/discussion_select_board?a_no=${areaDataVo.a_no }">토론 주제 추천게시판</a> ＞  [${selectDiscussion_BoardVo.a_name}/${selectDiscussion_BoardVo.d_name}]${selectDiscussion_BoardVo.b_title} 글</p>
	
	<!-- 페이지 헤더 -->
	<h1 class="h3 mb-2 text-gray-800">[${selectDiscussion_BoardVo.a_name}/${selectDiscussion_BoardVo.d_name}]${selectDiscussion_BoardVo.b_title}</h1><br>
	<!-- 공지사항 읽기 부분 시작 -->
	<div class="card shadow mb-4">
    	<div class="card-body">
    		<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tbody>
						<!-- 작성자 -->
						<tr style="text-align: center;">
							<th scope="row" >작성자</th>
							<td>${selectDiscussion_BoardVo.b_writer}(${selectDiscussion_BoardVo.u_email})</td>
							<th scope="row">작성일</th>
							<td><fmt:formatDate value="${selectDiscussion_BoardVo.b_createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						
						<tr style="text-align: center;">
							<th scope="row">조회수</th>
							<td>${selectDiscussion_BoardVo.b_readCount}</td>
							<!-- 공개여부 -->
							<th scope="row">카테고리</th>
							<td>
								[${selectDiscussion_BoardVo.a_name}/${selectDiscussion_BoardVo.d_name}]지역 토론 주제 추천게시판
							</td>
						</tr>
			
						<!-- 첨부파일 -->
						<tr style="text-align: center;">
							<th scope="row">첨부파일</th>
							<td colspan="3"><p class="mb5"></p></td>
						</tr>
						
						<!-- 내용 -->
						<tr>
							<td colspan="10" class="content">
								<div id="subjectArea">${selectDiscussion_BoardVo.b_content}</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center;">
					<a href='#' class='btn btn-primary btn-sm' id="btnUp" style="text-align: center;"><span class='fas fa-thumbs-up'style="font-size: 40px;">&nbsp;추천&nbsp;${selectDiscussion_BoardVo.b_upCount}</span></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 공지사항 읽기 부분 끝 -->
	
	<!-- 하단 버튼 모음 시작 -->
	<button type="button" class="btn btn-success" id="btnSelectBoardList" data-toggle="tooltip" data-placement="top" title="목록"><span class="fas fa-list"></span></button>
	<button type="button" class="btn btn-warning" id="btnUpdate" data-toggle="tooltip" data-placement="top" title="수정"><span class="fas fa-pencil-alt"></span></button>
	<button type="button" class="btn btn-danger" id="btnDelete" data-toggle="tooltip" data-placement="top" title="삭제"><span class="fas fa-trash"></span></button>
	<!-- 하단 버튼 모음 끝 -->

</div>
<br>

<%@include file="../include/footer.jsp" %>