<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<title>국민 청원</title>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>
				청원 게시판
			</h3>
			<div class="tabbable" id="tabs-989343">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active show" href="#tab1" data-toggle="tab">Section 1</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#tab2" data-toggle="tab">Section 2</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
					<h2>청원메인</h2>
						<table class="table">
							<thead><tr>
									<th>번호</th>
									<th>상세지역</th>
									<th>제목</th>
									<th>청원만료일</th>
									<th>참여인원</th>
									<th>조회수</th>
								</tr></thead>
							<tbody><tr>
									<td>1</td>
									<td> </td>
									<td> </td>
									<td> </td>
								</tr></tbody>
						</table>
				</div>
				<div class="tab-pane" id="tab2">
					<h2>청원 전체 내용</h2>
						<table class="table">
						<thead><tr>
									<th>번호</th>
									<th>상세지역</th>
									<th>제목</th>
									<th>청원만료일</th>
									<th>참여인원</th>
									<th>조회수</th>
								</tr></thead>
							<tbody>
							<c:forEach items="${pList}" var="peVo">
								<tr>
									<td>${peVo.rnum}</td>
									<td>${peVo.a_name} </td>
									<td>${peVo.b_title}</td>
									<td>${peVo.b_enddate}</td>
									<td>${peVo.b_agree}</td>
									<td>${peVo.b_readcount}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						
							<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
<%-- 					<c:forEach var="i" begin="${pageDto. }"></c:forEach> --%>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
					</div>
				</div> 
			</div>
			
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>

