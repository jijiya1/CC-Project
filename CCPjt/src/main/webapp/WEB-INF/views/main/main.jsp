<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<style>
* {box-sizing: border-box;}

.best {
  position: relative;
  width: 50%;
  max-width: 300px;
}

.image {
  display: block;
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute; 
  bottom: 0; 
  background: rgb(0, 0, 0);
  background: rgba(0, 0, 0, 0.5); /* Black see-through */
  color: #f1f1f1; 
  width: 100%;
  transition: .5s ease;
  opacity:0;
  color: white;
  font-size: 20px;
  padding: 20px;
  text-align: center;
}

.best:hover .overlay {
  opacity: 1;
}
</style>

<div class="container-fluid">

<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a></p>

<%@include file="../include/location.jsp" %>
	
	<div class="row">
		<div class="col-md-12"><br></div>
	</div>
	
	<!-- 메인 첫번째 줄 시작 -->
	
	<!-- 공지사항 시작 -->
	<div class="row">
	
		<div class="col-md-1"></div>
		
		<div class="col-md-5">
			
	  <div class="card shadow mb-4">
  	    <div class="card-header py-3">
	      <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>	
	    </div>
	    
	    <div class="card-body">
	      <div class="table-responsive">
	      
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
		      <tbody>
	          <c:forEach items="${ noticeList }" var="noticeList">
	          
	          <c:if test="${ noticeList.b_checkeddel == 0 }">
	            <tr>
	              <td>
	              	<a href="/notice_board/notice_read" class="title" style="float: left;" 
	              	data-b_no="${ noticeList.b_no }" data-a_no="${ noticeList.a_no }">
	              	[${ noticeList.a_name }] ${ noticeList.b_title }&nbsp;
	              	<c:if test="${ noticeList.b_readcount >= 10 }"><img src="/resources/img/hot.gif"></c:if>
	              	</a>
           		  </td>
	              <td><fmt:formatDate value="${ noticeList.b_createddate }" pattern="yyyy-MM-dd"/></td>
	            </tr>
			  </c:if>
           	  </c:forEach>
	          </tbody>
			</table>
		</div>
		</div>
	   </div>
	  </div>
		<!-- 공지사항 끝 -->
		
	</div>
	<!-- 메인 첫번째 줄 끝 -->
	
</div>

<%@include file="../include/footer.jsp" %>