<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>
<title>청원 게시판 읽기</title>

${peVo}
<div class="container-fluid">
<div class="row">
<div class="col-md-12" style="text-align: left; margin-left: 20px; line-height:50px">
	<div id="progressStatus">― &nbsp;
	<c:choose>
		<c:when test="${peVo.b_progress == 1}" >사전 동의 진행중</c:when>
		<c:when test="${peVo.b_progress == 2}">청원 시작</c:when>
		<c:when test="${peVo.b_progress == 3}">청원 진행중</c:when>
		<c:when test="${peVo.b_progress == 4}">청원 종료</c:when>
		<c:otherwise>답변 완료</c:otherwise>
	</c:choose>
	&nbsp; ― </div>
	<div> </div>
	<div>
	<h2>${peVo.b_title} -</h2>
	</div>
	<div> 참여인원 : [ ${peVo.b_agree} 명]</div>
	<div><progress id="myProgress"<c:choose>
			<c:when test="${peVo.b_progress == 1}" >value= "0"</c:when>
			<c:when test="${peVo.b_progress == 2}">value= "25"</c:when>
			<c:when test="${peVo.b_progress == 3}">value= "50"</c:when>
			<c:when test="${peVo.b_progress == 4}">value= "75"</c:when>
			<c:otherwise>value= "100"</c:otherwise>
		</c:choose> max="100"></progress>
		
		<c:choose>
			<c:when test="${peVo.b_progress == 1}" >사전 동의 진행중</c:when>
			<c:when test="${peVo.b_progress == 2}">청원 시작</c:when>
			<c:when test="${peVo.b_progress == 3}">청원 진행중</c:when>
			<c:when test="${peVo.b_progress == 4}">청원 종료</c:when>
			<c:otherwise>답변 완료</c:otherwise>
		</c:choose>
		
	</div>
	<div>
		<h5>청원 내용</h5>
		<hr>
		<input type="text" value="${peVo.b_content}" readonly="readonly">
		<hr>
	</div>
	
</div>
	<div>
		<div class="col-md-12" style="text-align: left; margin: 20px; line-height:30px"> 
		<h5>첨부 링크</h5>
			<hr>
			<input type="text" width="50px"><button class="btn btn-success" id="btnAttr">링크 첨부</button>
			<input type="button" value="링크 추가하기"><br>
			<input type="text" width="50px"><button class="btn btn-success" id="btnAttr">링크 첨부</button><br>
			<input type="text" width="50px"><button class="btn btn-success" id="btnAttr">링크 첨부</button><br>
			
		</div>
		<div  class="col-md-12" style="text-align: left; margin-left: 20px; ">
			<input type="button" value="동의하기" class="btn btn-primary">
			<input type="button" value="게시판" class="btn btn-warning">
			<input type="button" value="삭제하기" class="btn btn-danger">
		</div>
	</div>
</div>
</div>
<script>
$(document).ready(function(){
	
	
});
function myFunction() {
  document.getElementById("myProgress").value = "75";
}
</script>
<%@include file="../include/footer.jsp" %>