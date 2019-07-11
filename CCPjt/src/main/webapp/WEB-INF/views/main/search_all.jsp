<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>

<title>CCPJT - 의원 검색</title>

<div class="container-fluid">
	
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ 의원 검색</p>
	
	<h1 class="h3 mb-2 text-gray-800">의원 검색</h1>
	
	<p class="mb-4">
		<span>전체 ${ getSearchMemberCount }명의 의원이 있습니다.</span>
	</p>
	
	<div class="row">
	
	<c:choose>
	
		<c:when test="${ SearchMemberList == '[]' }">
		
			검색된 의원이 없습니다.
			
		</c:when>
		
		<c:otherwise>
			<c:forEach items="${ SearchMemberList }" var="SearchMemberList">
			
				<div class="card member-data" style="width:200px" data-m_email="${ SearchMemberList.u_email}">
					<img class="card-img-top" src="/person_board/displayFile?fileName=${ SearchMemberList.u_photo }" alt="member_image" style="witdh:100%">
					<div class="card-body" >
						<h4 class="card-title"> ${ SearchMemberList.u_name } </h4>
						<span style="font-size:1em;">${ SearchMemberList.u_party } / 재선</span><br>
						<span style="font-size:1em;">${ SearchMemberList.u_address } ${SearchMemberList.u_detail }</span><br>
					</div>
				</div>&nbsp;
			</c:forEach>
		</c:otherwise>
		
		</c:choose>
		</div>
</div>

<%@include file="../include/footer.jsp" %>