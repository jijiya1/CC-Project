<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function(){
	var i="0";
	$("#btnLink").click(function(){
		var links =$("input[name=b_link]").val();
		var url ="/pe_ajax/uploadLink";
		$.ajax({
			headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
			url : url,
			data : JSON.stringify(links),
			dataType : "text",
			type : "post",
			
			"success":function(result){
				
// 				console.log(result);
				$("input[name=b_link]").val("");
				var linkadd = "<tr class='"+i+"'>"
								+ "<td colspan='2'>"
									+ "<input type='text' class='form-control form-control-sm table-input'" 
									+ " data-link='"+i+"' value ='"+result+"'/></td>"
								+ "<td>"
									+"<button type='button' class='btn btn-danger deleteLink'"
									+" data-toggle='tooltip' data-placement='top' title='링크 삭제'"
									+" data-link='"+i+"'>"
										+ "<span class='fas fa-trash'></span>"
									+"</button>"
								+"</td>"
								+ "</tr>";
					$("#divLinkGroup").append(linkadd);
// 					var hiddenLink = "<input type='hidden' name='link["+i+"]'"
// 										+" value='"+result+"'>";
// 					$("#registForm").append(hiddenLink);	

					i++;
			}
			
		});//ajax 링크 추가
	});//btnLink function
	
	//링크 그룹 삭제하기
	$("#divLinkGroup").on("click",".deleteLink", function(e){
		e.preventDefault();
		var that = $(this);
		var result = $(this).attr("data-link");
// 		console.log("that?" +that );
// 		console.log("result?" +result );
		that.parents("."+result).remove();
// 		$("input[name=link["+result+"]").remove();
		
	});
	
	//글 작성 보내기
	$("#btnSubmit").click(function(){
		var linkGroup = $("#divLinkGroup .table-input");
// 		console.log("linkGroup"+ linkGroup);
			linkGroup.each(function(index){
			var link =$(this).attr("data-link");
			var result = $(this).attr("value");
// 			console.log("result :"+ result);
			var hiddenLink = "<input type='hidden' name='link["+link+"]'"
							+" value='"+ result+"'>";
// 			console.log("hiddenLink :"+ hiddenLink);
				$("#registForm").append(hiddenLink);	
				
		});

		$("#registForm").submit();
// 		console.log($("#divLinkGroup .table-input"));
	});
	
	
});
	
</script>

<title>CCPJT - [${ areaDataVo.a_name }] 청원하기</title>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" method="post" id="registForm" action="/petition_board/petitionWrite">
				<input type="hidden" name="a_no" value="${param.a_no}">
				
				<div class="form-group">
					<div class="col-md-6">
					<table class="table">
						<tr>
							<td colspan="3">
								<label>청원 제목</label>
								<input type="text" class="form-control form-control-sm" name="b_title" />
							</td>
						
						</tr>
						<tr>
							<td>
								<label>지역 분류</label>
								<select class="form-control form-control-sm"  name="b_addinfo"
										style="width:150px;">
		      							<option value="${areaDataVo.a_no}">${areaDataVo.a_name}</option>
		      					</select>
	      					</td>
	      					<td>
		      					<label>지역 상세 분류</label>
		      					<select class="form-control form-control-sm" name="b_detailinfo"
									style="width:150px;">
									<c:forEach items="${ dArea }" var="detailVo">
										<option value="${detailVo.d_no}">${detailVo.d_name}</option>
									</c:forEach>
	      							
	      						</select>
	      					</td>
	      					<td></td>
						</tr>
						<tr>
							<td colspan="3">
								<label>청원 내용</label>
								<textarea rows="20" cols="100" name="b_content"></textarea>
<!-- 								<input  type="text" class="form-control form-control-sm" id="b_content"  -->
<!-- 										style ="weight:100px; height: 300px;"/> -->

							</td>
						</tr>
						<tr >
							<td colspan="3">
								<label>관련 링크</label>
								<table style="width:100%"  id="divLinkGroup">
									<tr>
										<td colspan="2"><input type="text" class="form-control form-control-sm" name="b_link" /></td>
										<td><button type="button" class="btn btn-info" data-toggle="tooltip"
										 data-placement="top" title="링크" id="btnLink"><span class="fas fa-link"></span></button></td>
									</tr>
									
								</table>
							</td>
						</tr>
					</table>
					</div>
						
				</div>
				
				<button type="button" class="btn btn-primary" id="btnSubmit">
					청원하기
				</button>
			</form>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>