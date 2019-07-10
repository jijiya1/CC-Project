<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<!-- summernote 필수!! - SHJ4359 -->
<!-- include summernote css/js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/summernote/dist/lang/summernote-ko-KR.js"></script>

<script>
$(document).ready(function() {
	
	// 툴팁
	$('[data-toggle="tooltip"]').tooltip();
	
	// 목록으로
	$("#btnNoticeBoardList").click(function() {
		location.href = "/notice_board/notice_list?a_no=${ areaDataVo.a_no }&searchType=b_addinfo&keyword=${ areaDataVo.a_no }";
	});
	
	// 테스트
// 	$("#test").click(function() {
// 		var b_title = $("input[name=b_title]").val();
// 		console.log(b_title);
// 		var b_write = $("input[name=b_write]").val();
// 		console.log(b_write);
// 		var u_id = $("input[name=u_id]").val();
// 		console.log(u_id);
// 		var b_addinfo = $("select[name=b_addinfo]").val();
// 		console.log(b_addinfo);
// 		var b_detailinfo = $("select[name=b_detailinfo]").val();
// 		console.log(b_detailinfo);
// 		var name_b_content = $("textarea[name=b_content]").val();
// 		console.log(name_b_content);
// 		var b_content = $("#summernote").val();
// 		console.log(b_content);
// 	});
	
// 	$("#b_addinfo").change(function(e) {
// 		console.log(e);

// 		var test = e.originalEvent.currentTarget[0];
// 		console.log(test);

// 		var b_addinfo = $("select[name=b_addinfo]").val();
		
// 		var test = e.originalEvent.currentTarget[0].index;
// 		console.log(test);
		
// 		var strHtml = "";
// 		if (b_addinfo == 10) {
// 			strHtml += "<div class='form-group' style='display: none;'>"
// 					+  "<label>구</label>"
// 					+  "<select class='form-control' name='b_detailinfo' id='b_detailinfo' required='required'>"
// 					+  "<option value='공지'>공지사항</option>"
// 					+  "</select>"
// 					+  "</div>";
// 		} 
		
// 		else if (b_addinfo == 52) {
// 			strHtml += "<div class='form-group'>"
// 					+  "<label>구</label>"
// 					+  "<select class='form-control' name='b_detailinfo' id='b_detailinfo' required='required'>"
// 					+  "<option value='10'>중구</option>"
// 					+  "<option value='11'>남구갑</option>"
// 					+  "<option value='12'>남구을</option>"
// 					+  "<option value='13'>동구</option>"
// 					+  "<option value='14'>북구</option>"
// 					+  "<option value='15'>울주군</option>"
// 					+  "</select>"
// 					+  "</div>";
// 		}

// 		else {
// 			strHtml += "<div class='form-group' style='display: none;'>"
// 					+  "<label>구</label>"
// 					+  "<select class='form-control' name='b_detailinfo' id='b_detailinfo' required='required'>"
// 					+  "<option value='공지'>공지사항</option>"
// 					+  "</select>"
// 					+  "</div>";
// 		}
// 		$(".test").html(strHtml);
			
		
// 		$("#b_detailinfo").change(function() {
// 			var b_detailinfo = $("select[name=b_detailinfo]").val();
// 			console.log(b_detailinfo);
// 		});
// 	});
	
});
</script>

<title>CCPJT - [${ areaDataVo.a_name}] ${ noticeBoardVo.b_title } - 수정</title>

<!-- 공지사항 수정 시작 -->
	<div class="container-fluid">
	        
		<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a> ＞ <a href="/notice_board/notice_list?a_no=${ areaDataVo.a_no }&searchType=b_addinfo&keyword=${ areaDataVo.a_no}">공지사항</a> ＞ <a href="notice_read?b_no=${ noticeBoardVo.b_no }&a_no=${ noticeBoardVo.a_no }">${ noticeBoardVo.b_title }</a> ＞ 공지사항 수정</p>
		
		<!-- 페이지 헤더 -->
		<h1 class="h3 mb-2 text-gray-800">공지사항 수정</h1><br>
		
		<!-- 공지사항 수정 부분 시작 - form -->
		<form role="form" method="post">
			<input type="hidden" name="u_email" value="${ userVo.u_email }">
			<input type="hidden" name="u_name" value="${ userVo.u_name }">
		
			<div class="form-group">
				<label>공지사항 제목</label>
				<input type="text" class="form-control" name="b_title" value="${ noticeBoardVo.b_title }"/>
			</div>
			
			<div class="form-group" <c:if test="${ areaDataVo.a_no eq a_no }">style="display: none;"</c:if>>
				<label>시/도</label>
				<select class="form-control" name="b_addinfo" id="b_addinfo" required="required">
					<c:forEach items="${ areaData }" var="areaData">
						<option value="${ areaData.a_no }" <c:if test='${ areaData.a_no eq a_no }'>selected</c:if>>${ areaData.a_name }</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group">
				<label>구</label>
				<select class='form-control' name='b_detailinfo' id='b_detailinfo' required='required'>
					<c:forEach items='${getDetailAreaData}' var='detailAreaData'>
						<option value='${detailAreaData.d_no}'>${detailAreaData.d_name}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group">
				<label>공지사항 내용</label><br>
				  <textarea id="summernote" name="b_content">${ noticeBoardVo.b_content }</textarea>
				  <script>
				        $('#summernote').summernote({
							lang: 'ko-KR',
				            height: 350,
				            minHeight: null,
				            maxHeight: null,
				            focus: true  
				        });
				        var postForm = function() {
				        	var content = $('textarea[name="b_content"]').html($('#summernote').code());
				        }
				  </script>
			</div>

			<button type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="수정"><span class="fas fa-check"></span></button>
<!-- 			<button type="button" class="btn btn-primary" id="test">테스트</button> -->
			<button type="button" class="btn btn-success" id="btnNoticeBoardList" data-toggle="tooltip" data-placement="top" title="목록"><span class="fas fa-list"></span></button>
		</form>
		<!-- 공지사항 수정 부분 끝 - form -->
	</div>
	<!-- 공지사항 수정 끝 -->
	<div><br></div>

<%@include file="../include/footer.jsp" %>