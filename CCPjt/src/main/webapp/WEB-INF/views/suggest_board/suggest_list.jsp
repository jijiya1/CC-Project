<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<script>
$(document).ready(function() {
	
	$(".a_title").click(function(e) {
		e.preventDefault();
// 		var a_no = "${a_no}";
		var b_no = $(this).attr("data-b_no");
		$("input[name=b_no]").val(b_no);	
// 		$("input[name=a_no]").val(a_no);
		var href = $(this).attr("href");
		$("#pageForm").attr("action", href).submit();
	});
	
	$("#btnWrite").click(function() {
		location.href="/suggest_board/suggest_write?a_no=${a_no}";
	});
	
	function setPage() {
		var page = "${pagingDto.page}";
		var a_no = "${areaDataVo.a_no}"
		if (page == "") {
			page = 1;
		}
		var perPage = $("select[name=perPage]").val(); // ?

		$("input[name=page]").val(page);
		$("input[name=a_no]").val(a_no);
		$("input[name=perPage]").val(10);
	}
	
	function setSearch() {
		$("#keyword").keyup(function(e) {
// 			console.log("테스트 : " + e);
			if (e.keyCode == 13) {
// 				console.log("작동");
				setPage();
				var searchType = $("#searchType").val();
				var keyword = $("#keyword").val();
				var a_no = $("#a_no").val();
				$("input[name=searchType]").val(searchType);
				$("input[name=keyword]").val(keyword);
				$("input[name=a_no]").val(a_no);
				
				$("input[name=page]").val(1);
				$("#pageForm").submit();
			}
		});
	}
	
	$(".a_pagination").click(function(e) {
		e.preventDefault();		
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#pageForm").submit();
	});	
	
	//검색
	setSearch();
// 	$("#keyword").keyup(function(e) {
// 		if (e.keyCode == 13) {
// 			setPage();
// 			setSearch();
// 			$("input[name=page]").val(1);
// 			$("#pageForm").submit();
// 		}
// 	});
	
});
</script>
<form id="pageForm" action="/suggest_board/suggest_list">
	<input type="hidden" name="b_no" 
		value="${param.b_no}">
	<input type="hidden" name="a_no"
		value="${param.a_no}">
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
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a> ＞ 자유게시판</p>
		<h1 class="h3 mb-2 text-gray-800">자유게시판</h1>
		
		 <div class="card shadow mb-4">
	    
	    <div class="card-body">
	      <div class="table-responsive">
	      
   	      	<div class="dataTables_filter" style="float:right;">
		      	<select class="form-control-sm" id="searchType">
					<option value="b_title"<c:if test="${paginationDto.pagingDto.searchType == 'b_title'}">selected</c:if>>
					제목</option>
					<option value="u_name"<c:if test="${paginationDto.pagingDto.searchType == 'u_name'}">selected</c:if>>
					작성자</option>
					<option value="b_addinfo"<c:if test="${paginationDto.pagingDto.searchType == 'b_detailinfo'}">selected</c:if>>
					구</option>
		      		</select>
		      	<!-- 검색바 시작 -->
	      			<input type="search" placeholder="검색" aria-controls="dataTable" id="keyword" style="margin-bottom: 20px;">
	      	</div>
	      	<!-- 검색바 끝 -->

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
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="complaint_boardVo">
					<tr>
						<td>${complaint_boardVo.b_no}</td>
						<td>${complaint_boardVo.b_detailinfo}</td>
						<td><a href="/suggest_board/suggest_read?a_no=${a_no}" class="a_title"
								data-b_no="${complaint_boardVo.b_no}"
								data-a_no="${complaint_boardVo.a_no}">${complaint_boardVo.b_title}</a></td>
						<td>${complaint_boardVo.u_name} (${complaint_boardVo.u_email})</td>
						<th>${complaint_boardVo.b_upcount}</th>
						<th>${complaint_boardVo.b_downcount}</th>																								
						<td>${complaint_boardVo.b_readcount}</td>
						<td><fmt:formatDate value="${complaint_boardVo.b_createddate}"
								pattern="yyyy/MM/dd HH:mm:ss"/></td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
			
		<c:if test="${ userVo ne null }">
			<button type="button" class="btn btn-success" style="float: left;" id="btnWrite" data-toggle="tooltip" data-placement="top" title="작성"><span class="fas fa-pencil-alt"></span></button>
		</c:if>	
		<div class="dataTables_paginate paging_simple_numbers item" id="dataTable_paginate" style="float: right;">
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
			</div> 
			
			</div>
			

			</div>
				</div>		
<%@ include file="../include/footer.jsp" %>