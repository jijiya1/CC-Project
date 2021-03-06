<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	
	// 회원 등급 변경
	$(".u_position").change(function() {
// 		var u_position = $("#u_position").val();
// 		console.log(u_position);
		var u_email = $(this).attr("data-u_email");
// 		console.log(u_email);
		var u_name = $(this).attr("data-u_name");
		var u_position = $("#u_position" + u_name).val();
// 		console.log(u_position);
		var url = "/admin/user_update";
		var sendData = {
				"u_position" : u_position,
				"u_email" : u_email
		};
		$.get(url, sendData, function(rData) {
// 			console.log(rData);
			if (rData.trim() == "success") {
// 				console.log("실행함");
				alert("정보가 수정되었습니다.");
			}
		});
	});
	
	// 회원 정보 조회
	$(".user_update").click(function() {
		var u_email = $(this).attr('data-u_email');
		location.href = "/admin/user_detail?u_email=" + u_email;
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
				alert("회원이 강제 탈퇴되었습니다.")
				tr.fadeOut();
			}
		})
	});
	 
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
				var searchType = $("#searchType").val();
				$("input[name=searchType]").val(searchType);
				
				var keyword = $("#keyword").val();
// 				console.log(keyword);
				$("input[name=keyword]").val(keyword);
//				console.log(keyword);
				$("#hiddenData").submit();
			 }
		 });
	 }
	 
	 // 검색
	 setSearch();

	 // n줄씩 보기
	 $("select[name=dataTable_length]").change(function() {
		 setPage();
		 
		 var searchType = $("#searchType").val();
		 $("input[name=searchType]").val(searchType);
			
		 var keyword = $("#keyword").val();
//			console.log(keyword);
		 $("input[name=keyword]").val(keyword);
//			console.log(keyword);
		 
		 $("#hiddenData").submit();
	 });
	 
	 // 페이지네이션
	 $(".page-link").click(function(e) {
		 e.preventDefault();
		 
		 var searchType = $("#searchType").val();
		 $("input[name=searchType]").val(searchType);

		 var nowPage = $(this).attr("data-page");
		 $("input[name=nowPage]").val(nowPage);
		 
		 var perPage = $("select[name=dataTable_length]").val();
		 $("input[name=perPage]").val(perPage);
		 
		 $("#hiddenData").submit();
	 });
	
});
</script>

<title>CCPJT - 회원 관리</title>

	<!-- 회원 목록 시작 -->
	<div class="container-fluid">
	
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ 회원 관리</p>
	
	<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
	
	<!-- 해당 페이지 갯수 체크 -->
	<p class="mb-4">
		<span>총 ${ getUserCount }명의 회원이 조회되었습니다.</span>
	</p>

	<!-- 회원 목록 리스트 -->
	  <div class="card shadow mb-4">
	    
	    <div class="card-body">
	      <div class="table-responsive">
	   
		<!-- 히든 데이터 값 시작 -->
		<form id="hiddenData" action="/admin/user_list">
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
	      	<div id="dataTable_filter" class="dataTables_filter" style="float:right; height: 50px; margin-bottom: 20px;">
	      		<div style="width: 32%; float: left;">
		      		<select class="form-control form-control-sm" id="searchType">
			      			<option value="u_name" 
			      				<c:if test="${noSearchDto.searchType == 'u_name'}"> selected="selected"</c:if>
			      			>이름</option>
			      			<option value="u_email"
			      				<c:if test="${noSearchDto.searchType == 'u_email'}"> selected="selected"</c:if>
			      			>이메일</option>
			      	</select>
		      	</div>
		      	<div style="width: 65%; float:right;">
		      		<input type="search" class="form-control form-control-sm" placeholder="검색" aria-controls="dataTable" id="keyword"
		      			<c:if test="${noSearchDto.keyword != null && noSearchDto.keyword != ''}">
		      				value="${noSearchDto.keyword }"
		      			</c:if>
		      		>
		      	</div>
	      	</div>
	      	<!-- 검색바 끝 -->

			<!-- 테이블 시작 -->
	        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
	          <thead>
	            <tr>
	              <th>회원 이름</th>
	              <th>회원 이메일</th>
	              <th>가입일자</th>
	              <th>등급 변경</th>
	              <th>정보 조회</th>
	              <th>강제 탈퇴</th>
	            </tr>
	          </thead>
	          <tbody id="tbody">
				<c:forEach items="${ userinfoVo }" var="userinfoVo">
		            <tr>
		              <td>${ userinfoVo.u_name }</td>
		              <td>${ userinfoVo.u_email }</td>
		              <td><fmt:formatDate value="${ userinfoVo.u_createdDate }" pattern="yyyy-MM-dd"/></td>
		              <td>
		              	<select class="form-control-sm u_position" id="u_position${ userinfoVo.u_name }" data-u_email="${ userinfoVo.u_email }" data-u_name="${ userinfoVo.u_name }">
		              		<option value="0" <c:if test="${ userinfoVo.u_position == 0 }">selected</c:if>>시민</option>
		              		<option value="1" <c:if test="${ userinfoVo.u_position == 1 }">selected</c:if>>의원</option>
	              		</select>
              		  </td>
		              <td><Button type="button" class="btn btn-sm btn-success user_update" data-u_email="${ userinfoVo.u_email }" data-toggle="tooltip" data-placement="top" title="정보 조회"><span class="fas fa fas fa-address-card"></span></Button></td>
		              <td><Button type="button" class="btn btn-sm btn-danger user_delete" data-u_email="${ userinfoVo.u_email }" data-toggle="tooltip" data-placement="top" title="강제 탈퇴"><span class="fas fa fa-user-times"></span></Button></td>
		            </tr>
           	  </c:forEach>
	          </tbody>
	        </table>
	      </div>
	      
	    <!-- 페이지네이션 시작 -->
		<div class="dataTables_paginate paging_simple_numbers item" id="dataTable_paginate" style="float: right;">
			<ul class="pagination">
			
			<c:if test="${ noPaginationDto.startPage != 0 && noPaginationDto.startPage != null}">
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