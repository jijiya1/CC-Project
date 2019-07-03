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
		
	});
	
	// 글 삭제
	$("#btnDelete").click(function() {
		var deleteChoice = confirm("글을 삭제 하시겠습니까?");
		
		if(deleteChoice == true) {
			var url = "/selectDiscussion/discussion_select_delete";
			
			$("#hiddenData").attr("action", url);
			$("#hiddenData").submit();
		} else {
			
		}
	});
	
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
		</form>
        
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ </p>
	
	<!-- 페이지 헤더 -->
	<h1 class="h3 mb-2 text-gray-800">[${selectDiscussion_BoardVo.a_name}/${selectDiscussion_BoardVo.d_name}]${selectDiscussion_BoardVo.b_title}</h1><br>
	<p>데이터 확인: ${selectDiscussion_BoardVo}</p>
	<p>데이터 확인: ${areaDataVo.a_no}</p>
	<!-- 공지사항 읽기 부분 시작 -->
	<div class="card shadow mb-4">
    	<div class="card-body">
    		<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tbody>
						<!-- 작성자 -->
						<tr style="text-align: center;">
							<th scope="row" >작성자</th>
							<td>${selectDiscussion_BoardVo.b_writer}(${selectDiscussion_BoardVo.u_id})</td>
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