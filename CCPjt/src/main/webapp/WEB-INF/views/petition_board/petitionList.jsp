<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/head.jsp" %>

<title>국민 청원</title>
<script>
$(document).ready(function(){
	
	function setPage(){
		var ano = ${areaDataVo.a_no};
// 		var nowPage =1;
// 		nowPage= ${pagingDto.page};
	}
	
	$(".a_page").click(function(e){
		e.preventDefault();
	});
	
	$(".a_title").click(function(e){
		e.preventDefault();
		var bno = $(this).attr("data-bno");
		var ano = ${areaDataVo.a_no};
		$("input[name=b_no]").val(bno);
		$("input[name=a_no]").val(ano);
		console.log("bno :" + bno);
		var href = $(this).attr("href");
		$("#pageForm").attr("action",href).submit();
	});
});

</script>
<form id="pageForm" action="/petition_board/petitionMain">
	<input type="hidden" name="a_no" value="${param.a_no}">
	<input type="hidden" name="b_no" >
	
</form>
<p class="mb-4">
	<span class="fas fa-home">&nbsp;</span>
	<a href="/">홈</a> ＞<a href="/notice_board/notice_list?a_no=${areaDataVo.a_no}"> ${areaDataVo.a_name}</a>
	＞ 청원게시판</p>
	
		<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800"> 청원게시판(전체보기)</h1>
	
		<p class="mb-4">
		<span> 전체 ${ count }건의 게시물이 있습니다.</span>
	</p>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			
			<div class="tabbable" id="tabs-989343">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" href="/petition_board/petitionMain?a_no=${areaDataVo.a_no}">청원메인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active show" href="/petition_board/petitionList?a_no=${areaDataVo.a_no}">게시판전체보기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active show" href="/petition_board/petitionRunOut?a_no=${areaDataVo.a_no}">만료된 청원</a>
					</li>
				</ul>
				<div class="tab-content">
					
				<div class="tab-pane active" id="tab2">
						<table class="table">
						<thead><tr>
									<th>번호</th>
									<th>제목</th>
									<th>청원만료일</th>
									<th>진행도</th>
									<th>참여인원</th>
									<th>조회수</th>
								</tr></thead>
							<tbody>
							<c:forEach items="${pList}" var="peVo">
								<tr>
									<td>${peVo.rnum}</td>
									<td><a href="/petition_board/petitionRead"
											class="a_title" data-bno="${peVo.b_no}">
											<span style="font-size: 14px">[${peVo.a_name}/${peVo.d_name}] </span>
											&nbsp; ${peVo.b_title}</a>
									</td>
									<td><fmt:formatDate value="${peVo.b_enddate}"
													pattern="yy/MM/dd HH:mm"/> </td>
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
						
							<ul class="pagination">
					<li class="page-item">
						<a class="page-link a_page" href="#">Previous</a>
					</li>

					<li class="page-item">
						<a class="page-link a_page" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link a_page" href="#">Next</a>
					</li>
				</ul>
					</div>
				</div> 
			</div>
			
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>

