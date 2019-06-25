<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/head.jsp" %>
<script>
$(document).ready(function() {
	
	$(".a_title").click(function(e) {
		e.preventDefault();
		var b_no = $(this).attr("data-b_no");
		$("input[name=b_no]").val(b_no);		
		var href = $(this).attr("href");
		$("#pageForm").attr("action", href).submit();
	});

	$("#btnWrite").click(function() {
		location.href="suggest_write";
	});
	
});
</script>
<form id="pageForm" action="/suggest_board/suggest_list">
	<input type="hidden" name="b_no" 
		value="${param.b_no}">
</form>


<h1>게시판</h1>
		<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">			 
			<button type="button" class="btn btn-success"id="btnWrite">글쓰기</button>
			<table class="table">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>지역</th>
						<th>구</th>					
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="complaint_boardVo">
					<tr>
						<td>${complaint_boardVo.b_no}</td>
						<td><a href="/suggest_board/suggest_read" class="a_title"
								data-b_no="${complaint_boardVo.b_no}">${complaint_boardVo.b_title}</a></td>
						<td>${complaint_boardVo.b_writer}</td>
						<td>${complaint_boardVo.b_addinfo}</td>
						<td>${complaint_boardVo.b_detailinfo}</td>												
						<td>${complaint_boardVo.b_readcount}</td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
			<nav>
				<ul class="pagination">
				<c:if test="${paginationDto.prev == true}">
					<li class="page-item">
						<a class="page-link a_pagination" href="#"
							data-page="${paginationDto.startPage - 1}">이전</a>
					</li>
				</c:if>	
				
				<c:forEach var="i" begin="${paginationDto.startPage}"
								   	end="${paginationDto.endPage}">
					<li class="page-item
						<c:if test="${paginationDto.pagingDto.page == i}">active</c:if>">
							<a class="page-link a_pagination" href="#"
								data-page="${i}">${i}</a>
					</li>
				</c:forEach>
					
				<c:if test="${paginationDto.next == true}" >	
					<li class="page-item">
						<a class="page-link a_pagination" href="#"
							data-page="${paginationDto.endPage + 1}">다음</a>
					</li>
				</c:if>	
				</ul>
			</nav>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>