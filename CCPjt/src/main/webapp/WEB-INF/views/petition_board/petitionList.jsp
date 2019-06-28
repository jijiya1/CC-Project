<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/head.jsp" %>

<title>국민 청원</title>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			
			<div class="tabbable" id="tabs-989343">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" href="/petition_board/petitionMain">청원메인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active show" href="/petition_board/petitionList">게시판전체보기</a>
					</li>
				</ul>
				<div class="tab-content">
					
				<div class="tab-pane active" id="tab2">
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
									<td>${peVo.a_name}/${peVo.d_name} </td>
									<td>${peVo.b_title}</td>
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
						<a class="page-link" href="#">Previous</a>
					</li>

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

