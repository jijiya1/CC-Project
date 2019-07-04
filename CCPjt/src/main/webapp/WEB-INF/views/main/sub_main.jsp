<%@page import="com.kh.domain.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<style>
.grid-container {
  display: grid;
  grid-template-columns: 0.3fr 2.3fr 0.1fr 2.3fr 0.3fr;
  grid-template-rows: 1fr 1fr 1fr;
  grid-template-areas: "blank01 noticeBoard noticeBoard noticeBoard blank04" "blank02 board01 blank07 board02 blank05" "blank03 board03 blank07 board04 blank06";
}

.noticeBoard { grid-area: noticeBoard; }

.board01 { grid-area: board01; }

.board02 { grid-area: board02; }

.board03 { grid-area: board03; }

.board04 { grid-area: board04; }

.blank01 { grid-area: blank01; }

.blank02 { grid-area: blank02; }

.blank03 { grid-area: blank03; }

.blank04 { grid-area: blank04; }

.blank05 { grid-area: blank05; }

.blank06 { grid-area: blank06; }

.blank07 { grid-area: blank07; }


@media all and (-ms-high-contrast:none) {
  .grid-container {
    display: -ms-grid;
    -ms-grid-columns: 0.3fr 2.3fr 0.1fr 2.3fr 0.3fr;
    -ms-grid-rows: 1fr 1fr 1fr;
  }

  .noticeBoard {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 2;
    -ms-grid-column-span: 3;
  }

  .board01 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 2;
    -ms-grid-column-span: 1;
  }

  .board02 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 4;
    -ms-grid-column-span: 1;
  }

  .board03 {
    -ms-grid-row: 3;
    -ms-grid-row-span: 1;
    -ms-grid-column: 2;
    -ms-grid-column-span: 1;
  }

  .board04 {
    -ms-grid-row: 3;
    -ms-grid-row-span: 1;
    -ms-grid-column: 4;
    -ms-grid-column-span: 1;
  }

  .blank01 {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 1;
    -ms-grid-column-span: 1;
  }

  .blank02 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 1;
    -ms-grid-column-span: 1;
  }

  .blank03 {
    -ms-grid-row: 3;
    -ms-grid-row-span: 1;
    -ms-grid-column: 1;
    -ms-grid-column-span: 1;
  }

  .blank04 {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 5;
    -ms-grid-column-span: 1;
  }

  .blank05 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 5;
    -ms-grid-column-span: 1;
  }

  .blank06 {
    -ms-grid-row: 3;
    -ms-grid-row-span: 1;
    -ms-grid-column: 5;
    -ms-grid-column-span: 1;
  }

  .blank07 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 2;
    -ms-grid-column: 3;
    -ms-grid-column-span: 1;
  }

}

/* Slideshow container */
.slideshow-container {
  position: relative;
  background: #f1f1f1f1;
}

/* Slides */
.mySlides {
  display: none;
  padding: 67.5px;
  text-align: center;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -30px;
  padding: 16px;
  color: #888;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  position: absolute;
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
  color: white;
}

/* The dot/bullet/indicator container */
.dot-container {
    text-align: center;
    padding: 20px;
    background: #ddd;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

/* Add a background color to the active dot/circle */
.dactive, .dot:hover {
  background-color: #717171;
}

/* Add an italic font style to all quotes */
q {font-style: italic;}

/* Add a blue color to the author */
.author {color: cornflowerblue;}

</style>

<script>
$(document).ready(function() {
	
	// 툴팁
	$('[data-toggle="tooltip"]').tooltip();
	
	 // 공지사항 글 읽기
	 $(".title").click(function(e) {
		e.preventDefault();
		
		var b_no = $(this).attr("data-b_no");
		$("input[name=b_no]").val(b_no);
		var a_no = $(this).attr("data-a_no");
		$("input[name=a_no]").val(a_no);
		var href = $(this).attr("href");
		$("#hiddenData").attr("action", href).submit();
		
	 });
	 
	// 토론 주제 추천 게시판 게시글 읽기
	$(".select_title").click(function (e) {
		e.preventDefault();
		var b_no = $(this).attr("data-b_no");
		var a_no = "${a_no}";
//  		console.log(b_no + "번 글 제목 클릭");
		$("input[name=b_no]").val(b_no);
		$("input[name=a_no]").val(a_no);
		$("input[name=nowPage]").val(1);
		
		var url = "/selectDiscussion/discussion_select_read";
		$("#hiddenData").attr("action",url);
		
		$("#hiddenData").submit();
	})

});
</script>

<div class="container-fluid">
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ ${ areaDataVo.a_name }</p>
</div>

<div class="grid-container">

<!-- 히든 데이터 값 시작 -->
	<form id="hiddenData" action="/notice_board/notice_list">
		<input type="hidden" name="b_no">
		<input type="hidden" name="a_no">
		<input type="hidden" name="nowPage">
		<input type="hidden" name="perPage">
		<input type="hidden" name="searchType">
		<input type="hidden" name="keyword">
	</form>
<!-- 히든 데이터 값 끝 -->

<!-- 공지사항 시작 -->
  <div class="noticeBoard">
  <!-- 공지사항 테이블 영역 시작 -->
   	<div class="card shadow mb-4">
 	  	<div class="card-header py-3">
 	  	
	      <h6 class="m-0 font-weight-bold text-primary" style="float: right;" data-toggle="tooltip" data-placement="top" title="더보기">
	      <a href="/notice_board/notice_list?b_no=&a_no=${ a_no }&nowPage=1&perPage=10&searchType=b_addinfo&keyword=${ a_no }">+</a>
	      </h6>
	      
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
		              	${ noticeList.b_title }&nbsp;
		              	<c:if test="${ noticeList.b_readcount >= 10 }"><img src="/resources/img/hot.gif"></c:if>
		              	</a>
	           		  </td>
	           		  <td>${ noticeList.u_name }</td>
	           		  <td>${ noticeList.b_readcount }
		              <td><fmt:formatDate value="${ noticeList.b_createddate }" pattern="yyyy-MM-dd"/></td>
		            </tr>
				  </c:if>
	           	  </c:forEach>
		          </tbody>
				</table>
	     	</div>
	      </div>
 	</div>
 	<!-- 공지사항 테이블 영역 끝 -->
  </div>
<!-- 공지사항 끝 -->

<!-- 토론게시판 시작 -->
  <div class="board01">
  <!-- 토론게시판 영역 시작 -->
   	<div class="card shadow mb-4">
 	  	<div class="card-header py-3">
 	  	
	      <h6 class="m-0 font-weight-bold text-primary" style="float: right;" data-toggle="tooltip" data-placement="top" title="더보기">
	      <a href="/discussion_board/discussion_main_board?a_no=${ areaDataVo.a_no }">+</a>
	      </h6>
	      
	      <h6 class="m-0 font-weight-bold text-primary">현재 토론 중</h6>
	    </div>
	      <div class="card-body">

			<c:choose>
				<c:when test="${ discussionList == '[]' }">
					<div class="slideshow-container">
						<div class="mySlides">
							<q style="cursor:pointer;" class="discussionBlankTitle">
								현재 정해진 토론 주제가 없습니다.
							</q>
						  <p class="author">- 관리자</p>
						</div>
						
						<a class="prev" onclick="plusSlides(-1)">❮</a>
						<a class="next" onclick="plusSlides(1)">❯</a>
				
					</div>
				
					<div class="dot-container">
						<span class="dot" onclick="currentSlide(1)"></span>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="slideshow-container">
					
						<c:forEach items="${ discussionList }" var="boardVo_discussion" >
							<div class="mySlides">
								<q style="cursor:pointer;" class="discussionTitle">
									${ boardVo_discussion.b_title } / ${ boardVo_discussion.b_serialno }
								</q>
							  <p class="author">- ${ boardVo_discussion.b_writer }(${ boardVo_discussion.u_email.substring(0, 3)}***)</p>
							</div>
						</c:forEach>
						
						<a class="prev" onclick="plusSlides(-1)">❮</a>
						<a class="next" onclick="plusSlides(1)">❯</a>
						
					</div>
					
					<div class="dot-container">
						<c:forEach begin="1" end="${ discussionListSize }" var= "i" >
							<span class="dot" onclick="currentSlide(${i})"></span> 
						</c:forEach>
					</div>
				</c:otherwise>
				
			</c:choose>

	      </div>
 	</div>
 	<!-- 토론게시판 영역 끝 -->
  </div>
<!-- 토론게시판 끝 -->

<script>
	var slideIndex = 0;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n - 1);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";  
	  }
	  slideIndex++;
	  if (slideIndex > slides.length) {slideIndex = 1}    
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" dactive", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " dactive";
	  setTimeout(showSlides, 5000);
	}
	
	$(".discussionTitle").click(function() {
		location.href = "/discussion_board/discussion_main_board?a_no=${ areaDataVo.a_no }";
	});
	$(".discussionBlankTitle").click(function() {
		location.href = "/discussion_board/discussion_main_board?a_no=${ areaDataVo.a_no }";
	});
</script>
  
<!-- 토론 주제 추천게시판 시작 -->
  <div class="board02">
  <!-- 토론 주제 추천게시판 테이블 영역 시작 -->
   	<div class="card shadow mb-4">
 	  	<div class="card-header py-3">
 	  	
 	  	  <h6 class="m-0 font-weight-bold text-primary" style="float: right;" data-toggle="tooltip" data-placement="top" title="더보기">
	      <a href="/selectDiscussion/discussion_select_board?a_no=${ areaDataVo.a_no }">+</a>
	      </h6>
 	  	
	      <h6 class="m-0 font-weight-bold text-primary">토론 주제 추천</h6>
	      </div>
	      <div class="card-body">
	      	<div class="table-responsive">
		      	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
		          <tbody>
			          <c:forEach items="${ selectBoardList }" var="selectBoardVo">
			          	<tr>
		           		  <td><a href="#" style="float: left;" class="select_title" data-b_no="${ selectBoardVo.b_no }">[${ selectBoardVo.d_name }]${ selectBoardVo.b_title }</a></td>
			              <td>${ selectBoardVo.b_writer }</td>
			              <td>${ selectBoardVo.b_readCount }</td>
			              <td>${ selectBoardVo.b_upCount }</td>
			              <td><fmt:formatDate value="${ selectBoardVo.b_createdDate }" pattern="yyyy-MM-dd HH:mm"/></td>
			             </tr>
			          </c:forEach>
		          </tbody>
				</table>
	     	</div>
	      </div>
 	</div>
 	<!-- 토론 주제 추천게시판 테이블 영역 끝 -->
  </div>
<!-- 토론 주제 추천게시판 끝 -->
  
<!-- 게시판03 시작 -->
  <div class="board03">
  <!-- 공지사항 테이블 영역 시작 -->
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
 	<!-- 공지사항 테이블 영역 끝 -->
  </div>
<!-- 게시판03 끝 -->
  
<!-- 게시판04 시작 -->
  <div class="board04">
  <!-- 공지사항 테이블 영역 시작 -->
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
 	<!-- 공지사항 테이블 영역 끝 -->
  </div>
<!-- 게시판04 끝 -->
  
<!-- 좌우, 중앙 빈 여백 시작 -->
  <div class="blank01"></div>
  <div class="blank02"></div>
  <div class="blank03"></div>
  <div class="blank04"></div>
  <div class="blank05"></div>
  <div class="blank06"></div>
  <div class="blank07"></div>
<!-- 좌우, 중앙 빈 여백 끝 -->
  
</div>

<%@include file="../include/footer.jsp" %>