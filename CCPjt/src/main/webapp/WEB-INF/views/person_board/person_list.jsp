<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>
<style>
div {
	position:relative;
}

.member-data{
	cursor:pointer;
}

.card { 
   float:left; 
   margin:30px; 
   box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); 
   transition: 0.3s; 
   width: 30%; 
} 

.card:hover {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
}

.container {
/*   padding: 2px 8px; */
}

</style>


<script >
$(document).ready(function(){
	$("#memberDiv").on("click", ".member-data", function(){
		var u_email = $(this).attr("data-m_email");
		$("input[name=u_email]").val(u_email);
		$("#personForm").submit();
	});
});

</script>

<form id="personForm" action="/person_board/person_minipage">
	<input type="hidden" name="u_email" >
	<input type="hidden" name="a_no" value="${areaDataVo.a_no }"/>
</form>

<div class="container-fluid">
<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ <a href="/main/sub_main?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=5&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">${ areaDataVo.a_name }</a> ＞ 의원정보</p>
		
<!-- <div class="row"> -->
 	<!-- 페이지 헤더 -->	
<!-- 	<h1 class="h3 mb-2 text-gray-800">의원정보</h1> -->
<!-- 	<br> -->
<!-- 	<div id="memberDiv"> -->
<%-- 		<c:forEach items="${memberVoList }" var="memberVo"> --%>
<!-- 			<div class="card" > -->
<%-- 		 		<img src="/person_board/displayFile?fileName=${memberVo.u_photo }"  alt="Avatar" style="width:100%"/> --%>
<!-- 		 		<div class="container" id="divMem" > -->
<%-- 		   			<a class="text-name txt_member" id="memberName" data-m_email="${memberVo.u_email}" style="font-size:1em;">${memberVo.u_name } <br>	   			 --%>
<%-- 		  			<span style="font-size:1em;">${memberVo.u_address } ${memberVo.u_detail }</span><br> --%>
<%-- 		  			<span style="font-size:1em;">(${memberVo.u_party })</span></a> --%>
<!-- 		  		</div> -->
<!-- 			</div>	 -->
<%-- 		</c:forEach> --%>
<!-- 	</div> -->
<!-- 	</div> -->
<!-- </div> -->
<h1 class="h3 mb-2 text-gray-800">의원정보</h1><br>
	<div class="row" id="memberDiv" >
		<c:forEach items="${memberVoList }" var="memberVo">
			<div class="card member-data" style="width:200px" data-m_email="${memberVo.u_email}">
				<img class="card-img-top" src="/person_board/displayFile?fileName=${memberVo.u_photo }" alt="member_image" style="witdh:100%">
				<div class="card-body" >
					<h4 class="card-title"> ${memberVo.u_name } </h4>
					<span style="font-size:1em;">${memberVo.u_party } / 재선</span><br>
					<span style="font-size:1em;">${memberVo.u_address } ${memberVo.u_detail }</span><br>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<%@include file="../include/footer.jsp" %>