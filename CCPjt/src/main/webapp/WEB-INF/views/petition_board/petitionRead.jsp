<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/head.jsp" %>

<script src="/resources/js/jhjScript.js"></script>


<title>CCPJT - [${ areaDataVo.a_name }] 청원게시판 - ${peVo.b_title}</title>

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
							<td colspan="3">
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
								<label style="font-weight : bold">첨부링크 ${status.index+1} :</label>
								<c:if test="${fn:length(link)>= 8}">
								<a href=
								
									<c:if test="${link.substring(0, 8) != 'https://'}"> 'https://${link}'</c:if>
									<c:if test="${link.substring(0, 8) == 'https://'}"> '${link}'</c:if>>
									
									<c:if test="${link.substring(0, 8) != 'https://'}"> https://${link}</c:if>
									<c:if test="${link.substring(0, 8) == 'https://'}"> ${link}</c:if>
									</a>
								</c:if>
								<c:if test="${fn:length(link)< 8}">
									<input type="text" value="${link}">
								</c:if>
								
							</div>
							</c:forEach>
						</div>
						
					</div>
						
				</div>
				<button  type="button" class="btn btn-primary" data-toggle="tooltip"
					 data-placement="top" title="동의하기" id="btnAgree"><i style='font-size:20px' class='fas fa-child'></i> &nbsp;동의하기</button>
				<button type="button" class="btn btn-success" data-toggle="tooltip"
					 data-placement="top" title="댓글" id="btnReplyList"><span style='font-size:20px' class="fas fas fa-comment"></span></button>
				 <button type="button" class="btn btn-warning" data-toggle="tooltip"
					 data-placement="top" title="목록" id="btnList"><span style='font-size:20px' class="fas fa-list"></span></button>
				<button type="button" class="btn btn-danger" data-toggle="tooltip"
					 data-placement="top" title="삭제" id="btnDel"><span class="fas fa-trash"></span></button>
		</div>
	</div><!-- 전체 글 div class= row -->	
<!-- 댓글 입력	 -->
	<div class="row">
		<div class="col-md-12" id="writeReply">
			<input type="text" name="replyContent" class="col-md-6"
				 <c:if test='${userVo.u_email !=null}'></c:if>
				 <c:if test='${userVo.u_email == null}'> value='로그인을 해야 합니다.'
				 readonly='readonly'</c:if>
				 ><!-- input 댓글 입력란 readonly -->
			<input type="button" value="댓글작성" class="btn btn-primary" id="btnReply">
		</div>
	</div>	
<!-- 		댓글목록 -->
<div class="row">
	<div class="col-md-12">
		<div class="col-md-7" id="listReply" style="font-size:12px;"></div>
		<div class="col-md-5"></div>
	
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
					+ '<table class="table table-bordered" width="600">'
					+ "<thead>"
					+ "<tr>"
					+ "	<td width='20' style='text-align : center' >번호</td>"
					+ "	<td width='15' style='text-align : center'>작성자</td>"
					+ "	<td width='300'  style='border-right: hidden;'>댓글 내용</td>"
					+" <td width='1'></td>"
// 					+ "	<td width='20' style='text-align : center'>작성날짜</td>"
					+ "</tr>"
					+ "</thead>"
					+ "<tbody>";
			$(receivedData).each(function(){
// 				var d = new Date(this.r_createddate).format("yyyy-MM-dd");
				
// 				var date = dateString(this.r_createddate);
// 				console.log(date);
				str += "<tr>"
					+ " <td style='text-align : center' >" + this.rnum + "</td>"
					+ " <td style='text-align : center' ><a href='#' class='a_writer"+this.r_no+"' "
							+ " data-writer='"+this.r_writer+"' data-email='"+this.u_email+"'>"
							+ this.r_writer + "</a></td>"
					
					+ " <td style='border-right: hidden;'>" + this.r_content 
							+ "<span style='color:#FFA387'>&nbsp;&nbsp;&nbsp;&nbsp;"
							+ dateString(this.r_createddate) + "</td><td>";
									if(this.u_email == nowUser){
										//수정버튼
										str += "<button  type='button' value='수정' data-rno='"+this.r_no+"'"
										+" data-b_serialno='"+this.b_serialno+"'"
										+" class='btnMod btn-xs btn-warning'><span class='fas fa-pencil-alt'></span></button>"
										//삭제버튼
										+"&nbsp;&nbsp;"
										+"<button type='button' value='삭제' data-rno='"+this.r_no+"'"
										+" data-b_serialno='"+this.b_serialno+"'"
										+" class='btnDel btn-xs btn-danger'><span class='fas fa-trash'></span></button>"
									}
// 				str += "</td><td style='text-align : center' >" + dateString(this.r_createddate) + "</td>";
//   					+ "<td>" + this.r_createddate + "</td>";
// 					console.log("댓글id :"+ this.u_email);
// 					console.log("접속id :"+ nowUser);
				
					
			});//receivedData
				str += "</tbody>"
					+ "</table>"
					+" </div></div></div>";
			$("#listReply").html(str);		
		});//getJSON(listReply)
	}
	
	
	$("#listReply").on("click",".a_writer", function(e){
// 		console.log("a태그");
		e.preventDefault();
		var writer = $(this).attr("data-writer");
		var email = $(this).attr("data-email");
		var rno = $(this).
		$(".a_writer")
		var str="<input type='text' ><input type='button'>";
	});
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
		
		var b_serialno="${peVo.b_serialno}";
		var replyContent=$("input[name=replyContent]").val();
		var replyerId="${userVo.u_email}";
		var replyerName="${userVo.u_name}";
// 		console.log("b_serialno :"+ b_serialno);
// 		console.log("replyContent :"+ replyContent);
// 		console.log("replyerId :"+ replyerId);
// 		console.log("replyerName :"+ replyerName);
		var data ={
					"b_serialno" : b_serialno,	
					"r_content" : replyContent,	
					"u_email" : replyerId,	
					"r_writer" : replyerName	
					};
		var url = "/pe_ajax/writeReply";
		$.ajax({
			url : url,
			type : "post",
			data : JSON.stringify(data),
			dataType : "text",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
						},
			"success": function(receivedData){
				getListReply()
			}
			
		});
	});
	$("#btnReplyList").click(function(){		
		getListReply()
	});		
			
	$("#btnList").click(function(){		
		location.href="/petition_board/petitionList?a_no=${areaDataVo.a_no}";	
// 		$("#pageForm").submit();	
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