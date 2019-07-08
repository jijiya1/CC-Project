<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>
<style>
div {
	position:relative;
}

.txt_member{
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
	$("#memberDiv").on("click", ".txt_member", function(){
// 		$("#modal-614588").trigger("click");
		var m_email = $(this).attr("data-m_email");
		$("input[name=m_email]").val(m_email);
		var temp=$("input[name=m_email]").val();
		console.log("temp = "+temp);
// 		$("#personForm").submit();
	});
});

</script>

<form id="personForm" action="/person_board/person_minipage">
	<input type="hidden" name="m_email" >
</form>

	<div class="container-fluid">
	
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a> ＞ 의원정보</p>
	
	<!-- 페이지 헤더 -->	
	<h1 class="h3 mb-2 text-gray-800">의원정보</h1>

	<div id="memberDiv">
		<c:forEach items="${memberVoList }" var="memberVo">
			<div class="card" >
<%-- 		  	<img src="\\192.168.0.127/upload_team3/${memberVo.u_photo }"  alt="Avatar" style="width:100%"/> --%>
		  	<img src="/person_board/displayFile?fileName=${memberVo.u_photo }"  alt="Avatar" style="width:100%"/>
		 		<div class="container txt_member" >
		   			<a class="text-name" id="memberName" data-m_email="${memberVo.u_email}" style="font-size:1em;">${memberVo.u_name } </a><br>	   			
		  			<span style="font-size:1em;">${memberVo.u_address } ${memberVo.u_detail }</span><br>
		  			<span style="font-size:1em;">(${memberVo.u_party })</span>
		  		</div>
			</div>	
		</c:forEach>
	</div>
	</div>


<%@include file="../include/footer.jsp" %>