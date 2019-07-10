<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	
	// 툴팁
	$('[data-toggle="tooltip"]').tooltip();
	
	// 목록으로
	$("#btnSelectBoardList").click(function() {
		var url = "/selectDiscussion/discussion_select_board";
		
		$("#hiddenData").attr("action", url);
		$("#hiddenData").submit();
	});
	
	// 글 수정
	$("#btnUpdate").click(function() {
		var url = "/selectDiscussion/discussion_select_modify";
		
		$("#hiddenData").attr("action", url);
		$("#hiddenData").submit();
	});
	
	// 글 삭제
	$("#btnDelete").click(function() {
		var deleteChoice = confirm("글을 삭제 하시겠습니까?");
		
		if(deleteChoice == true) {
			var url = "/selectDiscussion/discussion_select_delete";
			
			$("#hiddenData").attr("action", url);
			$("#hiddenData").submit();
		} 
	});
	
	
	// 추천 버튼
	$("#btnUpArea").on("click", ".btnUp", function (e) {
		e.preventDefault()
		
		var u_email = "${userVo.u_email}";
		
		if (u_email == null || u_email =="" ) {
			alert("로그인 필요한 서비스 입니다.")
		} else {
			var url = "/selectDiscussion/selectUpcountUpdate";
			var b_no = ${selectDiscussion_BoardVo.b_no};
			
			var sendData = {
					"b_no" : b_no,
					"u_email" : u_email
			};
			
			$.get(url, sendData, function (receviedData) {
				var resCountByEmail = receviedData.resCountByEmail;
				var b_upCount = receviedData.selectBoardUpCount;
				
				var strHtml = "";
				
				strHtml += "<a href='#' class='btn btn-primary btn-sm btnUp' style='text-align: center;";
				if( resCountByEmail >= 1 ) {
					strHtml +=	"border: solid 5px; border-color: #27AE60;";
				};
								
				strHtml += 	"'>"
						+	"<span class='fas fa-thumbs-up'style='font-size: 40px;'>&nbsp;추천&nbsp;"+b_upCount+"</span>"
						+	"</a>";
				
				$("#btnUpArea").html(strHtml);
			});
		};//if
	});// $("#btnUpArea").on("click", ".btnUp"
			
	// 토론 주제로 선정(관리자 권한 userVo.u_grade)
	$("#btnSeletDiscussion").click(function (e) {
		e.preventDefault();
		if(confirm("해당 글을 토론 메인 게시판으로 옮기겠습니까?") == true){
			var url = "/selectDiscussion/seletDiscussion";
			
			$("#hiddenData").attr("action", url);
			$("#hiddenData").submit();

		}//if
	})
});
</script>

	<title>CCPJT - 토론 주제 추천 게시판 - ${areaDataVo.a_name }</title>
	
	<div class="container-fluid">
	
		<!-- 히든 데이터 값 시작 -->
		<form id="hiddenData" action="">
			<input type="hidden" name="nowPage" value ="${pagingDto.nowPage }">
			<input type="hidden" name="a_no" value ="${areaDataVo.a_no }">
			<input type="hidden" name="countRow" value ="${pagingDto.countRow }">
			<input type="hidden" name="searchType" value = "${pagingDto.searchType }">
			<input type="hidden" name="searchKeyword" value = "${pagingDto.searchKeyword }">
			<input type="hidden" name="b_no" value = "${selectDiscussion_BoardVo.b_no}">
			<input type="hidden" name="u_email" value = "${userVo.u_email}">
			<input type="hidden" name="b_writer" value = "${userVo.u_name}">
		</form>
        
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a>＞<a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${areaDataVo.a_name }</a> ＞<a href="/discussion_board/discussion_main_board?a_no=${areaDataVo.a_no }">토론 게시판</a> ＞
		<a href="/selectDiscussion/discussion_select_board?a_no=${areaDataVo.a_no }">토론 주제 추천게시판</a> ＞  [${selectDiscussion_BoardVo.a_name}/${selectDiscussion_BoardVo.d_name}]${selectDiscussion_BoardVo.b_title} 글</p>
	<!-- 페이지 헤더 -->
	<h1 class="h3 mb-2 text-gray-800">[${selectDiscussion_BoardVo.a_name}/${selectDiscussion_BoardVo.d_name}]${selectDiscussion_BoardVo.b_title}</h1><br>
	<!-- 공지사항 읽기 부분 시작 -->
	<div class="card shadow mb-4">
    	<div class="card-body">
    		<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tbody>
						<!-- 작성자 -->
						<tr style="text-align: center;">
							<th scope="row" >작성자</th>
							<td>${selectDiscussion_BoardVo.b_writer}(${selectDiscussion_BoardVo.u_email})</td>
							<th scope="row">작성일</th>
							<td><fmt:formatDate value="${selectDiscussion_BoardVo.b_createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						
						<tr style="text-align: center;">
							<th scope="row">조회수</th>
							<td>${selectDiscussion_BoardVo.b_readCount}</td>
							<!-- 공개여부 -->
							<th scope="row">카테고리</th>
							<td>
								[${selectDiscussion_BoardVo.a_name}/${selectDiscussion_BoardVo.d_name}]지역 토론 주제 추천게시판
							</td>
						</tr>
						<!-- 첨부파일 -->
						<tr style="text-align: center;">
							<th scope="row">첨부파일</th>
							<td colspan="3"><p class="mb5"></p></td>
						</tr>
						
						<!-- 내용 -->
						<tr>
							<td colspan="10" class="content">
								<div id="subjectArea">${selectDiscussion_BoardVo.b_content}</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center;" id ="btnUpArea">

					<a href='#' class="btn btn-primary btn-sm btnUp" style="text-align: center; 
						<c:if test="${resCountByEmail >= 1 && userVo.u_email != null}">
							border: solid 5px; border-color: #27AE60;
						</c:if>
					"><span class='fas fa-thumbs-up'style="font-size: 40px;">&nbsp;추천&nbsp;${selectDiscussion_BoardVo.b_upCount}</span></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 공지사항 읽기 부분 끝 -->
	
	<!-- 하단 버튼 모음 시작 -->
	<button type="button" class="btn btn-success" id="btnSelectBoardList" data-toggle="tooltip" data-placement="top" title="목록"><span class="fas fa-list"></span></button>
	
	<c:if test="${userVo.u_email == selectDiscussion_BoardVo.u_email}">
		<button type="button" class="btn btn-warning" id="btnUpdate" data-toggle="tooltip" data-placement="top" title="수정"><span class="fas fa-pencil-alt"></span></button>
	</c:if>
	<c:if test="${userVo.u_email == selectDiscussion_BoardVo.u_email || userVo.u_grade =='관리자'}">
		<button type="button" class="btn btn-danger" id="btnDelete" data-toggle="tooltip" data-placement="top" title="삭제"><span class="fas fa-trash"></span></button>
	</c:if>
	
	<c:if test="${userVo.u_grade =='관리자' }">
		<a href="#" class="btn btn-success btn-icon-split" id="btnSeletDiscussion" style="float: right;">
			<span class="icon text-white-50"><i class="fas fa-check"></i></span>
			<span class="text">토론 주제로 선정</span>
		</a>
	</c:if>
	<!-- 하단 버튼 모음 끝 -->

</div>
<br>

<%@include file="../include/footer.jsp" %>