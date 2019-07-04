<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/head.jsp" %>
<title>청원 게시판 읽기</title>

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
	<h2>${peVo.b_title}</h2>
	</div>
	<div style="size: 50px"> 참여인원 : [ ${peVo.b_agree} 명]</div>
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
	<div>청원 만료 : <fmt:formatDate value="${peVo.b_enddate}" pattern="yyyy-MM-dd HH:mm"/></div>
	<div>
		<h6>청원 내용</h6>
		<hr>
		<input type="text" value="${peVo.b_content}" readonly="readonly">
		<hr>
	</div>
	
</div>
	<div>
		<div class="col-md-12" style="text-align: left; margin: 10px; line-height:30px"> 
		<h6>첨부 링크</h6>
			<hr>
			첨부 링크 1 : &nbsp; <input type="text" width="50px" readonly="readonly"><br>
		</div>
		<div  class="col-md-12" style="text-align: left; margin-left: 20px;">
			<input type="button" value="동의하기" class="btn btn-primary" id="btnAgree">
			<input type="button" value="댓글보기" class="btn btn-info" id="btnReply">
			<input type="button" value="게시판" class="btn btn-warning" id="btnList">
			<input type="button" value="삭제하기" class="btn btn-danger" id="btnDel">
		</div>
	</div>
</div>
</div>
<form id="pageForm" action="/petition_board/petitionList?a_no=${areaDataVo.a_no}">
	<input type="hidden" name="a_no" value="${param.a_no}">
	<input type="hidden" name="nowPage" value="${param.nowPage} ">
	<input type="hidden" name="countRow" value="${param.countRow} ">
	<input type="hidden" name="searchType" value="${param.searchType} ">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}"> 	
</form>
<script>
$(document).ready(function(){
	$("#btnAgree").click(function(){
		
	});
	
	$("#btnReply").click(function(){
		
	});
	
	$("#btnList").click(function(){
// 		location.href="/petition_board/petitionList?a_no=${areaDataVo.a_no}";
		$("#pageForm").submit();
	});
	$("#btnDel").click(function(){
		var conDel = confirm("정말 삭제하시겠습니까?");
		if(conDel == true){
			location.href="/petition_board/petitionDel?a_no=${areaDataVo.a_no}&b_serialno=${peVo.b_serialno}";
		}
		
	});
});

</script>
<%@include file="../include/footer.jsp" %>