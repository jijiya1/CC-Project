<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.grid-container {
  display: grid;
  grid-template-columns: 0.3fr 2.3fr 0.1fr 2fr 0.3fr;
  grid-template-rows: 1fr 1fr;
  grid-template-areas: "blank1 hotContent blank3 location blank5" "blank2 noticeContent blank4 location blank6";
}

.blank1 { grid-area: blank1; }

.blank2 { grid-area: blank2; }

.blank3 { grid-area: blank3; }

.blank4 { grid-area: blank4; }

.blank5 { grid-area: blank5; }

.blank6 { grid-area: blank6; }

.hotContent { grid-area: hotContent; }

.noticeContent { grid-area: noticeContent; }

.location { grid-area: location; }


@media all and (-ms-high-contrast:none) {
  .grid-container {
    display: -ms-grid;
    -ms-grid-columns: 0.3fr 2.5fr 0.1fr 1.8fr 0.3fr;
    -ms-grid-rows: 1fr 1fr;
  }

  .blank1 {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 1;
    -ms-grid-column-span: 1;
  }

  .blank2 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 1;
    -ms-grid-column-span: 1;
  }

  .blank3 {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 3;
    -ms-grid-column-span: 1;
  }

  .blank4 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 3;
    -ms-grid-column-span: 1;
  }

  .blank5 {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 5;
    -ms-grid-column-span: 1;
  }

  .blank6 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 5;
    -ms-grid-column-span: 1;
  }

  .hotContent {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 2;
    -ms-grid-column-span: 1;
  }

  .noticeContent {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 2;
    -ms-grid-column-span: 1;
  }

  .location {
    -ms-grid-row: 1;
    -ms-grid-row-span: 2;
    -ms-grid-column: 4;
    -ms-grid-column-span: 1;
  }

}

</style>

<div class="container-fluid">
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a></p>
</div>

<div class="grid-container">
  <div class="blank1"></div>
  <div class="blank2"></div>
  <div class="blank3"></div>
  <div class="blank4"></div>
  <div class="blank5"></div>
  <div class="blank6"></div>
  
  <div class="hotContent">
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
  
  <div class="noticeContent">
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
  
  <div class="location">
  	<%@include file="../include/main_location.jsp" %>
  </div>
  
</div>

<%@include file="../include/footer.jsp" %>