<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	
	// 회원 정보 수정
	$(".user_update").click(function() {
		location.href = "/user_join/update_form";
	});
	
	// 회원 강제 탈퇴
	$(".user_delete").click(function() {
		var tr = $(this).parent().parent();
// 		console.log(tr);
		var u_email = $(this).attr('data-u_email');
// 		console.log(u_email);
		var url = "/admin/user_delete";
		var sendData = {
			"u_email" : u_email
		};
// 		console.log(sendData);
		$.get(url, sendData, function(rData) {
// 			console.log(rData);
			if (rData.trim() == "success") {
// 				console.log("실행함");
				tr.fadeOut();
			}
		})
	});
	
});
</script>

	<!-- 회원 목록 시작 -->
	<div class="container-fluid">
	
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ 회원 목록</p>
	
	<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800">회원 목록</h1>
	
	<!-- 해당 페이지 갯수 체크 -->
	<p class="mb-4">
		<span>총 ${ getUserCount }명의 회원이 조회되었습니다.</span>
	</p>

	<!-- 회원 목록 리스트 -->
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
	              <th>회원 이름</th>
	              <th>회원 이메일</th>
	              <th>가입일자</th>
	              <th>정보 수정</th>
	              <th>강제 탈퇴</th>
	            </tr>
	          </thead>
	          <tbody id="tbody">
				<c:forEach items="${ userinfoVo }" var="userinfoVo">
		            <tr>
		              <td>${ userinfoVo.u_name }</td>
		              <td>${ userinfoVo.u_email }</td>
		              <td><fmt:formatDate value="${ userinfoVo.u_createdDate }" pattern="yyyy-MM-dd"/></td>
		              <td><Button type="button" class="btn btn-sm btn-success user_update" data-u_email="${ userinfoVo.u_email }" data-toggle="tooltip" data-placement="top" title="정보 수정"><span class="fas fa fa-user-times"></span></Button></td>
		              <td><Button type="button" class="btn btn-sm btn-danger user_delete" data-u_email="${ userinfoVo.u_email }" data-toggle="tooltip" data-placement="top" title="강제 탈퇴"><span class="fas fa fa-user-times"></span></Button></td>
		            </tr>
           	  </c:forEach>
	          </tbody>
	        </table>
	      </div>
	      
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
	  <!-- 회원 목록 테이블 끝 -->

	  <div><br><br></div>
	  
	  </div>

<%@include file="../include/footer.jsp" %>