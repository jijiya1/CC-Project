<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<style>
#txtMessage {
    width:600px;     
}

#memberDiv {
	text-align: center;
	backgroud: #fffff;
}

.rdo {
	width:15px;
	height:15px;
	border:1px;
	
}

.form-gruop {
	text-align: center; 
}

.text-margin{
	font-size:200%
}
</style>

<script>
$(document).ready(function(){
	function getPromiseList() {
		var url = "/person_mini/promise_list/${personVo.u_id}";
		$.getJSON(url, function(receivedData) {
			var strHtml = "";
			console.log("receivedData = " +receivedData)
			$(receivedData).each(function(i) {
				// 여기 세션 사용자 아이디로 바까야함 personVo -> 해당 의원정보 session -> 로그인(사용자정보)
				// 여기 세션 사용자 아이디로 바까야함 personVo -> 해당 의원정보 session -> 로그인(사용자정보)
				// 여기 세션 사용자 아이디로 바까야함 personVo -> 해당 의원정보 session -> 로그인(사용자정보)
				// 여기 세션 사용자 아이디로 바까야함 personVo -> 해당 의원정보 session -> 로그인(사용자정보)
				
// 				var u_id = "${personVo.u_id}";
				strHtml += "<tr>"
						+	"<td>" + (i+1) + "</td>"
						+	"<td>" + this.p_name + "</td>"
						+	"<td>"
						+	 "<div class='progress'>"
						+		"<div class='progress-bar w-"+ this.p_progress + "'>"
						+			""+this.p_progress
						+		"</div>"
						+	 "</div>"
						+	"</td>"
						+	"<td>" + this.p_filePath + "</td>"
						+	"<td>"
						+		"<input type='button' class='btn-xs btn-warning' id='btnPromiseModify' value='수정'>"
						+		"<input type='button' class='btn-xs btn-danger' id='btnPromiseDelete' value='삭제'>"
						+	"</td>"
						+ "</tr>"
			});
			$("#promiseList").html(strHtml);
		}); 
	}
	getPromiseList();
	
	$("#btn1").click(function(){
		console.log("btn1클릭");
		$("#ASD").click();
	});
	
	$("#promiseList").on("click", ".btn-warning", function(){
		$("#modal-218300").trigger("click");
		var reply_text = $(this).attr("data-reply_text");
		var replyer = $(this).attr("data-replyer");
		var rno = $(this).attr("data-rno");
		var index = $(this).attr("data-index");
		$("#modal_reply_text").val(reply_text);
		$("#modal_replyer").val(replyer);
		$("#modal_rno").val(rno);
		$("#modal_index").val(index);
	});
	
	$("#btnAddPromise").click(function(){
		$("#modal-562648").trigger("click");
	});
	
	$("#btnAddFile").click(function(){
		$("#addFilePath").trigger("click");
	});
	
	$("#addFilePath").change(function() {
		var filename = this.files[0].name;
		$("#txtFile").text(filename);
	});
	$("#btnModalAdd").click(function(){
		var u_id = "${personVo.u_id}"; 
		var p_name = $("#add_name").val();
		var p_progress = $("[name=add_progress]:checked").val();
		var p_filePath = $("#addFilePath").val();
		console.log(p_name);
		console.log(p_progress);
		console.log(p_filePath);
		var data = {
			"u_id" : u_id,
			"p_name" : p_name,
			"p_progress" : p_progress,
			"p_filePath" : p_filePath
		};
		var url = "/person_mini/promise_insert";
		$.ajax({
			"type" : "put",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method_Override" : "put"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(receivedData){
				$("#btnModalAdd").next().trigger("click");
				getPromiseList();
			}
		});
	});
});


</script>

<!--  입력 다이얼로그 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a style="display:none" id="modal-562648" href="#modal-container-562648" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-562648" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								공약 추가
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="col-md-12">
								<div class="form-group">
									<label for="content">공약명</label>
									<input type="text" class="form-control" id="add_name"/>
								</div>
								<div class="form-group">
									<label for="writer">진행사항</label><br>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-danger">
											<input type="radio" name="add_progress" value="0" id="jb-radio-1"> 파기
										</label>
									</div>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-primary">
											<input type="radio" name="add_progress"  value="25" id="jb-radio-2" checked="checked"> 계획
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="add_progress" value="50" id="jb-radio-3"> 추진
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="add_progress" value="75" id="jb-radio-4"> 진행
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="add_progress" value="100" id="jb-radio-5"> 완료
										</label>
									</div>
								</div>
								<div class="form-grup">
									<label for="file">상세파일</label><br>
									<input style="display:none;" type="file" class="form-control" id="addFilePath" />
									<input type="button" class="btn btn-success" id="btnAddFile" value="파일찾기">
									<span id="txtFile"></span>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-info" id="btnModalAdd" data-dismiss="modal">
								추가하기
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>


<!-- 수정 다이얼로그 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a style="display:none" id="modal-218300" href="#modal-container-218300" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-218300" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								공약 수정
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="hidden" id="modal_pno">
							<input type="hidden" id="modal_index">
							<div class="col-md-12">
								<div class="form-group">
									<label for="content">공약명</label>
									<input type="text" class="form-control" id="modal_reply_text"/>
								</div>
								<div class="form-group">
									<label for="writer">진행사항</label>
									
									<input type="number" min="0" max="100" class="form-control" id="modal_replyer" />
								</div>
								
							</div>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="btnModalModify" data-dismiss="modal">
								수정하기
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>


<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
			<div id="memberDiv">
				<div class="card" >
				  <img src="/resources/img/test1.jpg"  alt="Avatar" style="width:70%; margin-top:20px; margin-left:auto; margin-right:auto;"/>
				 	<div class="col-md-12" >
				   		<a class="text-margin" id="memberName" >${personVo.u_name } (${personVo.m_party })</a>
				  	</div>
				  	<div class="col-md-12" >
				  		<a class="text-margin"> ${personVo.m_area }(울산 중구갑)/ 재선 </a>
				  	</div>
				  	<div class="col-md-12">
					  	<input type="button" class="btn btn-link" value="건의 글 보기" id="member_com"/>
						<input type="button" class="btn btn-link" value="토론 글 보기" id="member_dicussion"/>
						<input type="button" class="btn btn-link" value="후원/모금 글 보기" id="member_donation"/>
				  	</div>
				</div>	
			</div>
		</div>
		<div class="col-md-9">	
	    	<div class="container">
	     		<div class="row">
	        		<div class="col">
	            		<ul class="nav nav-tabs">
	              			<li class="nav-item">
	                			<a class="nav-link" data-toggle="tab" href="#tabs_main" id="menu_main">메인</a>
	              			</li>
	              			<li class="nav-item">
	                			<a class="nav-link active" data-toggle="tab" href="#tabs_promise" id="menu_promise">공약</a>
	              			</li>
	              			<li class="nav-item">
	                			<a class="nav-link" data-toggle="tab" href="#tabs_grade" id="menu_grade">등급</a>
	              			</li>
	              			<li class="nav-item">
	                			<a class="nav-link" data-toggle="tab" href="#tabs_donation" id="menu_domination">후원</a>
	              			</li>
	            		</ul>
 <!-- TAB 내용 -->
 <!-- TAB 내용 -->  	
  	
	           		 <div class="tab-content">
	           		 <!-- TAB 내용1 -->
	           		 	<div class="tab-pane fade " id="tabs_main">
	                		<div class="row">
								<div class="col-md-12">
									<div class="container-fluid">
										<a></a>
										<input type="button" class="btn btn-link" id="btn1" value="바로가기"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<input type="text" class="text" id="txtUserName" >
									<input type="text"  class="text" id="txtMessage" placeholder="응원 메시지를 입력해 주세요." width="300"/>
									<input type="button" class="btn-warning" id="btnMessage" value="입력"/>					
								</div>
								<div class="col-md-12">
									<div class="container-fluid">
										<table class="table">										
											<tbody>
												<tr>
													<td>김철수</td>
													<td>응원합니다.</td>
													<td width="100">
														<input type="button" class="btn-xs btn-danger" id="dtnDel" value="X">
													</td>
													<td width="100">
														<input type="button" class="btn-xs btn-secondary" id="dtnReport" value="신고">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
	              		</div>
	           			<!-- TAB 내용2 -->
	              		<div class="tab-pane fade show active" id="tabs_promise">
	               			 <div class="row">
								<div class="col-md-12">
									<div class="container-fluid">
										<table class="table">
											<thead>
												<tr>
													<th></th>
													<th>공약명</th>
													<th>진행상황</th>
													<th>상세내용</th>
													<th></th>
													<th></th>
												</tr>
											</thead>
											<tbody id="promiseList">
											</tbody>
										</table>
									</div>
									<div class="col-md-12" style="display: inline-block; text-align:center; margin-top:20px;" >
		              					<input type="button" class="btn btn-primary" id="btnAddPromise" value="공약 추가하기" />
		              				</div>	
								</div>
							</div>
						</div>
	           		 	<!-- TAB 내용3 -->
	              		<div class="tab-pane fade" id="tabs_grade">
	               			 <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
	             		</div>
	             		
	           		 	<!-- TAB 내용4 -->
	              		<div class="tab-pane fade" id="tabs_donation">
	              			<div class="col-md-12">
	              				<div class="page-header">
									<h1>
										신한 <small>110-1111-33333</small> 김똘똘
									</h1>
								</div>
	              			</div>
	              			<hr>
	              			<div class="col-md-12" style="margin-top:20px;">
	              				<select>
	              					<option>신한</option>
	              				</select>
	              				<input type="text" class="text" id="txtAccNum" placeholder="계좌번호"/>
	              				<input type="text" class="text" id="txtAccName" placeholder="예금주"/>
	              			</div>
	              			<div class="col-md-12" style="display: inline-block; text-align:center; margin-top:20px;" >
	              				<input type="button" class="btn btn-primary" id="btnAddAcc" value="후원계좌 추가하기" />
	              			</div>
	              			
	             		</div>
	            	</div>
	        	</div>
	      	</div> 
	    </div>
	</div>
</div>
</body>

<%@include file="../include/footer.jsp" %>