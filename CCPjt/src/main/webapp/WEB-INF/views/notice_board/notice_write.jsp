<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<!-- summernote 필수!! - SHJ4359 -->
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script src="/summernote/dist/lang/summernote-ko-KR.js"></script>

<script>
$(document).ready(function() {

	// 목록으로
	$("#btnNoticeBoardList").click(function() {
		location.href = "/notice_board/notice_list";
	});
	
	$("#b_addinfo").change(function(e) {
// 		console.log(e);

// 		var test = e.originalEvent.currentTarget[0];
// 		console.log(test);

		var b_addinfo = $("select[name=b_addinfo]").val();
		
// 		var test = e.originalEvent.currentTarget[0].index;
// 		console.log(test);
		
		var strHtml = "";
		if (b_addinfo == 10) {
			strHtml += "<div class='form-group' style='display: none;'>"
					+  "<label>구</label>"
					+  "<select class='form-control' name='b_detailinfo' id='b_detailinfo' required='required'>"
					+  "<option value='공지'>공지사항</option>"
					+  "</select>"
					+  "</div>";
		} 
		
		else if (b_addinfo == 52) {
			strHtml += "<div class='form-group'>"
					+  "<label>구</label>"
					+  "<select class='form-control' name='b_detailinfo' id='b_detailinfo' required='required'>"
					+  "<option value='10'>중구</option>"
					+  "<option value='11'>남구갑</option>"
					+  "<option value='12'>남구을</option>"
					+  "<option value='13'>동구</option>"
					+  "<option value='14'>북구</option>"
					+  "<option value='15'>울주군</option>"
					+  "</select>"
					+  "</div>";
		}

		else {
			strHtml += "<div class='form-group' style='display: none;'>"
					+  "<label>구</label>"
					+  "<select class='form-control' name='b_detailinfo' id='b_detailinfo' required='required'>"
					+  "<option value='공지'>공지사항</option>"
					+  "</select>"
					+  "</div>";
		}
		$(".test").html(strHtml);
			
		
		$("#b_detailinfo").change(function() {
			var b_detailinfo = $("select[name=b_detailinfo]").val();
			console.log(b_detailinfo);
		});

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
	
});
</script>

<!-- 공지사항 작성 시작 -->
	<div class="container-fluid">
	       
		<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="notice_list">공지사항</a> ＞ 공지사항 작성</p>
		
		<!-- 페이지 헤더 -->
		<h1 class="h3 mb-2 text-gray-800">공지사항 작성</h1><br>
		
		<!-- 공지사항 작성 부분 시작 - form -->
		<form role="form" method="post">
		
			<div class="form-group">
				<label>공지사항 제목</label>
				<input type="text" class="form-control" name="b_title" required="required"/>
			</div>
			
			<div class="form-group">
				<label>작성자</label>
				<input type="text" class="form-control" name="b_writer" required="required" />
			</div>
			
			<div class="form-group">
				<label>ID</label>
				<input type="text" class="form-control" name="u_id" required="required" />
			</div>
			
			<div class="form-group">
				<label>시/도</label>
				<select class="form-control" name="b_addinfo" id="b_addinfo" required="required">
					<c:forEach items="${ areaData }" var="areaData">
						<option value="${ areaData.a_no }">${ areaData.a_name }</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="test">
			<div class="form-group" style="display: none;">
			<label>구</label>
				<select class="form-control " name="b_detailinfo" id="b_detailinfo" required="required">
					<option value="공지">공지사항</option>
				</select>
			</div>
			</div>
			
			<div class="form-group">
				<label>공지사항 내용</label><br>
				  <textarea id="summernote" name="b_content" required="required"></textarea>
				  <script>
				        $('#summernote').summernote({
							lang: 'ko-KR',
				            height: 350,
				            minHeight: null,
				            maxHeight: null,
				            focus: true,
				            onImageUpload : function(files, editor, welEditable) {
				                sendFile(files[0], editor, welEditable);
				            }
				        });
				        var postForm = function() {
				        	var content = $('textarea[name="b_content"]').html($('#summernote').code());
				        }
				        
				        function uploadImage(image) {
				            var data = new FormData();
				            data.append("image", image);
				            $.ajax({
				                type: "post",
				                cache: false,
				                contentType:false,
				                processData: false,
				                dataType :'jsonp',
				                url: '/cop/bbs/insertSummberNoteFile.do',
				                data: data,
				                success: function(data) {
				   				//이미지 경로를 작성하면 됩니다 ^  ^
				                    var image = $('<img>').attr('src', '/cmm/fms/getImage.do?atchFileId='+data[0].atchFileId+'&fileSn=0');
				                    $('#nttCn').summernote("insertNode", image[0]);
				                },
				                error: function(data) {
				                    alert('error : ' +data);
				                }
				            });
				        }

				  </script>
			</div>

			<button type="submit" class="btn btn-primary">작성</button>
<!-- 			<button type="button" class="btn btn-primary" id="test">테스트</button> -->
			<button type="button" class="btn btn-success" id="btnNoticeBoardList">목록</button>
		</form>
		<!-- 공지사항 작성 부분 끝 - form -->

	</div>
	<!-- 공지사항 작성 끝 -->

<%@include file="../include/footer.jsp" %>