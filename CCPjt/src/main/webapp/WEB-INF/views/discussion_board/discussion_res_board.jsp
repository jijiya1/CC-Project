<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>
	<!-- 토론 주제 추천게시판 시작 -->
	<div class="container-fluid">
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/discussion_board/discussion_main_board">토론 게시판</a> ＞토론 주제 추천게시판</p>
	<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800">토론 주제 추천게시판</h1>
	<p>데이터확인: ${pagingDto }</p>

	<!-- 해당 페이지 갯수 체크 -->
	<p class="mb-4">
		<span>전체 1건의 게시물이 있습니다.</span>
	</p>

	<!-- 공지사항 리스트 -->
	  <div class="card shadow mb-4">
	    
	    <div class="card-body">
	      <div class="table-responsive">
	   
		<!-- 히든 데이터 값 시작 -->
		<form id="hiddenData" action="">
			<input type="hidden" name="">
		</form>
		<!-- 히든 데이터 값 끝 -->
	      
	      <!-- 페이징 시작 -->
	      <div class="dataTables_length" id="dataTable_length" style="float:left;">
	      	<select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
	      		<c:forEach var="i" begin="10" end="30" step="5">
			      	<option value="${ i }">${ i }</option>
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
	           		  <td><a href="#" style="float: left;">[${selectBoardVo.b_addInfo}/${selectBoardVo.b_detailInfo}]${selectBoardVo.b_title}</a></td>
		              <td>${selectBoardVo.b_writer}</td>
		              <td>${selectBoardVo.b_readCount}</td>
		              <td>${selectBoardVo.b_upCount}</td>
		              <td><fmt:formatDate value="${selectBoardVo.b_createdDate}" pattern="yyyy-MM-dd HH:mm"/></td>
		             </tr>
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
		<button class="btn btn-danger">글작성 작성</button>
		
	  	<!-- 페이지네이션 시작 -->
		<div class="dataTables_paginate paging_simple_numbers item" id="dataTable_paginate" style="float: right;">
			<ul class="pagination">
			
				<li class="paginate_button page-item previous" id="dataTable_previous">
					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">≪</a>
				</li>
			
				<li class="paginate_button page-item previous" id="dataTable_previous">
					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" >＜</a>
				</li>
			
				<li class="paginate_button page-item active">
					<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link" >1</a>
				</li>
				<li class="paginate_button page-item">
					<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link" >2</a>
				</li>
			
				<li class="paginate_button page-item next" id="dataTable_next">
					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">＞</a>
				</li>
			
				<li class="paginate_button page-item next" id="dataTable_next">
					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">≫</a>
				</li>
			</ul>
		</div>
		<!-- 페이지네이션 끝 -->

	</div>
	<!-- 각종 버튼 및 유틸 끝 -->
	
	</div>
<%@include file="../include/footer.jsp" %>