<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	 
	 // 해당 글 읽기
	 $(".title").click(function(e) {
		e.preventDefault();
		var b_no = $(this).attr("data-b_no");
// 		console.log(b_no);
		$("input[name=b_no]").val(b_no);
		var href = $(this).attr("href");
// 		console.log(href);
		$("#hiddenData").attr("action", href).submit();
	 });
	 
 });
</script>

<style>

</style>

	<!-- 공지사항 시작 -->
	<div class="container-fluid">
	
	<p class="mb-4"><a href="/">홈</a> > 공지사항</p>
	
	<!-- 페이지 헤더 -->
	<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
	<p class="mb-4">항상 공지사항을 확인하세요.</p>
	
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
		</form>
		<!-- 히든 데이터 값 끝 -->
	      
	        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	          <thead>
	            <tr>
	              <th>번&nbsp;&nbsp;호</th>
	              <th>제&nbsp;&nbsp;목</th>
	              <th>작성자</th>
	              <th>조회수</th>
	              <th>작성날짜</th>
	            </tr>
	          </thead>
	          <tbody>
	          <c:forEach items="${ list }" var="noticeBoardVo">
	            <tr>
	              <td>${ noticeBoardVo.b_no }</td>
	              <td>
	              	<a href="/notice_board/notice_read" class="title" data-b_no="${ noticeBoardVo.b_no }">${ noticeBoardVo.b_title }</a>
           		  </td>
	              <td>${ noticeBoardVo.b_writer }</td>
	              <td>${ noticeBoardVo.b_readCount }</td>
	              <td>${ noticeBoardVo.b_createdDate }</td>
	            </tr>
           	  </c:forEach>
	          </tbody>
	        </table>
	      </div>
	    </div>
	  </div>
	  
	  <div>
	   <a href="notice_write" class="btn btn-primary btn-icon-split">
	   	<span class="icon text-white-50"><i class="fas fa-check"></i></span>
	   	<span class="text">공지사항 작성</span>
	   </a>
	  </div>
	
	</div>
	<br>
	<!-- 공지사항 끝 -->

<%@include file="../include/footer.jsp" %>