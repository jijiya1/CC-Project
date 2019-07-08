<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/head.jsp" %>

<!-- <script src="/resources/js/jhjScript.js"></script> -->


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
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
							<td>
							<label style="font-weight : bold">참여인원 | </label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${peVo.b_agree} 명
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
						
					</div>
						
				</div>
				<button  type="button" class="btn btn-primary" data-toggle="tooltip"
					 data-placement="top" title="동의하기" id="btnAgree"><i style='font-size:20px' class='fas fa-child'></i> &nbsp;동의하기</button>
				<button type="button" class="btn btn-success" data-toggle="tooltip"
					 data-placement="top" title="댓글" id="btnReply"><span style='font-size:20px' class="fas fas fa-comment"></span></button>
				 <button type="button" class="btn btn-warning" data-toggle="tooltip"
					 data-placement="top" title="목록" id="btnList"><span style='font-size:20px' class="fas fa-list"></span></button>
				<button type="button" class="btn btn-danger" data-toggle="tooltip"
					 data-placement="top" title="삭제" id="btnDel"><span class="fas fa-trash"></span></button>
		</div>
	</div><!-- 전체 글 div class= row -->	
<!-- 댓글 입력	 -->
	<div class="row">
		<div class="col-md-12" id="writeReply">
			<input type="text" name="replyVal" class="col-md-8"
				 value=<c:if test='${userVo.u_email !=null}'>'${userVo.u_email}'</c:if>
				 	<c:if test='${userVo.u_email == null}'>'로그인을 해야 합니다.'</c:if>
				 >
			<input type="button" value="댓글작성" class="btn btn-primary">
		</div>
	</div>	
<!-- 		댓글목록 -->
<div class="row">
	<div class="col-md-12" id="listReply">
	
	<br>
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
	function getListReply(){
		var url = "/pe_ajax/listReply/${peVo.b_serialno}";
		$.getJSON(url, function(receivedData){
// 			console.log(receivedData);
			var nowUser = "${userVo.u_email}";
			
			var str = "<br><div class='card shadow mb-4'>"
					+ '<div class="card-body">'
					+ '<div class="table-responsive">' 
					+ '<table class="table table-bordered">'
					+ "<thead>"
					+ "<tr>"
					+ "	<td>번호</td>"
					+ "	<td>댓글 내용</td>"
					+ "	<td>작성자</td>"
					+ "	<td>작성날짜</td>"
					+ "</tr>"
					+ "</thead>"
					+ "<tbody>";
			$(receivedData).each(function(){
// 				var d = new Date(this.r_createddate).format("yyyy-MM-dd");
				
// 				var date = dateString(this.r_createddate);
// 				console.log(date);
				str += "<tr>"
					+ " <td>" + this.rnum + "</td>"
					+ " <td>" + this.r_content + "</td>"
					+ " <td>" + this.r_writer + "</td>"
// 					+ "<td>" + dateString(this.r_createddate) + "</td>";
					+ "<td>" + this.r_createddate + "</td>";
					
			});//receivedData
				str += "</tbody>"
					+ "</table>"
					+" </div></div></div>";
			$("#listReply").html(str);		
		});//getJSON(listReply)
	}
	
	$("#btnAgree").click(function(){		
// 			e.preventDefault();
		var userInfo = '${userVo.u_email}';
			if((userInfo != null) && (userInfo != "")){
				var conAgree = confirm("동의하시겠습니까?");
				if(conAgree == true){
					var url = "/pe_ajax/upAgree";
					var b_serialno = '${peVo.b_serialno}';
					var data={
							"b_serialno" : b_serialno,
							"u_email" : userInfo
							}
					$.ajax({
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "post"
						},
						url : url,
						type : "post",
						data : JSON.stringify(data),
						dataType : "text",
						"success":function(result){
// 							console.log(result);
							alert(result);
						}//success시 function
					});//ajax 괄호
				}//동의했던 이력이 있는지 파악
				
			}else{
				alert("로그인을 해야 동의하실 수 있습니다.");
			}//userInfo null 판단
	});		
			
	$("#btnReply").click(function(){		
		
		getListReply()
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