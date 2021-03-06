<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>
function copyUrl() {
	var url = document.getElementById("inputUrl");
	url.select();
	document.execCommand("Copy");
	alert("URL이 복사되었습니다.")
}
</script>

<title>CCPJT - 청원 글 게시 완료</title>

<div class="container-fluid">
<h3 style="text-align: center;">&lt;청원글 게시&gt;</h3>
	<div class="row">
		<div class="col-md-12">
			<div>
				<blockquote class="blockquote">
					<p class="mb-0"  style="text-align: center;">
						청원하기에 성공하셨습니다.<br>
						해당 청원에 대하여 5명 이상의 동의를 받으면 게시글에 공개됩니다.
					</p>
					<p style="text-align: center;">동의를 얻기 위해서는 아래 url을 복사해서 다른 이와 공유할 수있습니다.</p>
						<div class="col-md-12" style="text-align: center;">
							URL = <input style="width: 600px;" type="text" readonly="readonly" id="inputUrl"
									 value="localhost/petition_board/petitionRead?a_no=${peVo.b_addinfo}&b_serialno=${peVo.b_serialno}">
									 <button type="button" class="btn btn-primary" onclick="copyUrl()">주소 복사</button>
						</div>
				</blockquote>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>