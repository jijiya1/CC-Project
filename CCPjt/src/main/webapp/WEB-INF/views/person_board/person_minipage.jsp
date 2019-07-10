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
	var assem_name = '20대';
	var assem_no = 20;
	function getPromiseList() {
		var u_email = "${memberSelectedVo.u_email}";
		var url = "/person_mini/promise_list";
		var data = {
				"u_email" : u_email
		};
		$.ajax({
			"type" : 'get',
			"url" : url,
			"data" : data,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overried" : "get"
			},
			"success" : function(receivedData){
				var strHtml = "";
				$(receivedData).each(function(i) {
					if(assem_no==this.assem_no){
					strHtml += "<tr>"
							+	"<td></td>"
							+	"<td>" + this.p_name + "</td>"
							+	"<td>"
							+	"<div class='progress'>"
							if(this.p_progress==0){
								strHtml+=	"<div class='progress-bar w-100'style='background-color:red'> 파기"
							}else{
								strHtml+=   "<div class='progress-bar w-"+ this.p_progress + "'> "+this.p_progress+"%"
							}	
							+	"</div>"
							+	"</div>"
							+	"</td>"
							+	"<td>"
							+	"<a href='/person_mini/downloadFile?fileName="+this.p_filepath+"'><button type='button' class='btn btn-success' data-toggle='tooltip' data-placement='center' title='다운로드'><span class='fas fa-file'></span></button></a><br>"
							+	"</td>"
							if(${userVo.u_email=='admin' || memberSelectedVo.u_email==userVo.u_email}){
								strHtml+=	"<td>"
							+		"<button style='margin-right:5px;' type='button' class='btn btn-warning' data-toggle='tooltip' data-placement='top' title='수정'"
							+		"data-p_no='"+this.p_no+"'"
							+		"data-p_name='"+this.p_name+"' "
							+		"data-p_progress='"+this.p_progress+"' "
							+		"data_p_filepath='"+this.p_filepath+"' "
							+		"data-index='"+i+"'><span class='fas fa-pencil-alt'></span></button>"
							+		"<button type='button' class='btn btn-danger' data-toggle='tooltip' data-placement='top' title='삭제'"
							+		"data-p_no='"+this.p_no+"'"
							+		"data-u_email='"+this.u_email+"'"
							+		"><span class='fas fa-trash'></span></button>"
							+	"</td>"
							}
							+ "</tr>"
					}
				});
				$("#promiseList").html(strHtml);
			}
		});  
	}
	function getAccountList() {
		var u_email = "${memberSelectedVo.u_email}";
		var url = "/person_mini/account_list";
		var data = {
				"u_email" : u_email
		};
		$.ajax({
			"type" : 'get',
			"url" : url,
			"data" : data,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overried" : "get"
			},
			"success" : function(receivedData){
				var strHtml = "";
				$(receivedData).each(function(i) {
					strHtml += "<div class='row' style='margin:10px'>"
							+ "<a href='"+this.acc_page+"'>" 
// 							+ "<div class='col-xl-3 col-md-3 mb-3'>"
// 						    + "<div class='card border-left-primary shadow h-100 py-2'>"
// 						    + "<div class='card-body'>"
// 						    + "<div class='row no-gutters align-items-center'>"
// 					        + "<div class='col mr-12'>"
					        + "<p class='text font-weight-bold text-primary text-uppercase mb-1'>"+this.bank+"</p>"
					        + "<p class='h5 mb-0 font-weight-bold text-gray-800'>"+this.acc_num+"</p>"
					        + "<p class='text font-weight-bold text-gray-800 text-uppercase mb-1'>"+this.acc_name+"</p>"
// 					        + "</div>"
// 					        + "</div>"
// 					        + "</div>"
// 					        + "</div>"
// 					        + "</div>"
					        + "</a>"
					        + "</div>"
					        + "<hr>"
							if(${userVo.u_email=='admin' || memberSelectedVo.u_email==userVo.u_email }){
								strHtml+=	"<button type='button'  style='margin:5px' class='btn btn-danger' data-toggle='tooltip' data-placement='top' title='삭제'"
										+	"data-acc_num='"+this.acc_num+"'"
										+	"data-u_email='"+this.u_email+"'"
										+	"><span class='fas fa-trash'></span></button>"
							}
				});
				$("#accList").html(strHtml);
			}
		});
	}

  	
	
	getPromiseList();
	getAccountList();
	
	$("#divPromiseAll").on("click", ".assem-list", function(){
		assem_name = $(this).val();
		assem_no = $(this).attr("data-assemno");
		getPromiseList()
	});
	
	
	$("#promiseList").on("click", ".btn-warning", function(){
		$("#modal-218300").trigger("click");
		
		var p_no = $(this).attr("data-p_no");
		var p_name = $(this).attr("data-p_name");
		var p_progress = $(this).attr("data-p_progress");
		var p_filepath = $(this).attr("data_p_filepath");
		var index = $(this).attr("data-index");
		
		var underbar = p_filepath.lastIndexOf('_')+1;
		var filename = p_filepath.substring(underbar);
		
		$("#txtModalFile").text(filename);
		
		$("#modal_p_no").val(p_no);
		$("#modal_p_name").val(p_name);
		$('input:radio[name=modal_p_progress]').attr("checked", false);
		$('input:radio[name=modal_p_progress]:input[value=' + p_progress + ']').attr("checked", true);
		$("#modal_index").val(index);
		$("#file_path").val(p_filepath);
	});
	
	$("#btnAddPromise").click(function(){
		$("#modal-562648").trigger("click");
	});
	
	$("#btnAddFile").click(function(){
		$("#addFilePath").trigger("click");
	});
	$("#btnAddAccount").click(function(){
		$("#modal-56727").trigger("click");
	})
	$("#btnModalFile").click(function(){
		$("#modalFilePath").trigger("click");
	});
	
	$("#addFilePath").change(function() {
		var filename = this.files[0].name;
		$("#txtFile").text(filename);
	});
	$("#modalFilePath").change(function() {
		var filename = this.files[0].name;
		$("#txtModalFile").text(filename);
	});
	$("#btnModalAdd").click(function(){
		var u_email = "${memberSelectedVo.u_email}"; 
		var p_name = $("#add_name").val();
		var p_progress = $("[name=add_progress]:checked").val();
		var filePath = $("input[name=addFilePath]")[0].files[0];
		console.log("filePath :" +filePath);
		var formData = new FormData();
		formData.append("u_email", u_email);
		formData.append("p_name", p_name);
		formData.append("p_progress", p_progress);
		formData.append("file", filePath);
		var url ="/person_mini/promise_insert";
		$.ajax({
			url: url,
			processData: false,
            contentType: false,		
            data: formData,
            type: "post",
			success : function(receivedData){
				$("#btnModalAdd").next().trigger("click");
		 		getPromiseList();			
			}
		});
	});
	

	$("#promiseList").on("click", ".btn-danger", function(){
		var u_email = $(this).attr("data-u_email");
		var p_no = $(this).attr("data-p_no");
		var url = "/person_mini/promise_delete/" + u_email + "/" + p_no;
		$.ajax({
			"type" : 'delete',
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overried" : "delete"
			},
			"success" : function(receivedData) {
				if (receivedData == "success") {
	 				getPromiseList();
					$("#replyList > tr").eq(index).fadeOut("1000");
				}
			}
		});
	});
	
	
	$("#btnModalModify").click(function(){
		var u_email = "${memberSelectedVo.u_email}"; 
		var p_name = $("#modal_p_name").val();
		var p_progress = $("[name=modal_p_progress]:checked").val();
		var checkVal = $("input[name=modalFilePath]")[0].files[0];
		var p_no = $("#modal_p_no").val();
		var checkFile = 0;
		var p_filepath;
		var path = $("#file_path").val();
		
		if(checkVal=="" || checkVal==null){
			p_filepath = $("#file_path").val();
			checkFile = 0;
		}else{
			p_filepath = checkVal;
			checkFile = 1;
		}
		
		var data = {
			"p_no" : p_no,
			"u_email" : u_email,
			"p_name" : p_name,
			"p_progress" : p_progress,
			"p_filepath" : p_filepath,
			"checkFile" : checkFile
		};
		
		var url = "/person_mini/promise_update";
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
				$("#btnModalModify").next().trigger("click");
				getPromiseList();
			}
		});
	});
	
	//계좌추가
	$("#btnModalAcc").click(function(){
		var u_email = "${memberSelectedVo.u_email}"; 
		var bank = $("#modal_bank").val();
		var acc_num = $("#modal_accnum").val();
		var acc_name = $("#modal_accname").val();
		var data = {
			"bank" : bank,
			"u_email" : u_email,
			"acc_num" : acc_num,
			"acc_name" : acc_name
		};
		
		var url = "/person_mini/account_insert";
		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method_Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(receivedData){
				$("#btnModalAcc").next().trigger("click");
				getAccountList();
			}
		});
	});
	//계좌 삭제
	$("#accList").on("click", ".btn-danger", function(){
		var u_email = $(this).attr("data-u_email");
		var acc_num = $(this).attr("data-acc_num");
		var url = "/person_mini/account_delete/" + u_email + "/" + acc_num;
		$.ajax({
			"type" : 'delete',
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overried" : "delete"
			},
			"success" : function(receivedData) {
				if (receivedData == "success") {
	 				getAccountList();
				}
			}
		});
	});
	
});

</script>


<!--  입력 다이얼로그 -->
<div class="container-fluid">
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a>
	 ＞ <a href="/person_board/person_list?a_no=${areaDataVo.a_no}">의원정보</a> ＞ ${memberSelectedVo.u_name} </p>
		

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
								<form action="" id="fileForm" method="post" enctype="multipart/form-data">
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
										<input style="display:none;" type="file" class="form-control" id="addFilePath" name="addFilePath"/>
										<input type="button" class="btn btn-success" id="btnAddFile" value="파일찾기">
										<span id="txtFile"></span>
									</div>
								</form>
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


<!-- 수정 다이얼로그 -->
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
							<form id="fileUpdateForm" method="post" enctype="multipart/form-data">
								<input type="hidden" id="modal_index">
								<input type="hidden" id="modal_p_no">
								<input type="hidden" id="file_path">
								<div class="col-md-12">
									<div class="form-group">
										<label for="content">공약명</label>
										<input type="text" class="form-control" id="modal_p_name"/>
									</div>
									<div class="form-group">
										<label for="writer">진행사항</label><br>
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-danger">
												<input type="radio" name="modal_p_progress" value="0" id="jb-radio-1"> 파기
											</label>
										</div>
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-primary">
												<input type="radio" name="modal_p_progress"  value="25" id="jb-radio-2" checked="checked"> 계획
											</label>
											<label class="btn btn-primary">
												<input type="radio" name="modal_p_progress" value="50" id="jb-radio-3"> 추진
											</label>
											<label class="btn btn-primary">
												<input type="radio" name="modal_p_progress" value="75" id="jb-radio-4"> 진행
											</label>
											<label class="btn btn-primary">
												<input type="radio" name="modal_p_progress" value="100" id="jb-radio-5"> 완료
											</label>
										</div>
									</div>
									<div class="form-grup">
										<label for="file">상세파일</label><br>
										<input style="display:none;" type="file" class="form-control" id="modalFilePath" name="modalFilePath" />
										<input type="button" class="btn btn-success" id="btnModalFile" value="파일찾기">
										<span id="txtModalFile"></span>
									</div>
								</div>
							</form>
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

<!-- 계좌입력 다이얼로그 -->
	<div class="row">
		<div class="col-md-12">
			 <a style="display:none" id="modal-56727" href="#modal-container-56727" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-56727" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								계좌 입력
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="content">은행</label>
		                    	<select id="modal_bank" name="modal_bank" class="form-control form-control-user">
					 				<option value='은행' selected>은행</option>
									<option value='신한은행'>신한은행</option>
								    <option value='KB국민은행'>KB국민은행</option>
								    <option value='우리은행'>우리은행</option>
								    <option value='KEB하나은행'>KEB하나은행</option>
								    <option value='NH농협은행'>NH농협은행</option>
								    <option value='카카오뱅크'>'카카오뱅크'</option>
								</select>
							</div>
							<div class="form-group">
								<label for="content">계좌번호</label>
								<input type="text" class="form-control" id="modal_accnum"/>
							</div>
							<div class="form-group">
								<label for="content">계좌주</label>
								<input type="text" class="form-control" id="modal_accname"/>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btnModalAcc" data-dismiss="modal">
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


<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
			<div id="memberDiv">
				<div class="card" >
				  <img src="/person_board/displayFile?fileName=${memberSelectedVo.u_photo }"  alt="Avatar" style="width:70%; margin-top:20px; margin-left:auto; margin-right:auto;"/>
				 	<div class="col-md-12" >
				   		<a class="text-margin" id="memberName" >${memberSelectedVo.u_name } (${memberSelectedVo.u_party })</a>
				  	</div>
				  	<div class="col-md-12" >
				  		<a class="text-margin"> ${memberSelectedVo.u_address } ${memberSelectedVo.u_detail } / ${election_name} </a>
				  	</div>
<!-- 				  	<div class="col-md-12"> -->
<!-- 					  	<input type="button" class="btn btn-link" value="건의 글 보기" id="member_com"/> -->
<!-- 						<input type="button" class="btn btn-link" value="토론 글 보기" id="member_dicussion"/> -->
<!-- 				  	</div> -->
				</div>	
			</div>
		</div>
		<div class="col-md-9">	
	    	<div class="container">
	     		<div class="row">
	        		<div class="col">
	            		<ul class="nav nav-tabs">
	              			<li class="nav-item">
	                			<a class="nav-link active" data-toggle="tab" href="#tabs_promise" id="menu_promise">공약</a>
	              			</li>
	              			<li class="nav-item">
	                			<a class="nav-link" data-toggle="tab" href="#tabs_donation" id="menu_domination">후원</a>
	              			</li>
	            		</ul>
 <!-- TAB 내용 -->
 <!-- TAB 내용  	 -->
  	
	           		 <div class="tab-content">
<!-- 	           			TAB 내용2 -->
	              		<div class="tab-pane fade show active" id="tabs_promise">
	               			 <div class="row">
								<div class="col-md-12" id="divPromiseAll">
									<c:forEach items="${assemVoList}" var="assemVo" varStatus="i" >
										<input type="button" class="btn btn-link assem-list" data-assemno="${assemVo.assem_no }" value="${assemVo.assem_name }"/>
									</c:forEach>
									<div class="container-fluid">
										<table class="table">
											<thead>
												<tr>
													<th></th>
													<th>공약명</th>
													<th>진행상황</th>
													<th>내용</th>
													<th></th>
													<th></th>
												</tr>
											</thead>
											<tbody id="promiseList">
											</tbody>
										</table>
									</div>
	              					<c:if test="${userVo.u_email=='admin' || memberSelectedVo.u_email==userVo.u_email}">
										<div class="col-md-12" style="display: inline-block; text-align:center; margin-top:20px;" >
			              					<input style="margin:10px;" type="button" class="btn btn-primary" id="btnAddPromise" value="공약 추가하기" />
			              				</div>	
			              			</c:if>
								</div>
							</div>
						</div>
<!-- 	           		 	TAB 내용4 -->
	              		<div class="tab-pane fade" id="tabs_donation">
	              			<div class="col-md-12">
	              				<div class="col-md-3" id="accList">
							  	</div>
	              			</div>
	              			<c:if test="${userVo.u_email=='admin' || memberSelectedVo.u_email==userVo.u_email}">
		              			<hr>
		              			<div class="col-md-12" style="display: inline-block; text-align:center; margin-top:20px;" >
			              			<input type="button" class="btn btn-primary" id="btnAddAccount" value="계좌 추가하기" />
			              		</div>
		              		</c:if>
	             		</div>
							
	            	</div>
	        		</div>
	      		</div> 
	    	</div>
		</div>
	</div>
</div>
</div>

<%@include file="../include/footer.jsp" %>