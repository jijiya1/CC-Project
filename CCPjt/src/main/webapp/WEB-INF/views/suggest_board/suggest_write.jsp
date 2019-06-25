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
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" method="post" id="WriteForm">
				<div class="form-group">			 
					<label for="title">글제목</label>
					<input type="text" class="form-control" id="b_title" name="b_title"/>
				</div>
				
				<div class="form-group">					 
					<label for="b_addinfo">지역</label>
					<input type="text" class="form-control" id="b_addinfo" name="b_addinfo" />
				</div>
				
				<div class="form-group">					 
					<label for="b_detailinfo">구</label>
					<input type="text" class="form-control" id="b_detailinfo" name="b_detailinfo"/>
				</div>
				
				<div class="form-group">					 
					<label for="writer">작성자</label>
					<input type="text" class="form-control" id="b_writer" name="b_writer" />
				</div>
				
				<div class="form-group">				 
					<label for="content">글내용</label>
					<textarea rows="10" cols="80" id="b_content" name="b_content"></textarea>															
				</div>	
											
				<input type="button" id="btnWrite"
					class="btn btn-primary" value="작성완료">
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>