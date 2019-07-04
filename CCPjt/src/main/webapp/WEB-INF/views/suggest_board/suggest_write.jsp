<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<!-- summernote 필수!! - SHJ4359 -->
<!-- include summernote css/js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/summernote/dist/lang/summernote-ko-KR.js"></script>

<script>
$(document).ready(function() {
	// 툴팁
	$('[data-toggle="tooltip"]').tooltip();
	//글쓰기
	$("#btnWrite").click(function() {
		$("#WriteForm").submit();
	});
	// 글 작성 취소
	$("#btnCancel").click(function() {
		location.href="/suggest_board/suggest_list";
	});	
});
</script>

<!-- 토론 주제 추천 작성 시작 -->
	<div class="container-fluid">
	       
		<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞<a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a> > 자유게시판</p>
		
		<!-- 페이지 헤더 -->
		<h1 class="h3 mb-2 text-gray-800">자유게시판 글쓰기</h1><br>
		
		<!-- 공지사항 작성 부분 시작 - form -->
		<form role="form" method="post">
			<input type="hidden" name="a_no" value="${areaDataVo.a_no}">
			<input type="hidden" name="u_email" value="${userVo.u_email}">
			<input type="hidden" name="u_name" value="${userVo.u_name}">
		
			<div class="form-group">
				<label>글 제목</label>
				<input type="text" class="form-control" name="b_title" required="required"/>
			</div>
			
			<div class="form-group">
				<label>작성자</label>
				<input type="text" class="form-control" name="b_writer" required="required" />
			</div>
			
			<div class="form-group">
				<label>ID</label>
				<input type="text" class="form-control" name="u_id" required="required" />
			</div>
			
			<div class="form-group" <c:if test="${areaDataVo.a_no eq a_no }">style="display: none;"</c:if>>
				<label>시/도</label>
				<select class="form-control" name="b_addInfo" id="b_addinfo" required="required">
					<c:forEach items="${ areaData }" var="areaData">
						<option value="${ areaData.a_no }" <c:if test='${ areaData.a_no eq a_no }'>selected</c:if>>${ areaData.a_name }</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group">
				<label>구</label>
				<select class='form-control' name='b_detailInfo' id='b_detailinfo' required='required'>
					<c:forEach items='${getDetailAreaData}' var='detailAreaData'>
						<option value='${detailAreaData.d_no}'>${detailAreaData.d_name}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group">
				<label>글내용</label><br>
				  <textarea id="summernote" name="b_content" required="required"></textarea>
				  <script>
				        $('#summernote').summernote({
							lang: 'ko-KR',
				            height: 350,
				            minHeight: null,
				            maxHeight: null,
				            focus: true,
				            onImageUpload : function(files, editor, welEditable) {
				                sendFile(files[0], editor, welEditable);
				            }
				        });
				        var postForm = function() {
				        	var content = $('textarea[name="b_content"]').html($('#summernote').code());
				        }

				  </script>
			</div>
		
			<button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="작성"
				id="btnWrite"><span class="fas fa-check"></span></button>
			<button type="button" class="btn btn-danger" id="btnCancel" data-toggle="tooltip" data-placement="top" title="취소"><span class="fas fa-times"></span></button>
		</form>
	</div>
<%@include file="../include/footer.jsp" %>