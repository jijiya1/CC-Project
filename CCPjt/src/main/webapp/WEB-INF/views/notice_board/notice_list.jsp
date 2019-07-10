<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<style>

	div {
		position:relative;
	}

</style>

<script>
$(document).ready(function() {
	
	// 알람창
	var message = "${message}";
	if (message == "success_delete") {
		alert("글을 삭제하였습니다.")
	}
	
	// 공지사항 작성
	$("#btnNoticeWrite").click(function() {
		location.href = "/notice_board/notice_write?a_no=${areaDataVo.a_no}";
	});
	
	// 공지사항 목록
	$("#btnNoticeList").click(function() {
		location.href = "/notice_board/notice_list?a_no=${ areaDataVo.a_no }&searchType=b_addinfo&keyword=${ areaDataVo.a_no }";
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
			 nowPage = 1;
		 }
		 var perPage = $("select[name=dataTable_length]").val();
		 $("input[name=nowPage]").val(nowPage);
		 $("input[name=perPage]").val(perPage);
		 
	 }
	 
	 // 검색 기능
	 function setSearch() {
		 $("#keyword").keyup(function(e){
			 if(e.keyCode == 13) {
				setPage();
				$("input[name=searchType]").val("b_title");
				var a_no = "${ areaDataVo.a_no }";
				console.log(a_no);
				$("input[name=a_no]").val(a_no);
				var keyword = $("#keyword").val();
				$("input[name=keyword]").val(keyword);
				console.log(keyword);
				$("#hiddenData").submit();
			 }
		 });
	 }
	 
	 // 검색
	 setSearch();

	 // n줄씩 보기
	 $("select[name=dataTable_length]").change(function() {
		 setPage();
		 
		 var a_no = "${ areaDataVo.a_no }";
		 $("input[name=a_no]").val(a_no);
		 $("input[name=searchType]").val("b_addinfo");
		 $("input[name=keyword]").val(a_no);
		 
		 $("#hiddenData").submit();
	 });
	 
	 // 페이지네이션
	 $(".page-link").click(function(e) {
		 e.preventDefault();
		 
		 var a_no = "${ areaDataVo.a_no }";
		 $("input[name=a_no]").val(a_no);
		 $("input[name=keyword]").val(a_no);
		 
		 $("input[name=searchType]").val("b_addinfo");
		 
		 var nowPage = $(this).attr("data-page");
		 $("input[name=nowPage]").val(nowPage);
		 
		 var perPage = $("select[name=dataTable_length]").val();
		 $("input[name=perPage]").val(perPage);
		 
		 $("#hiddenData").submit();
	 });

 });
</script>

<style>
	
</style>

<title>CCPJT - 공지사항 - ${ areaDataVo.a_name }</title>

	<!-- 공지사항 시작 -->
	<div class="container-fluid">
	
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ 
	<c:choose>
	<c:when test="${ areaDataVo.a_no ne 10 }">
		<a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a>
	</c:when>
	<c:otherwise>
		<a href="/notice_board/notice_list?b_no=&a_no=10&nowPage=1&perPage=10&searchType=b_addinfo&keyword=10">${ areaDataVo.a_name }</a>
	</c:otherwise>
	</c:choose>
	
	 ＞ 공지사항</p>
	
	<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
	
	<!-- 해당 페이지 갯수 체크 -->
	<p class="mb-4">
		<span>전체 ${ count }건의 게시물이 있습니다.</span>
	</p>

	<!-- 공지사항 리스트 -->
	  <div class="card shadow mb-4">
	    
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
	      		<input type="search" class="form-control form-control-sm" placeholder="검색" aria-controls="dataTable" id="keyword" style="margin-bottom: 20px;">
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
	          <c:choose>
	          
		         <c:when test="${ list == '[]' }">
			        <tr>
			        	<td colspan="6">검색된 글이 없습니다.</td>
			        </tr>
		         </c:when>
		          
		         <c:otherwise>
			          <c:forEach items="${ list }" var="noticeBoardVo">
			          
			          <c:if test="${ noticeBoardVo.b_checkeddel == 0 }">
			            <tr>
			              <td>${ noticeBoardVo.b_no }</td>
			              <td>
			              	<a href="/notice_board/notice_read" class="title" style="float: left;" 
			              	data-b_no="${ noticeBoardVo.b_no }" data-a_no="${ noticeBoardVo.a_no }">
			              	[${ noticeBoardVo.a_name }] ${ noticeBoardVo.b_title }&nbsp;
			              	<c:if test="${ noticeBoardVo.b_readcount >= 10 }"><img src="/resources/img/hot.gif"></c:if>
			              	</a>
		           		  </td>
		           		  <td>N</td>
			              <td>${ noticeBoardVo.u_name }</td>
			              <td>${ noticeBoardVo.b_readcount }</td>
			              <td><fmt:formatDate value="${ noticeBoardVo.b_createddate }" pattern="yyyy-MM-dd"/></td>
			            </tr>
					  </c:if>
		           	  </c:forEach>
	           	  </c:otherwise>
           	  
           	  </c:choose>
           	   
	          </tbody>
	        </table>
	      </div>
	      
        <!-- 목록, 공지사항 작성 버튼 시작 -->
		<button type="button" class="btn btn-success" style="float: left;" id="btnNoticeList" data-toggle="tooltip" data-placement="top" title="목록"><span class="fas fa-list"></span></button>
		<!-- 목록, 공지사항 작성 버튼 끝 -->
		
	  	<!-- 페이지네이션 시작 -->
		<div class="dataTables_paginate paging_simple_numbers item" id="dataTable_paginate" style="float: right;">
			<ul class="pagination">
			
			<c:if test="${ noPaginationDto.prevTen != true }">
				<li class="paginate_button page-item previous" id="dataTable_previous">
					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" data-page="${ noPaginationDto.noPagingDto.nowPage - 10 }">≪</a>
				</li>
			</c:if>
			
			<c:if test="${ noPaginationDto.prev != true }">
				<li class="paginate_button page-item previous" id="dataTable_previous">
					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" data-page="${ noPaginationDto.noPagingDto.nowPage - 1 }">＜</a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${ noPaginationDto.startPage }" end="${ noPaginationDto.endPage }">
				<li class="paginate_button page-item <c:if test="${ noPaginationDto.noPagingDto.nowPage == i }">active</c:if>">
					<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link" data-page="${ i }">${ i }</a>
				</li>
			</c:forEach>
			
			<c:if test="${ noPaginationDto.next != true }">
				<li class="paginate_button page-item next" id="dataTable_next">
					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" data-page="${ noPaginationDto.noPagingDto.nowPage + 1 }">＞</a>
				</li>
			</c:if>
			
			<c:if test="${ noPaginationDto.nextTen != true }">
				<li class="paginate_button page-item next" id="dataTable_next">
					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" data-page="${ noPaginationDto.noPagingDto.nowPage + 10 }">≫</a>
				</li>
			</c:if>
				
			</ul>
		</div>
		<!-- 페이지네이션 끝 -->
	      
	    </div>
	  </div>
	  <!-- 테이블 끝 -->
	
	<!-- css 테스트 -->
<!-- 	<div> -->
<!-- 		&nbsp;<button type="button" class="btn btn-primary"><span class="fas fa-pencil-alt"></span></button> -->
<!-- 		<div style="text-align: center;"><span class="fas fa-ambulance">&nbsp;</span></div> -->
<!-- 	</div> -->
	<c:if test="${ userVo.u_email eq 'admin' }">
		<div>
			<button class="btn btn-danger" id="btnNoticeWrite" data-toggle="tooltip" data-placement="top" title="공지사항 작성">공지사항 작성</button>
		</div>
	</c:if>
	
	</div>
	<!-- 공지사항 끝 -->

<%@include file="../include/footer.jsp" %>