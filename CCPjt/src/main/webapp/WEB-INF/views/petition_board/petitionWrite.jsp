<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>
<title>청원 하기</title>
<script>
$(document).ready(function(){
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
				$("input[name=b_link]").val("");
				var linkadd = "<input type='text' class='form-control form-control-sm' name='b_linkGroup'"
							+ "value= '"+result+"'>";
				var linkDel = "<br><input type='button' id='btnLink' class='btn btn-danger' value='링크 삭제'>"	
					$("#divLinkGruop").append(linkadd);
					$("#btnDelGruop").append(linkDel);
			}
			
		});
	});
	
});
	
</script>
<form id="pageForm" action="/petition_board/petitionList?a_no=${areaDataVo.a_no}">
	<input type="hidden" name="a_no" value="${param.a_no}">
	<input type="hidden" name="nowPage" value="${param.nowPage} ">
	<input type="hidden" name="countRow" value="${param.countRow} ">
	<input type="hidden" name="searchType" value="${param.searchType} ">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}"> 	
</form>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form">
				<div class="form-group">
					<div class="col-md-6">
					<table class="table">
						<tr>
							<td colspan="3">
								<label>청원 제목</label>
								<input type="text" class="form-control form-control-sm" id="b_title" />
							</td>
						
						</tr>
						<tr>
							<td>
								<label>지역 분류</label>
								<select class="form-control form-control-sm" id="selectAddInfo"
										style="width:150px;">
		      							<option>${areaDataVo.a_name}</option>
		      					</select>
	      					</td>
	      					<td>
		      					<label>지역 상세 분류</label>
		      					<select class="form-control form-control-sm" id="selectAddInfo"
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
								<textarea rows="20" cols="100" ></textarea>
<!-- 								<input  type="text" class="form-control form-control-sm" id="b_content"  -->
<!-- 										style ="weight:100px; height: 300px;"/> -->

							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label>관련 링크</label>
									<div class="form-group row" id="divLinkGruop">
										<input type="text" class="form-control form-control-sm" name="b_link" />
										
									</div>
							</td>
								
							<td style="vertical-align: top">
								<label> &nbsp;</label>
								<div id="btnDelGruop">
									<button type="button" class="btn btn-info" data-toggle="tooltip" data-placement="top" title="링크"><span class="fas fa-link"></span></button>
									
<!-- 									<input type="button" id="btnLink" class="btn btn-info" value="링크 추가"> -->
								</div>
							</td>
						</tr>
					</table>
					</div>
						
				</div>
				
				<button type="submit" class="btn btn-primary">
					청원하기
				</button>
			</form>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>