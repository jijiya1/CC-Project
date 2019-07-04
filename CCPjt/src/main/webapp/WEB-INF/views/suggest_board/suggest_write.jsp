<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ include file="../include/head.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/summernote/dist/lang/summernote-ko-KR.js"></script>  
<script>
$(document).ready(function() {
	$("#btnWrite").click(function() {
		$("#WriteForm").submit();
	});
	$("#btnList").click(function() {
		location.href="/suggest_board/suggest_list";
	});
});
</script>
<h1>글쓰기</h1>
<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
			<form role="form" method="post" id="WriteForm" enctype="multipart/form-data">
				<input type="hidden" name="a_no" value="${areaDataVo.a_no}">
				
				<div class="form-group">			 
					<label for="title">글제목</label>
					<input type="text" class="form-control" id="b_title" name="b_title"/>
				</div>
						

				<div class="form-group">
					<label>시/도</label>
					<select class='form-control' name='b_addinfo' id='b_addinfo' required='required'>
						<c:forEach items='${areaData}' var='areaData'>
							<option value='${areaData.a_no}'>${areaData.a_name}</option>
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
					<label for="writer">작성자</label>
					<input type="text" class="form-control" id="b_writer" name="b_writer" />
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
			</form>
			
				<button type="button" class="btn btn-primary" value="작성완료"
						id="btnWrite" style="float: right;"><span class="fas fa-check"></span></button>
				<button type="button" class="btn btn-success" value="목록"
					id="btnList" style="float: right;"><span class="fas fa-list"></span></button>		
		</div>
				
	</div>
</div>
<%@ include file="../include/footer.jsp" %>