<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	
	// 목록으로
	$("#btnNoticeBoardList").click(function() {
		location.href = "/notice_board/notice_list";
	});
	
	// 글 수정
	$("#btnUpdate").click(function() {
		location.href = "/notice_board/notice_update?b_no=${noticeBoardVo.b_no}";
	});
	
	// 글 삭제
	$("#btnDelete").click(function() {
		location.href = "/notice_board/notice_delete?b_no=${noticeBoardVo.b_no}";

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
        
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="notice_list">공지사항</a> ＞ ${ noticeBoardVo.b_title }</p>
	
	<!-- 페이지 헤더 -->
	<h1 class="h3 mb-2 text-gray-800">${ noticeBoardVo.b_title }</h1><br>
	
	${ areaData }
	
	<!-- 공지사항 읽기 부분 시작 -->
	<div class="card shadow mb-4">
    	<div class="card-body">
    		<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tbody>
						<!-- 작성자 -->
						<tr style="text-align: center;">
							<th scope="row" >작성자</th>
							<td>${ noticeBoardVo.b_writer }</td>
							<th scope="row">작성일</th>
							<td><fmt:formatDate value="${ noticeBoardVo.b_modifieddate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						
						<tr style="text-align: center;">
							<th scope="row">조회수</th>
							<td>${ noticeBoardVo.b_readcount }</td>
							<!-- 공개여부 -->
							<th scope="row">카테고리</th>
							<td>
								<c:choose>
									<c:when test="${ noticeBoardVo.b_addinfo == 10 }">${ areaData.a_name }</c:when>
								</c:choose>
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
		</div>
	</div>
	<!-- 공지사항 읽기 부분 끝 -->
	
	<!-- 하단 버튼 모음 시작 -->
	<button type="button" class="btn btn-success" id="btnNoticeBoardList">목록</button>
	<button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
	<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
	<!-- 하단 버튼 모음 끝 -->

</div>
<br>

<%@include file="../include/footer.jsp" %>