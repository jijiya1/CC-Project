<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/head.jsp" %>

<title>국민 청원</title>
<script>
$(document).ready(function(){
	var a_no = "${areaDataVo.a_no}";
	$("input[name=a_no]").val(a_no);
	function setPage(){
		var nowPage="${pageDto.nowPage}";
			if(nowPage == ""){
				nowPage = 1;
			}
		var countRow = $("#countRow").val();
		
		$("input[name=nowPage]").val(nowPage);
		$("input[name=countRow]").val(countRow);
	}
	function setSearch(){
		setPage();
		var searchType = $("#searchType").val();
		var keyword = $("#keyword").val();

		$("input[name=searchType]").val(searchType);
		$("input[name=searchKeyword]").val(keyword);
	}
	
	$("#countRow").change(function(e){
		e.preventDefault();
		setPage();
// 		var countRow = $("#countRow").val();
// 		console.log("countRow" + countRow);
// 		$("input[name=countRow]").val(countRow);
		$("#pageForm").submit();
	});
	
	 $("#keyword").keyup(function(e){
		 if(e.keyCode == 13) {
			 setSearch();
			$("#pageForm").submit();
		 }
	 });

	
	$(".a_page").click(function(e){
		e.preventDefault();
		var nowPage = $(this).attr("data-page");
		$("input[name=nowPage]").val(nowPage);
		$("#pageForm").submit();
	});
	
	$(".a_title").click(function(e){
		e.preventDefault();
		var bno = $(this).attr("data-bno");
		var ano = ${areaDataVo.a_no};
		$("input[name=b_serialno]").val(bno);
		$("input[name=a_no]").val(ano);
		console.log("bno :" + bno);
		var href = $(this).attr("href");
		$("#pageForm").attr("action",href).submit();
	});
	
	$("#btnPetition").click(function(e){
		e.preventDefault();
		if("${userVo}" != null && "${userVo}" != ""){
			var href = "/petition_board/petitionWrite";
			$("#pageForm").attr("action", href).submit();
		} else {
			alert("로그인이 필요한 기능입니다.");
		}
	});
});
</script>
<form id="pageForm" action="/petition_board/petitionList">
	<input type="hidden" name="a_no" value="${param.a_no}">
	<input type="hidden" name="b_serialno"  value="${param.b_serialno}">
	<input type="hidden" name="nowPage" value="${pageDto.nowPage}">
	<input type="hidden" name="countRow" value="${pageDto.countRow}">
	<input type="hidden" name="searchType" value="${pageDto.searchType}">
	<input type="hidden" name="searchKeyword" value="${pageDto.searchKeyword}"> 	
</form>

<div class="container-fluid">

<p class="mb-4">
	<span class="fas fa-home">&nbsp;</span>
	<a href="/">홈</a> ＞<a href="/notice_board/notice_list?a_no=${areaDataVo.a_no}"> ${areaDataVo.a_name}</a>
	＞ 청원게시판</p>
	
		<!-- 페이지 헤더 -->	
	
		<h1 class="h3 mb-2 text-gray-800"> 청원 만료 게시판(만료)</h1><p class="mb-4">
		<span> 전체 ${count}건의 게시물이 있습니다.</span>
		<input class="btn btn-primary" type="button" value="청원하기" id="btnPetition">
	</p>

	  <div class="card shadow mb-4">
	    
	    <div class="card-body">
	    <!-- 페이징 시작 -->
	      <div class="dataTables_length" id="dataTable_length" style="float:left;">
	      	<select id="countRow" aria-controls="dataTable" 
	      					class="custom-select custom-select-sm form-control form-control-sm">
	      		<c:forEach var="i" begin="10" end="30" step="5">
			      	<option value="${ i }" <c:if test="${ i == pageDto.countRow }">selected</c:if>>${ i }</option>
		      	</c:forEach>
	      	</select>
	      	</div>
	      	<!-- 페이징 끝 -->
	      	<div class="row" style="float:right;">
		      	<div><select class="form-control form-control-sm" id="searchType">
		      			<option value="title">제목</option>
		      			<option value="content">내용</option>
		      			<option value="writer">작성자</option>
		      		</select>
		      	</div>
		      	<!-- 검색바 시작 -->
		      	<div id="dataTable_filter" class="dataTables_filter">
		      		<input type="search" class="form-control form-control-sm" placeholder="검색" aria-controls="dataTable" id="keyword" style="margin-bottom: 20px;">
		      	</div>
	      	</div>
	      	<!-- 검색바 끝 -->
	      <div class="table-responsive">
			
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" href="/petition_board/petitionMain?a_no=${areaDataVo.a_no}">청원메인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/petition_board/petitionList?a_no=${areaDataVo.a_no}">게시판전체보기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active show" href="/petition_board/petitionRunOut?a_no=${areaDataVo.a_no}">만료된 청원</a>
					</li>
				</ul>
				<div class="tab-content">
					
				<div class="tab-pane active" id="tab2">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
						<thead><tr>
									<th width="140">번 &nbsp;&nbsp;호</th>
									<th>제 <c:forEach var="i" begin="1" end="18">&nbsp;</c:forEach>목</th>
									<th width="200">청원만료일</th>
									<th width="200">진행도</th>
									<th width="200">참여인원</th>
									<th width="200">조회수</th>
								</tr></thead>
							<tbody>
							<c:forEach items="${pRunOut}" var="peVo">
								<tr>
									<td>${peVo.rnum}</td>
									<td><a href="/petition_board/petitionRead"
											class="a_title" style="float: left;" data-bno="${peVo.b_serialno}">
											<span style="font-size: 14px">[${peVo.a_name}/${peVo.d_name}] </span>
											&nbsp; ${peVo.b_title}</a>
									</td>
									<td>
										<fmt:formatDate value="${peVo.b_enddate}" pattern="yyyy-MM-dd" var="peDate"/>
            								<c:choose> 
		            							<c:when test="${formTime == peDate}">
		            								만료(<fmt:formatDate value="${peVo.b_enddate}" pattern="HH:mm"/>)
		            							</c:when>
		            							<c:otherwise>
		            								${peDate}
		            							</c:otherwise>
            							</c:choose> 
									</td>
									<td>
										<c:choose>
											<c:when test="${peVo.b_progress == 1}" >사전 동의 진행중</c:when>
											<c:when test="${peVo.b_progress == 2}">청원 시작</c:when>
											<c:when test="${peVo.b_progress == 3}">청원 진행중</c:when>
											<c:when test="${peVo.b_progress == 4}">청원 종료</c:when>
											<c:otherwise>답변 완료</c:otherwise>
										</c:choose>
									</td>													
									<td>${peVo.b_agree}</td>
									<td>${peVo.b_readcount}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
			<c:if test="${pageDto.startPage != 0 && pageDto.startPage != null}">
				<ul class="pagination" style="float: right;">
					<c:if test="${pageDto.prev == true}">
						<li class="page-item">
							<a class="page-link a_page" href="#"
								data-page="${pageDto.startPage- pageDto.countPage+1}">＜</a>
						</li>
					</c:if>
					<c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}">
						<li class="page-item <c:if test="${pageDto.nowPage == i }">active</c:if>">
							<a class="page-link a_page" href="#"
								
								data-page="${i}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pageDto.next == true }">
						<li class="page-item">
							<a class="page-link a_page" href="#"
								data-page="${pageDto.endPage+1 }">＞</a>
						</li>
					</c:if>
				</ul>
			</c:if>	
					</div>
				</div> 
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>