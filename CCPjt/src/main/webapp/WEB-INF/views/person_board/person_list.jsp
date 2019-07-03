<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>
<style>
div {
	position:relative;
}

.text-name{
	cursor:pointer;
}

.card {
  float:left;
  margin:50px;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 12%;
}

.card:hover {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 8px;
}

</style>


<script >
$(document).ready(function(){
	$("#memberDiv").on("click", ".text-name", function(){
// 		$("#modal-614588").trigger("click");
		var u_id = $(this).attr("data-u_id");
		console.log("u_id"+u_id);
		$("input[name=u_id]").val(u_id);
		var temp=$("input[name=u_id]").val();
		console.log("temp = "+temp);
		$("#personForm").submit();
	});
});

</script>

<form id="personForm" action="/person_board/person_minipage">
	<input type="hidden" name="u_id" >
</form>

	<div class="container-fluid">
	
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a> ＞ 의원정보</p>
	
	<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800">의원정보</h1>
	
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a style="display:none;" id="modal-614588" href="#modal-container-614588" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-614588" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								상세정보(홍길동)
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<img src="/resources/img/test1.jpg"  alt="Avatar" style="width:100%">
							홍길동(무소속)
							울산 남구청장 (G*)
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary">
								Save changes
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								Close
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
<div id="memberDiv">
	<c:forEach items="${personList }" var="personVo">
		<div class="card" >
	  	<img src="/resources/img/test1.jpg"  alt="Avatar" style="width:100%"/>
	 		<div class="container" >
	   			<a class="text-name" id="memberName" data-u_id="${personVo.u_id}">${personVo.u_name } (${personVo.m_party })</a>
	  			<span>${personVo.m_position } / ${personVo.m_area }</span> 
	  		</div>
		</div>	
	</c:forEach>
</div>


<%@include file="../include/footer.jsp" %>