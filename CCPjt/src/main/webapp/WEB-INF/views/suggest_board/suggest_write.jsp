<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ include file="../include/head.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
<script>
$(document).ready(function() {
	$("#btnWrite").click(function() {
		$("#WriteForm").submit();
	});
});
</script>
<h1>글쓰기</h1>
<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
			<form role="form" method="post" id="WriteForm" enctype="multipart/form-data">
				<div class="form-group">			 
					<label for="title">글제목</label>
					<input type="text" class="form-control" id="b_title" name="b_title"/>
				</div>
				
				<div class="form-group">					 
					<label for="b_addinfo">지역</label>
					<input type="text" class="form-control" id="b_addinfo" name="b_addinfo" />
				</div>
<!-- 				<label>지역</label> -->
<!-- 				<select class="form-control" name="b_addinfo" id="b_addinfo" required="required">			 -->
<!-- 				</select> -->
				
			<div class="form-group">					 
				<label for="b_detailinfo">구</label>
				<input type="text" class="form-control" id="b_detailinfo" name="b_detailinfo"/>
			</div>
				
<!-- 				<label>구</label> -->
<!-- 				<select class="form-control" name="b_detailinfo" id="b_detailinfo" required="required">			 -->
<!-- 				</select> -->
				
				<div class="form-group">					 
					<label for="writer">작성자</label>
					<input type="text" class="form-control" id="b_writer" name="b_writer" />
				</div>
				
				<div class="form-group">
					<label for="b_content">글내용</label>
					<textarea rows="10" cols="80" id="b_content"
						class="form-control" name="b_content"></textarea>
				</div>
				<!-- 첨부파일 -->
				<input type="file" id="upFile" multiple="multiple"
					class="btn btn-primary" value="첨부파일">
					<br/><br/>				
			</form>
			
				<button type="button" class="btn btn-success" value="작성완료"
						id="btnWrite" style="float: right;"><span class="fas fa-pencil-alt"></span>작성완료</button>	
		</div>
				
	</div>
</div>
<%@ include file="../include/footer.jsp" %>