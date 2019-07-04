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
	
	function setPage() {
		var page = "${pagingDto.page}";
		if (page == "") {
			page = 1;
		}
		var perPage = $("select[name=perPage]").val(); // ?

		$("input[name=page]").val(page);
		$("input[name=perPage]").val(10);
	}
	
	function setSearch() {
		var searchType = $("#searchType").val();
		var keyword = $("#keyword").val();
		$("input[name=searchType]").val(searchType);
		$("input[name=keyword]").val(keyword);
	}
	
	$(".a_pagination").click(function(e) {
		e.preventDefault();		
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#pageForm").submit();
	});	
	
	//검색
	$("#btnSearch").click(function() {
		setPage();
		setSearch();
		$("input[name=page]").val(1);
		$("#pageForm").submit();
	});
});
</script>
<form id="pageForm" action="/suggest_board/suggest_list">
	<input type="hidden" name="b_no" 
		value="${param.b_no}">
	<input type="hidden" name="a_no">
	<input type="hidden" name="page"
		value="${paginationDto.pagingDto.page}">
	<input type="hidden" name="perPage"
		value="${paginationDto.pagingDto.perPage}">
	<input type="hidden" name="searchType"
		value="${paginationDto.pagingDto.searchType}">
	<input type="hidden" name="keyword"
		value="${paginationDto.pagingDto.keyword}">				
</form>

<div class="container-fluid">
	<p class="mb-4"><span class="row">&nbsp;</span><a href="/">홈</a> ＞ 자유게시판</p>
		<h1 class="h3 mb-2 text-gray-800">자유게시판</h1>
	<div class="row">
		<div class="col-md-12">			 			
			<div class="row">
		<div class="col-md-12" >
			<select id="searchType">
				<option value="b_title"<c:if test="${paginationDto.pagingDto.searchType == 'b_title'}">selected</c:if>>
				제목</option>
				<option value="b_writer"<c:if test="${paginationDto.pagingDto.searchType == 'b_writer'}">selected</c:if>>
				작성자</option>
				<option value="b_addinfo"<c:if test="${paginationDto.pagingDto.searchType == 'b_detailinfo'}">selected</c:if>>
				구</option>
			</select>
			<input type="text" id="keyword"placeholder="검색어를 입력하세요"
				value="${pagingDto.keyword}"/>
			<input type="button" value="검색" id="btnSearch" class="btn btn-primary"/>
		</div>
	</div>
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
				<thead>
					<tr>
						<th>글번호</th>
						<th>구</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>좋아요</th>
						<th>싫어요</th>					
						<th>조회수</th>
					
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="complaint_boardVo">
					<tr>
						<td>${complaint_boardVo.b_no}</td>
						<td>${complaint_boardVo.b_detailinfo}</td>
						<td><a href="/suggest_board/suggest_read" class="a_title"
								data-b_no="${complaint_boardVo.b_no}">${complaint_boardVo.b_title}</a></td>
						<td>${complaint_boardVo.b_writer} (${complaint_boardVo.u_id})</td>
						<th>${complaint_boardVo.b_upcount}</th>
						<th>${complaint_boardVo.b_downcount}</th>																								
						<td>${complaint_boardVo.b_readcount}</td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
 		<button type="button" class="btn btn-success"id="btnWrite" style="float: right;">글쓰기</button> 

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
					<c:if test="${paginationDto.pagingDto.page == i}">
						active
					</c:if>
					">
						<a class="page-link a_pagination" href="#"
							data-page="${i}">${i}</a>
					</li>
				</c:forEach>
					
					<c:if test="${paginationDto.next == true}">	
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