<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function () {
	
	var u_email = "${userVo.u_email}";
	var b_writer = "${userVo.u_name}";
	
	// 표시 게시글 갯수 변경
	$("#dataTable_length").change(function () {
		var url = "/selectDiscussion/discussion_select_board";
		$("#hiddenData").attr("action",url);
		
		var nowPage = 1;
		$("input[name=nowPage]").val(nowPage);
		
		var countRow = $("select[name=dataTable_length]").val();
		$("input[name=countRow]").val(countRow);
		
		$("#hiddenData").submit();
	});
	
	// 검색 기능
	$("#keyword").keyup(function(e) {
		if(e.keyCode == 13) {
			var url = "/selectDiscussion/discussion_select_board";
			$("#hiddenData").attr("action",url);
			
			var nowPage = 1;
			$("input[name=nowPage]").val(nowPage);
			
			var countRow = $("select[name=dataTable_length]").val();
			$("input[name=countRow]").val(countRow);
			
			var searchKeyword =  $(this).val();
			$("input[name=searchKeyword]").val(searchKeyword);
			
			var searchType =  $("#searchType").val();
			$("input[name=searchType]").val(searchType);
			
			$("#hiddenData").submit();
		}
	})
	
	// 페이지네이션
	$(".page-link").click(function (e) {
		e.preventDefault();
		
		var url = "/selectDiscussion/discussion_select_board";
		$("#hiddenData").attr("action",url);
		
		nowPage = $(this).attr("data-nowPage");
		$("input[name=nowPage]").val(nowPage);
		
		var countRow = $("select[name=dataTable_length]").val();
		$("input[name=countRow]").val(countRow);
		
		$("#hiddenData").submit();
	});
	
	// 제목 해당 게시글로 상세보기로 이동
	$(".select_title").click(function (e) {
		e.preventDefault();
		var b_no = $(this).attr("data-b_no");
// 		console.log(b_no + "번 글 제목 클릭");
		$("input[name=b_no]").val(b_no);
		
		var url = "/selectDiscussion/discussion_select_read";
		$("#hiddenData").attr("action",url);
		
		$("#hiddenData").submit();
	})
	
	// 글 작성 페이지로 이동
	$("#btnWrite").click(function () {
		if (u_email != null && u_email != "") {
			location.href = "/selectDiscussion/discussion_select_write?a_no="+${areaDataVo.a_no };
		} else {
			alert("로그인이 필요한 기능입니다.")
		}//if
	})//$("#btnWrite").click
});
</script>

	<!-- 토론 주제 추천게시판 시작 -->
	<div class="container-fluid">
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/discussion_board/discussion_main_board?a_no=${areaDataVo.a_no }">토론 게시판</a> ＞토론 주제 추천게시판</p>
	<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800">토론 주제 추천게시판</h1>

	<!-- 해당 페이지 갯수 체크 -->
	<p class="mb-4">
		<span>전체 ${pagingDto.totalData }건의 게시물이 있습니다.</span>
	</p>
	
	<p>${best3List }</p>
	
	<!-- 토론 주제 추천 리스트 -->
	  <div class="card shadow mb-4">
	    <div class="card-body">
		    <div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="media">
							<img class="mr-3" alt="Bootstrap Media Preview" src="/resources/img/rank1.JPG" width="50px" />
							<div class="media-body">
								<h5 class="mt-0">
									1위 글제목
								</h5> 글내용
							</div>
						</div>
						<div class="media">
							 <a class="mr-3" href="#"><img alt="Bootstrap Media Another Preview" src="/resources/img/rank2.JPG" width="50px"/></a>
							<div class="media-body">
								<h5 class="mt-0">
									2위 글제목
								</h5> 글내용
	
							</div>
						</div>							
						<div class="media">
							 <a class="mr-3" href="#"><img alt="Bootstrap Media Another Preview" src="/resources/img/rank3.JPG" width="50px"/></a>
							<div class="media-body">
								<h5 class="mt-0">
									3위 글제목
								</h5> 글내용
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 각종 버튼 및 유틸 끝 -->
	
	
	<!-- 토론 주제 추천 리스트 -->
	  <div class="card shadow mb-4">
	    
	    <div class="card-body">
	      <div class="table-responsive">
	   
		<!-- 히든 데이터 값 시작 -->
		<form id="hiddenData" action="">
			<input type="hidden" name="nowPage" value ="${pagingDto.nowPage }">
			<input type="hidden" name="a_no" value ="${areaDataVo.a_no }">
			<input type="hidden" name="countRow" value ="${pagingDto.countRow }">
			<input type="hidden" name="searchType" value = "${pagingDto.searchType }">
			<input type="hidden" name="searchKeyword" value = "${pagingDto.searchKeyword }">
			<input type="hidden" name="b_no">
		</form>
		<!-- 히든 데이터 값 끝 -->
	      
	      <!-- 페이징 시작 -->
	      <div class="dataTables_length" id="dataTable_length" style="float:left;">
	      	<select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
	      		<c:forEach var="i" begin="5" end="25" step="5">
			      	<option value="${ i }"
				      	<c:if test="${pagingDto.countRow == i}">
				      		selected="selected"			      	
				      	</c:if> 
			      	>${ i }</option>
			      	
		      	</c:forEach>
	      	</select>
	      	</div>
	      	<!-- 페이징 끝 -->
	      	
	      	<div id="dataTable_filter" class="dataTables_filter" style="float:right; height: 50px; margin-bottom: 20px;">
	      		<div style="width: 35%; float: left;">
		      		<select class="form-control form-control-sm" id="searchType">
			      			<option value="b_title" 
			      				<c:if test="${pagingDto.searchType == 'b_title'}"> selected="selected"</c:if>
			      			>제목</option>
			      			<option value="b_content"
			      				<c:if test="${pagingDto.searchType == 'b_content'}"> selected="selected"</c:if>
			      			>내용</option>
			      			<option value="b_writer"
			      				<c:if test="${pagingDto.searchType == 'b_writer'}"> selected="selected"</c:if>
			      			>작성자</option>
			      	</select>
		      	</div>
		      	<div style="width: 65%; float:right;">
		      		<input type="search" class="form-control form-control-sm" placeholder="검색" aria-controls="dataTable" id="keyword"
		      			<c:if test="${pagingDto.searchKeyword != null && pagingDto.searchKeyword != ''}">
		      				value="${pagingDto.searchKeyword }"
		      			</c:if>
		      		>
		      	</div>
	      	</div>
	      	<!-- 검색바 끝 -->

			<!-- 테이블 시작 -->
	        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
	          <thead>
	            <tr>
	              <th>번&nbsp;&nbsp;호</th>
	              <th>제&nbsp;&nbsp;목</th>
	              <th>작성자</th>
	              <th>조회수</th>
	              <th>추천수</th>
	              <th>작성날짜</th>
	            </tr>
	          </thead>
	          <tbody>
		          <c:forEach items="${selectBoardList }" var="selectBoardVo">
		          	<tr>
			          <td>${selectBoardVo.b_no}</td>
	           		  <td><a href="#" style="float: left;" class="select_title" data-b_no = "${selectBoardVo.b_no}">[${selectBoardVo.a_name}/${selectBoardVo.d_name}]&nbsp;${selectBoardVo.b_title}</a></td>
		              <td>${selectBoardVo.b_writer}(${selectBoardVo.u_email.substring(0,3)}***)</td>
		              <td>${selectBoardVo.b_readCount}</td>
		              <td>${selectBoardVo.b_upCount}</td>
		              <td><fmt:formatDate value="${selectBoardVo.b_createdDate}" pattern="yyyy-MM-dd HH:mm"/></td>
		             </tr>
		          </c:forEach>
	          </tbody>
	        </table>
	      </div>
	      
	      	  <!-- 각종 버튼 및 유틸 모음 시작 -->
	<div>
		<a href="/selectDiscussion/discussion_select_board?a_no=${areaDataVo.a_no }"><button type="button" class="btn btn-success" data-toggle="tooltip" data-placement="top" title="목록" style="float: left; margin-right: 10px">
		<span class="fas fa-list" ></span></button></a>
		
		<button type="button" class="btn btn-primary" id="btnWrite" data-toggle="tooltip" data-placement="top" title="작성"><span class="fas fa-pencil-alt"></span></button>
		
	  	<!-- 페이지네이션 시작 -->
		<div class="dataTables_paginate paging_simple_numbers item" id="dataTable_paginate" style="float: right;">
			<ul class="pagination">
				
					<li class="paginate_button page-item previous
						<c:if test="${pagingDto.prev == false}">
							disabled
						</c:if>
					" id="dataTable_previous">
						<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" data-nowPage="${pagingDto.startPage - 1}" class="page-link">≪</a>
					</li>
				
					<li class="paginate_button page-item previous
						<c:if test="${pagingDto.nowPage == 1}">
							disabled
						</c:if>
					" id="dataTable_previous">
						<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" data-nowPage="${pagingDto.nowPage - 1}" class="page-link" >＜</a>
					</li>
				
				<c:forEach var ="i" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
					<li class="paginate_button page-item 
						<c:if test="${pagingDto.nowPage == i}">
						 active
						</c:if>	">
						<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" data-nowPage="${i }" class="page-link" >${i }</a>
					</li>
				</c:forEach>
				
					<li class="paginate_button page-item next
						<c:if test="${pagingDto.nowPage == pagingDto.endPage}">
							disabled
						</c:if>
					" id="dataTable_next">
						<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" data-nowPage="${pagingDto.nowPage + 1}" class="page-link">＞</a>
					</li>
				
					<li class="paginate_button page-item next
						<c:if test="${pagingDto.next == false}">
							disabled
						</c:if>
					" id="dataTable_next">
						<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" data-nowPage="${pagingDto.endPage + 1}" class="page-link">≫</a>
					</li>
			</ul>
		</div>
		<!-- 페이지네이션 끝 -->
	      
	    </div>
	  </div>
	  <!-- 테이블 끝 -->
	  


	</div>
	<!-- 각종 버튼 및 유틸 끝 -->
	
	</div>
<%@include file="../include/footer.jsp" %>