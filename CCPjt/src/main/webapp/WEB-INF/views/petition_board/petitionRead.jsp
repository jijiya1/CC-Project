<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function(){
// 	console.log("${links}")
});
</script>
<title>청원 게시판 읽기</title>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
				<input type="hidden" name="a_no" value="${param.a_no}">
				
					<div class="form-group">
						<div class="col-md-6">
						<table class="table">
							<tr>
								<td colspan="3">
								<label style="font-weight : bold">청원 제목</label>
								<input type="text" class="form-control form-control-sm" name="b_title"
										value="${peVo.b_title}" readonly="readonly" />
								</td>
							</tr>
						<tr>
							<td>
								<label style="font-weight : bold">지역 분류 | </label>
								${peVo.a_name}
	      					</td>
	      					<td>
		      					<label style="font-weight : bold">지역 상세 분류 | </label>
		      					${peVo.d_name}
	      					</td>
	      					<td>
	      						<label style="font-weight : bold">청원 만료일 | </label>
	      						<fmt:formatDate value="${peVo.b_enddate}" pattern="yyyy-MM-dd HH:mm"/>
	      						
	      					</td>
						</tr>
						<tr>
							<td colspan="1">
							<label style="font-weight : bold">청원 진행도 | </label>
							</td>
							<td colspan="2" style="align-items: center;">
									<progress id="myProgress"<c:choose>		
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
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<label style="font-weight : bold">청원 내용</label>
								<textarea rows="20" cols="100" name="b_content" readonly="readonly">${peVo.b_content}</textarea>
<!-- 								<input  type="text" class="form-control form-control-sm" id="b_content"  -->
<!-- 										style ="weight:100px; height: 300px;"/> -->

							</td>
						</tr>
						</table>
						
						<div class="col-md-6">
<%-- 							${Arrays.toString(links)} --%>
							
							<c:forEach items="${links}" var="link" varStatus="status">
								
							<div>
								<label style="font-weight : bold">첨부 ${status.index+1} :</label>
								<a href="#">${link}</a>
							</div>
							</c:forEach>
						</div>
						<!-- <tr >
							<td colspan="3">
								<label style="font-weight : bold">관련 링크</label>
								<table style="width:100%"  id="divLinkGroup">
									
									<tr height= "20">
										<td>
										<label style="font-weight : bold">첨부 1:</label>
										<a href="#">안녕</a>
										</td>
									</tr>
									<tr height= "50">
										<td>
										<label style="font-weight : bold">첨부 2:</label>
										<a href="#">안녕</a>
										</td>
									</tr>
									<tr style="height: 30%">
										<td>
										<label style="font-weight : bold">첨부 3:</label>
										<a href="#">안녕</a>
										</td>
									</tr>
									
									
								</table>
							</td>
						</tr>
					</table> -->
					</div>
						
				</div>
				<button  type="button" class="btn btn-primary" data-toggle="tooltip"
					 data-placement="top" title="동의하기"><i style='font-size:20px' class='fas fa-child'></i> &nbsp;동의하기</button>
				<button type="button" class="btn btn-success" data-toggle="tooltip"
					 data-placement="top" title="댓글목록"><span style='font-size:20px' class="fas fa-list"></span></button>
				<input type="button" value="게시판" class="btn btn-warning" id="btnList">
<input type="button" value="삭제하기" class="btn btn-danger" id="btnDel">
					 
		</div>
	</div>
</div>
<form id="pageForm" action="/petition_board/petitionList?a_no=${areaDataVo.a_no}">			
	<input type="hidden" name="a_no" value="${param.a_no}">		
	<input type="hidden" name="nowPage" value="${param.nowPage}">		
	<input type="hidden" name="countRow" value="${param.countRow}">		
	<input type="hidden" name="searchType" value="${param.searchType}">		
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