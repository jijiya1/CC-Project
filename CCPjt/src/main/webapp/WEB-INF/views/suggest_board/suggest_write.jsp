<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>
<script>
$(document).ready(function() {
	//글쓰기
	$("#btnWrite").click(function() {
		$("#WriteForm").submit();
	});
	// 글 작성 취소
	$("#btnCancel").click(function() {
		location.href="/suggest_board/suggest_list?a_no=${a_no}";
	});

});
</script>

<!-- 토론 주제 추천 작성 시작 -->
	<div class="container-fluid">
	       
		<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞<a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a> > 자유게시판</p>
		
		<h1 class="h3 mb-2 text-gray-800">자유게시판 글쓰기</h1><br>
		
		<!-- 공지사항 작성 부분 시작 - form -->
		<form role="form" method="post" id="WriteForm" enctype="multipart/form-data">
			<input type="hidden" name="a_no" value="${areaDataVo.a_no}">
			<input type="hidden" name="u_email" value="${userVo.u_email}">
			<input type="hidden" name="u_name" value="${userVo.u_name}">
		
			<div class="form-group">
				<label>글 제목</label>
				<input type="text" class="form-control" name="b_title" required="required"/>
			</div>
			
			<div class="form-group" <c:if test="${areaDataVo.a_no eq a_no}">style="display: none;"</c:if>>
				<label>시/도</label>
				<select class="form-control" name="b_addinfo" id="b_addinfo" required="required">
					<c:forEach items="${areaData}" var="areaData">
						<option value="${areaData.a_no}" <c:if test='${areaData.a_no eq a_no}'>selected</c:if>>${ areaData.a_name }</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group">
				<label>구</label>
				<select class='form-control' name='b_detailinfo' id='b_detailinfo' required='required'>
					<c:forEach items='${getDetailAreaData}' var='detailAreaData'>
						<option value='${detailAreaData.d_no}'>${detailAreaData.d_name}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group">
					<label for="b_content">글내용</label>
					<textarea rows="10" cols="80" id="b_content"
						class="form-control" name="b_content"></textarea>
				</div>
				
			<button type="button" class="btn btn-primary" data-placement="top"
				id="btnWrite"data-toggle="tooltip" data-placement="top" title="작성"><span class="fas fa-check"></span></button>
			<button type="button" class="btn btn-danger" id="btnCancel"  data-placement="top" data-toggle="tooltip" data-placement="top" title="취소"><span class="fas fa-times"></span></button>
		</form>
	</div>
<%@include file="../include/footer.jsp" %>