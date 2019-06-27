<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function(){
	
	$("#file").change(function(e){
		
		var formData = new FormData();
			formData.append("file", $("input[name=file]")[0].files[0]);
			console.log("formData :" +formData);
		var url="/do_ajax/uploadList";
		$.ajax({
			"type" : "post",
			"url" : url,
			"data" : formData,
			"processData" : false,
			"contentType" : false,
			"success" : function(fileName){
				$("#txtFile").append(fileName +" <br/> ");
				
			}
	
		});

	}); //file. change
	
	
});
	
	

</script>
<title>후원게시판-글쓰기</title>
<div class="container-fluid">
	<div class="row">
	 <form name="writeUpload" method="post" enctype="multipart/form-data" action="/donation/writeUpload">

		<div class="col-md-8">
			
			 <h1>후원게시판 글 작성</h1>
			
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" id="b_title" name="b_title" />
				</div>
				<div class="form-group">
					<label>부제목</label>
					<input type="text" class="form-control" name="b_subtitle" />
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input type="text" class="form-control" name="b_writer" />
				</div>
				
				<div class="form-group">
					 
					<label>파일 업로드</label>
					<input multiple="multiple" type="file" class="form-control-file" 
					id="file" name="file" />
<!-- 					<input type="button" id="btnFile"> -->
<!-- 					<textarea readonly id="txtFile"></textarea> -->
					<div id="txtFile"></div>
				</div>
				
				<div class="form-group">
					<label>내용</label>
					<div>
					<textarea rows="10" cols="80" name="b_content"></textarea>
					</div>
				</div>
				<input type="submit" class="btn btn-primary" value="작성완료"
					id="btnWriete">	
		</div>
		</form>
	
	</div>
</div>

</body>
<%@include file="../include/footer.jsp" %>
</html>