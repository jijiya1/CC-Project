<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<h1>글수정</h1>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" method="post" action="suggest_update-run">
				<input type="hidden" name="b_no" value="${vo.b_no}"/>
				<div class="form-group">
					<label for="b_title">글제목</label>
					<input type="text" class="form-control" id="b_title"
						name="b_title" value="${vo.b_title}"/>
				</div>
				<div class="form-group">
					<label for="b_writer">작성자</label>
					<input type="text" class="form-control" id="b_writer"
						name="b_writer" value="${vo.b_writer}" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="b_content">글내용</label>
					<textarea rows="10" cols="80" id="b_content"
						class="form-control" name="b_content" >${vo.b_content}</textarea>
				</div>				
				<div class="row">
					<div class="col-md-12">
						<input type="submit" class="btn btn-primary" value="수정완료"/>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>