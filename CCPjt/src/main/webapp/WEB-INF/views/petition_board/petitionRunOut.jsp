<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>
	
<p class="mb-4">
	<span class="fas fa-home">&nbsp;</span>
	<a href="/">홈</a> ＞<a href="/notice_board/notice_list?a_no=${areaVo.a_no}"> ${areaVo.a_name}</a>
	＞ 청원게시판</p>
	
		<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800"> 청원게시판(만료된 청원)</h1>
	
		<p class="mb-4">
		<span> 전체 ${ count }건의 게시물이 있습니다.</span>
	</p>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			
			<div class="tabbable" id="tabs-989343">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" href="/petition_board/petitionMain?a_no=${areaVo.a_no}">청원메인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active show" href="/petition_board/petitionList?a_no=${areaVo.a_no}">전체게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active show" href="/petition_board/petitionRunOut?a_no=${areaVo.a_no}">만료된 청원</a>
					</li>
				</ul>
				<div class="tab-content">
					
				<div class="tab-pane active" id="tab2">
						<table class="table">
						<thead><tr>
									<th>번호</th>
									<th>제목</th>
									<th>청원만료일</th>
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