<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	
	// 알람창
	var message = "${message}";
	if (message == "success_write") {
		alert("글을 작성하였습니다.")
	}
	
	// 툴팁
	$('[data-toggle="tooltip"]').tooltip();
	
	// 목록으로
	$("#btnNoticeBoardList").click(function() {
		location.href = "/notice_board/notice_list?a_no=${a_no}&searchType=b_addinfo&keyword=${a_no}";
	});
	
	// 글 수정
	$("#btnUpdate").click(function() {
		location.href = "/notice_board/notice_update?b_no=${noticeBoardVo.b_no}&a_no=${noticeBoardVo.a_no}";
	});
	
	// 글 삭제
	$("#btnDelete").click(function() {
		location.href = "/notice_board/notice_delete?b_no=${noticeBoardVo.b_no}&a_no=${noticeBoardVo.a_no}";

// 		var test = confirm("테스트");
// 		if (test) {
// 			alert("삭제되었습니다.");
// 			console.log(alert);
// 			location.href = "/notice_board/notice_delete?b_no=${noticeBoardVo.b_no}";
// 		} else {
// 			alert("취소되었습니다.");
// 		}
		
	});
	
});
</script>

<!-- 공지사항 읽기 시작 -->
	<div class="container-fluid">
        
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a> ＞ <a href="/notice_board/notice_list?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=10&searchType=b_addinfo&keyword=${ areaDataVo.a_no}">공지사항</a> ＞ ${ noticeBoardVo.b_title }</p>
	
	<!-- 페이지 헤더 -->
	<h1 class="h3 mb-2 text-gray-800">${ noticeBoardVo.b_title }</h1><br>
	
	<!-- 공지사항 읽기 부분 시작 -->
	<div class="card shadow mb-4">
    	<div class="card-body">
    		<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tbody>
						<!-- 작성자 -->
						<tr style="text-align: center;">
							<th scope="row" >작성자</th>
							<td>${ noticeBoardVo.u_name }</td>
							<th scope="row">작성일</th>
							<td><fmt:formatDate value="${ noticeBoardVo.b_modifieddate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						
						<tr style="text-align: center;">
							<th scope="row">조회수</th>
							<td>${ noticeBoardVo.b_readcount }</td>
							<!-- 공개여부 -->
							<th scope="row">카테고리</th>
							<td>
								<c:forEach var="i" begin="1" end="18">
									<c:if test="${ noticeBoardVo.a_order == i }">${ noticeBoardVo.a_name }</c:if>
								</c:forEach>
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
								<div id="subjectArea">${ noticeBoardVo.b_content }</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		<!-- 하단 버튼 모음 시작 -->
		<button type="button" class="btn btn-success" id="btnNoticeBoardList" data-toggle="tooltip" data-placement="top" title="목록"><span class="fas fa-list"></span></button>
		<c:if test="${ userVo.u_email eq noticeBoardVo.u_email }">
			<button type="button" class="btn btn-warning" id="btnUpdate" data-toggle="tooltip" data-placement="top" title="수정"><span class="fas fa-pencil-alt"></span></button>
			<button type="button" class="btn btn-danger" id="btnDelete" data-toggle="tooltip" data-placement="top" title="삭제"><span class="fas fa-trash"></span></button>
		</c:if>
		<!-- 하단 버튼 모음 끝 -->
			
		</div>
	</div>
	<!-- 공지사항 읽기 부분 끝 -->
	
	</div>

<%@include file="../include/footer.jsp" %>