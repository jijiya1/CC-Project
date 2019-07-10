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

	$("#btnMod").click(function(){
		var b_title =$("#b_title").val();
		$("input[name=b_title]").val(b_title);
		var b_content =$("#summernote").val();
		$("input[name=b_content]").val(b_content);
		var b_detailInfo =$("select[name=b_detailinfo]").val();
		$("input[name=b_detailInfo]").val(b_detailInfo);
		
// 		console.log(b_title);
// 		console.log(b_content);
// 		console.log(b_detailInfo);
		
		$("#modifySelectDiscussion").submit();
	});	
	// 글 수정 취소
	$("#btnCancel").click(function() {
		history.back();
	});	

});
</script>

<!-- 토론 주제 추천 수정 시작 -->
	<title>토론 주제 추천 게시판 - ${areaDataVo.a_name } 지역</title>
	<div class="container-fluid">
	   
		<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞</p>
		<p>데이터 확인: ${areaDataVo }</p>
		<!-- 페이지 헤더 -->
		<h1 class="h3 mb-2 text-gray-800">토론 주제 추천 글수정</h1><br>
		
		<form id="modifySelectDiscussion" method="post" action="/selectDiscussion/discussion_select_modify">
			<input type="hidden" name="nowPage" value ="${pagingDto.nowPage }">
			<input type="hidden" name="a_no" value ="${areaDataVo.a_no }">
			<input type="hidden" name="countRow" value ="${pagingDto.countRow }">
			<input type="hidden" name="a_no" value="${ areaDataVo.a_no }">
			<input type="hidden" name="b_no" value="${selectDiscussion_BoardVo.b_no }">
			<input type="hidden" name="b_title">
			<input type="hidden" name="b_content">
			<input type="hidden" name="b_detailInfo">
			<input type="hidden" name="u_email" value = "${userVo.u_email}">
		</form>
		
		<!-- 공지사항 작성 부분 시작 - form -->
			<input type="hidden" name="a_no" value="${ areaDataVo.a_no }">

		
			<div class="form-group">
				<label>공지사항 제목</label>
				<input type="text" class="form-control" id="b_title" required="required" value="${selectDiscussion_BoardVo.b_title }"/>
			</div>
			
			<div class="form-group">
				<label>작성자</label>
				<input type="text" class="form-control" name="b_writer" required="required"  value = "${selectDiscussion_BoardVo.b_writer}" readonly="readonly"/>
			</div>
			
			<div class="form-group">
				<label>ID</label>
				<input type="text" class="form-control" name="u_email" required="required" value = "${selectDiscussion_BoardVo.u_email}" readonly="readonly"/>
			</div>
			
			<div class="form-group">
				<label>구</label>
				<select class='form-control'  name='b_detailinfo' required='required'>
					<c:forEach items='${getDetailAreaData}' var='detailAreaData'>
						<option value='${detailAreaData.d_no}'>${detailAreaData.d_name}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group">
				<label>토론 주제 추천 내용</label><br>
				  <textarea id="summernote" required="required"> ${selectDiscussion_BoardVo.b_content } </textarea>
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

			<button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="작성" id="btnMod"><span class="fas fa-check"></span></button>
			<button type="button" class="btn btn-danger" id="btnCancel" data-toggle="tooltip" data-placement="top" title="취소"><span class="fas fa-times"></span></button>
		<!-- 토론 주제 추천 작성 부분 끝 - form -->

	</div>
	<!-- 토론 주제 추천 작성 끝 -->

<%@include file="../include/footer.jsp" %>