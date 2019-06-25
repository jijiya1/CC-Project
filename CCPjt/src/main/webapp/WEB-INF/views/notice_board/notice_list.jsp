<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/head.jsp" %>

<style>

	div {
		position:relative;
	}
	
	#dataTable_paginate {
		width:300px; left:0; right:0; margin-left:auto; margin-right:auto;
	}

</style>

<script>
$(document).ready(function() {
	
	// 알람창
	var message = "${message}";
	if (message == "success_write") {
		alert("글을 작성하였습니다.")
	} else if (message == "success_delete") {
		alert("글을 삭제하였습니다.")
	}
	
	// 공지사항 작성
	$("#btnNoticeWrite").click(function() {
		location.href = "/notice_board/notice_write";
	});
	 
	 // 해당 글 읽기
	 $(".title").click(function(e) {
		e.preventDefault();
		setPage();
		setSearch();
		
		var b_no = $(this).attr("data-b_no");
// 		console.log(b_no);
		$("input[name=b_no]").val(b_no);
		var a_no = $(this).attr("data-a_no");
		$("input[name=a_no]").val(a_no);
		var href = $(this).attr("href");
// 		console.log(href);
		$("#hiddenData").attr("action", href).submit();
		
	 });
	 
	 // 검색바
// 	 $("#btnSearch").click(function() {
// 		 var searchType = $("#searchType").val();
// 		 var keyword = $("#keyword").val();
// 		 console.log(searchType);
// 		 console.log(keyword);
// 		$("input[name=searchType]").val(searchType);
// 		$("input[name=keyword]").val(keyword);
// 		$("#hiddenData").submit();
// 	 });
	 
	 // 페이징 기능
	 function setPage() {
		 var nowPage = "${ noPagingDto.nowPage }";
		 if (nowPage == "") {
			 nowPage =1;
		 }
		 var perPage = $("select[name=dataTable_length]").val();
		 $("input[name=nowPage]").val(nowPage);
		 $("input[name=perPage]").val(perPage);
	 }
	 
	 // 검색 기능
	 function setSearch() {
		 $("#keyword").keyup(function(e){
			 setPage();
			 if(e.keyCode == 13) {
				$("input[name=searchType]").val("b_title");
				var keyword = $("#keyword").val();
				$("input[name=keyword]").val(keyword);
				$("#hiddenData").submit();
			 }
		 });
	 }
	 
	 // 검색
	 setSearch();

	 // n줄씩 보기
	 $("select[name=dataTable_length]").change(function() {
		 setPage();
		 setSearch();
		 $("#hiddenData").submit();
	 });


 });
</script>

<style>
	
</style>

	<!-- 공지사항 시작 -->
	<div class="container-fluid">
	
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ 공지사항</p>
	
	<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
	
	<!-- 검색바 -->
<!-- 	<div style="float: right;"> -->
<!-- 		<select id="searchType"> -->
<!-- 			<option value="viewAll" selected="selected">전체</option> -->
<!-- 			<option value="b_title">제목</option> -->
<!-- 			<option value="b_content">내용</option> -->
<!-- 			<option value="b_writer">작성자</option> -->
<!-- 		</select> -->
<!-- 		<input type="text" id="keyword" placeholder="Search for..."> -->
<!-- 		<button class="btn btn-primary" id="btnSearch">검색</button> -->
<!-- 	</div> -->
	
	<!-- 해당 페이지 갯수 체크 -->
	<p class="mb-4">
		<span>전체 ${ count }건의 게시물이 있습니다.</span>
	</p>
	
	<!-- 공지사항 리스트 -->
	  <div class="card shadow mb-4">
	    <div class="card-header py-3">
	      <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>	
	    </div>
	    <div class="card-body">
	      <div class="table-responsive">
	   
		<!-- 히든 데이터 값 시작 -->
		<form id="hiddenData" action="/notice_board/notice_list">
			<input type="hidden" name="b_no">
			<input type="hidden" name="a_no">
			<input type="hidden" name="nowPage">
			<input type="hidden" name="perPage">
			<input type="hidden" name="searchType">
			<input type="hidden" name="keyword">
		</form>
		<!-- 히든 데이터 값 끝 -->
	      
	      <!-- 페이징 시작 -->
	      <div class="dataTables_length" id="dataTable_length" style="float:left;">
	      	<select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
	      		<c:forEach var="i" begin="10" end="30" step="5">
			      	<option value="${ i }" <c:if test="${ i == noPagingDto.perPage }">selected</c:if>>${ i }</option>
		      	</c:forEach>
	      	</select>
	      	</div>
	      	<!-- 페이징 끝 -->
	      	
	      	<!-- 검색바 시작 -->
	      	<div id="dataTable_filter" class="dataTables_filter" style="float:right;">
	      		<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable" id="keyword" style="margin-bottom: 20px;">
	      	</div>
	      	<!-- 검색바 끝 -->

			<!-- 테이블 시작 -->
	        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
	          <thead>
	            <tr>
	              <th>번&nbsp;&nbsp;호</th>
	              <th>제&nbsp;&nbsp;목</th>
	              <th>첨부파일</th>
	              <th>작성자</th>
	              <th>조회수</th>
	              <th>작성날짜</th>
	            </tr>
	          </thead>
	          <tbody>
	          <c:forEach items="${ list }" var="noticeBoardVo">
	          <c:if test="${ noticeBoardVo.b_checkeddel == 0 }">
	            <tr>
	              <td>${ noticeBoardVo.b_no }</td>
	              <td>
	              	<a href="/notice_board/notice_read" class="title" style="float: left;" data-b_no="${ noticeBoardVo.b_no }" data-a_no="${ noticeBoardVo.a_no }">[${ noticeBoardVo.a_name }] ${ noticeBoardVo.b_title }</a>
           		  </td>
           		  <td>N</td>
	              <td>${ noticeBoardVo.b_writer }</td>
	              <td>${ noticeBoardVo.b_readcount }</td>
	              <td><fmt:formatDate value="${ noticeBoardVo.b_createddate }" pattern="yyyy-MM-dd"/></td>
	            </tr>
			  </c:if>
           	  </c:forEach>
	          </tbody>
	        </table>
	      </div>
	    </div>
	  </div>
	  <!-- 테이블 끝 -->
	  
	  <!-- 각종 버튼 및 유틸 모음 시작 -->
	<div>
		<a href="/notice_board/notice_list"><button type="button" class="btn btn-success" style="float: left;"><span class="fas fa-list"></span></button></a>
		<button class="btn btn-danger" id="btnNoticeWrite" style="float: right;">공지사항 작성</button>
		
	  	<!-- 페이지네이션 시작 -->
		<div class="dataTables_paginate paging_simple_numbers item" id="dataTable_paginate">
			<ul class="pagination">
				<li class="paginate_button page-item previous disabled" id="dataTable_previous">
					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">prev</a>
				</li>
				<li class="paginate_button page-item active">
					<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
				</li>
				<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>
				</li>
				<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
				</li>
				<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
				</li>
				<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>
				</li>
				<li class="paginate_button page-item next" id="dataTable_next">
					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">next</a>
				</li>
			</ul>
		</div>
		<!-- 페이지네이션 끝 -->

	</div>
	<!-- 각종 버튼 및 유틸 끝 -->
	
	</div>
	<br>
	<!-- 공지사항 끝 -->

<%@include file="../include/footer.jsp" %>