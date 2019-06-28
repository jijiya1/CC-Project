<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<title>국민 청원</title>
<script>
$(document).ready(function(){
	
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			
			<div class="tabbable" id="tabs-989343">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active show" href="/petition_board/petitionMain">청원메인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/petition_board/petitionList">게시판전체보기</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active">
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
									<td>2 </td>
									<td> </td>
									<td> </td>
								</tr></tbody>
						</table>
				</div>					
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

