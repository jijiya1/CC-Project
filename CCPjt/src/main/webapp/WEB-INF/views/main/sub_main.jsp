<%@page import="com.kh.domain.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<style>
.grid-container {
  display: grid;
  grid-template-columns: 0.3fr 2.3fr 0.1fr 2.3fr 0.3fr;
  grid-template-rows: 1fr 1fr 1fr;
  grid-template-areas: "blank02 noticeBoard blank01 board01 blank05" "blank03 board02 blank01 board03 blank06" "blank04 board04 blank01 board05 blank07";
}

.noticeBoard { grid-area: noticeBoard; }

.board01 { grid-area: board01; }

.board02 { grid-area: board02; }

.board03 { grid-area: board03; }

.board04 { grid-area: board04; }

.board05 { grid-area: board05; }

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
    -ms-grid-column-span: 1;
  }

  .board01 {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 4;
    -ms-grid-column-span: 1;
  }

  .board02 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 2;
    -ms-grid-column-span: 1;
  }

  .board03 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 4;
    -ms-grid-column-span: 1;
  }

  .board04 {
    -ms-grid-row: 3;
    -ms-grid-row-span: 1;
    -ms-grid-column: 2;
    -ms-grid-column-span: 1;
  }

  .board05 {
    -ms-grid-row: 3;
    -ms-grid-row-span: 1;
    -ms-grid-column: 4;
    -ms-grid-column-span: 1;
  }

  .blank01 {
    -ms-grid-row: 1;
    -ms-grid-row-span: 3;
    -ms-grid-column: 3;
    -ms-grid-column-span: 1;
  }

  .blank02 {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 1;
    -ms-grid-column-span: 1;
  }

  .blank03 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 1;
    -ms-grid-column-span: 1;
  }

  .blank04 {
    -ms-grid-row: 3;
    -ms-grid-row-span: 1;
    -ms-grid-column: 1;
    -ms-grid-column-span: 1;
  }

  .blank05 {
    -ms-grid-row: 1;
    -ms-grid-row-span: 1;
    -ms-grid-column: 5;
    -ms-grid-column-span: 1;
  }

  .blank06 {
    -ms-grid-row: 2;
    -ms-grid-row-span: 1;
    -ms-grid-column: 5;
    -ms-grid-column-span: 1;
  }

  .blank07 {
    -ms-grid-row: 3;
    -ms-grid-row-span: 1;
    -ms-grid-column: 5;
    -ms-grid-column-span: 1;
  }

}

/* Slideshow container */
.slideshow-container-dis {
  position: relative;
  background: #f1f1f1f1;
}

/* Slides */
.mySlides-dis {
  display: none;
  padding: 64.8px;
  text-align: center;
}

/* Next & previous buttons */
.prev-dis, .next-dis {
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
.next-dis {
  position: absolute;
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev-dis:hover, .next-dis:hover {
  background-color: rgba(0,0,0,0.8);
  color: white;
}

/* The dot/bullet/indicator container */
.dot-container-dis {
    text-align: center;
    padding: 20px;
    background: #ddd;
}

/* The dots/bullets/indicators */
.dot-dis {
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
.dactive, .dot-dis:hover {
  background-color: #717171;
}

/* Add an italic font style to all quotes */
q {font-style: italic;}

/* Add a blue color to the author */
.author-dis {color: cornflowerblue;}


.mySlides-test {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container-test {
  max-width: 1000px;
  position: relative;
}

/* Caption text */
/* .text { */
/*   color: #f2f2f2; */
/*   font-size: 15px; */
/*   padding: 8px 12px; */
/*   position: absolute; */
/*   bottom: 8px; */
/*   width: 100%; */
/*   text-align: center; */
/* } */

/* The dots/bullets/indicators */
.dot-test {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active-test {
  background-color: #717171;
}

/* Fading animation */
.fade-test {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.0s;
  animation-name: fade;
  animation-duration: 5.0s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}




.container-test {
  position: relative;
  width: 50%;
}

.image-test {
  display: block;
  margin: auto;
  width: 57.8%;
  height: auto;
}

.overlay-test {
  position: absolute;
  margin : auto;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: auto;
  width: 60%;
  opacity: 0;
  transition: .1s ease;
  background: rgb(0, 0, 0);
  background: rgba(0, 0, 0, 0.5); /* Black see-through */
}

.container-test:hover .overlay-test {
  opacity: 1;
}

.text-test #link_member {
  color: white;
  font-size: 17px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}

/* Next & previous buttons */
.prev-test, .next-test {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -30px;
  margin-left: -25px;
  padding: 16px;
  color: #888;
  font-weight: bold;
  font-size: 20px;
  border-radius: 3px 0 0 3px;
  user-select: none;
}

/* Position the "next button" to the right */
.next-test {
  position: absolute;
  right: 0;
  border-radius: 0 3px 3px 0;
}

/* On hover, add a black background color with a little bit see-through */
.prev-test:hover, .next-test:hover {
  background-color: rgba(0,0,0,0.8);
  color: white;
}

</style>

<script>
$(document).ready(function() {
	
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
		var u_email = "${userVo.u_email}";
		
		$("input[name=b_no]").val(b_no);
		$("input[name=a_no]").val(a_no);
		$("input[name=u_email]").val(u_email);
		$("input[name=nowPage]").val(1);
		
		var url = "/selectDiscussion/discussion_select_read";
		$("#hiddenData").attr("action",url);
		
		$("#hiddenData").submit();
	});

});
</script>

<title>CCPJT - ${ areaDataVo.a_name }</title>

<div class="container-fluid">
	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ ${ areaDataVo.a_name }</p>
</div>


<div class="grid-container">

<!-- 히든 데이터 값 시작 -->
	<form id="hiddenData" action="/notice_board/notice_list">
		<input type="hidden" name="b_no">
		<input type="hidden" name="a_no">
		<input type="hidden" name="u_email">
		<input type="hidden" name="nowPage">
		<input type="hidden" name="perPage">
		<input type="hidden" name="searchType">
		<input type="hidden" name="keyword">
	</form>
<!-- 히든 데이터 값 끝 -->

<!-- 공지사항 끝 -->
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
  
<!-- 의원 정보 시작 -->
  <div class="board01">
    <!-- 의원 정보 영역 시작 -->
   	<div class="card shadow mb-4">
 	  	<div class="card-header py-3">
 	  	
	      <h6 class="m-0 font-weight-bold text-primary" style="float: right;" data-toggle="tooltip" data-placement="top" title="더보기">
	      <a href="/person_board/person_list?a_no=${ a_no }">+</a>
	      </h6>
	      
	      <h6 class="m-0 font-weight-bold text-primary">의원정보</h6>
	    </div>
	      <div class="card-body">
			<div class="slideshow-container slideshow-container-test">
			
			<div class="container container-test">
			
			<c:forEach items="${ memberVo }" var="memberVo">
				<div class="mySlides fade mySlides-test fade-test">
				  <img src="/person_board/displayFile?fileName=${ memberVo.u_photo }" class="image-test">
				  	<div class="overlay overlay-test divPerson" >
				  	<div class="text text-test">
				  	<a href="/person_board/person_minipage?u_email=${ memberVo.u_email}&a_no=${ a_no }" id="link_member" style="text-decoration:none">
				  	<input type="hidden" name="m_eamil" value="${ memberVo.u_email}">
						  	${ memberVo.u_name }<br><br>
						  	${ memberVo.u_party }<br><br>
						  	${ memberVo.u_detail }
				  	</a>
				  	</div>
				  	</div>
				  </div>
			  </c:forEach>
			  
  			<a class="prev prev-test" onclick="plusSlidesTest(1)">❮</a>
			<a class="next next-test" onclick="plusSlidesTest(0)">❯</a>
			  
			  </div>
			
			</div>
			<br>
			

			<div style="text-align:center">
				<c:forEach var="j" begin="1" end="${ memberCount }">
					<span class="dot-test"></span>
				</c:forEach>
			</div>
			
	      </div>
 	</div>
  </div>
  
   	<!-- 의원 정보 영역 끝 -->
	<script>
	var slideIndexTest = 0;
	showSlidesTest();
	
	function plusSlidesTest(n) {
	  showSlidesTest(slideIndexTest += n);
	}
	
	function showSlidesTest() {
	  var i;
	  var slidesTest = document.getElementsByClassName("mySlides-test");
// 	  console.log(slidesTest);
	  var dotsTest = document.getElementsByClassName("dot-test");
	  for (i = 0; i < slidesTest.length; i++) {
	    slidesTest[i].style.display = "none";
// 	    console.log(slidesTest[i]);
// 		var m_email = $("input[name=m_email]").val();
// 		console.log(m_email);
	  }
	  slideIndexTest++;
	  if (slideIndexTest > slidesTest.length) {slideIndexTest = 1}    
	  for (i = 0; i < dotsTest.length; i++) {
	    dotsTest[i].className = dotsTest[i].className.replace(" active-test", "");
	  }
	  slidesTest[slideIndexTest-1].style.display = "block";  
	  dotsTest[slideIndexTest-1].className += " active-test";
	  setTimeout(showSlidesTest, 5000); // Change image every 2 seconds
	}
	
	// 의원 오버레이 클릭 시 해당 의원 정보 이동
// 	$(".divPerson").click(function(e) {
// 		e.preventDefault();
// 		console.log("클릭됨");
// 		var m_email = $("input[name=m_email]").val();
// 		console.log(m_email);
// 		location.href="/person_board/person_minipage?m_email=" + m_email;
// 	});
	
// 	$("#link_member").click(function(e) {
// 		e.preventDefault();
// 		console.log("클릭됨");
// 	});
	
	</script>
<!-- 의원 정보 끝 -->
  
<!-- 토론게시판 시작 -->
  <div class="board02">
  <!-- 토론게시판 테이블 영역 시작 -->
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
					<div class="slideshow-container slideshow-container-dis">
						<div class="mySlides mySlides-dis">
							<q style="cursor:pointer;" class="discussionBlankTitle">
								현재 정해진 토론 주제가 없습니다.
							</q>
						  <p class="author author-dis">- 관리자</p>
						</div>
						
						<a class="prev prev-dis" onclick="plusSlidesDis(1)">❮</a>
						<a class="next next-dis" onclick="plusSlidesDis(0)">❯</a>
				
					</div>
				
					<div class="dot-container dot-container-dis">
						<span class="dot dot-dis" onclick="currentSlideDis(1)"></span>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="slideshow-container slideshow-container-dis">
					
						<c:forEach items="${ discussionList }" var="boardVo_discussion" >
							<div class="mySlides mySlides-dis">
								<q style="cursor:pointer; font-size: 20px; font: bold;" class="discussionTitle">
									${ boardVo_discussion.b_title }
								</q>
							  <p class="author author-dis">- ${ boardVo_discussion.b_writer }(${ boardVo_discussion.u_email.substring(0, 3)}***)</p>
							</div>
						</c:forEach>
						
						<a class="prev prev-dis" onclick="plusSlidesDis(1)">❮</a>
						<a class="next next-dis" onclick="plusSlidesDis(0)">❯</a>
						
					</div>
					
					<div class="dot-container dot-container-dis">
						<c:forEach begin="1" end="${ discussionListSize }" var= "i" >
							<span class="dot dot-dis" onclick="currentSlideDis(${i})"></span> 
						</c:forEach>
					</div>
				</c:otherwise>
				
			</c:choose>

	      </div>
 	</div>
 	<!-- 토론게시판 테이블 영역 끝 -->
  </div>
  
	<script>
		var slideIndexDis = 0;
		showSlidesDis(slideIndexDis);
		
		function plusSlidesDis(n) {
		  showSlidesDis(slideIndexDis += n);
		}
		
		function currentSlideDis(n) {
		  showSlidesDis(slideIndexDis = n - 1);
		}
		
		function showSlidesDis(n) {
		  var i;
		  var slidesDis = document.getElementsByClassName("mySlides-dis");
		  var dotsDis = document.getElementsByClassName("dot-dis");
		  for (i = 0; i < slidesDis.length; i++) {
		    slidesDis[i].style.display = "none";  
		  }
		  slideIndexDis++;
		  if (slideIndexDis > slidesDis.length) {slideIndexDis = 1}    
		  for (i = 0; i < dotsDis.length; i++) {
		    dotsDis[i].className = dotsDis[i].className.replace(" dactive", "");
		  }
		  slidesDis[slideIndexDis-1].style.display = "block";  
		  dotsDis[slideIndexDis-1].className += " dactive";
		  setTimeout(showSlidesDis, 5000);
		}
		
		$(".discussionTitle").click(function() {
			location.href = "/discussion_board/discussion_main_board?a_no=${ areaDataVo.a_no }";
		});
		$(".discussionBlankTitle").click(function() {
			location.href = "/discussion_board/discussion_main_board?a_no=${ areaDataVo.a_no }";
		});
	</script>
<!-- 토론게시판 끝 -->
  
<!-- 토론 주제 추천게시판 시작 -->
  <div class="board03">
  <!-- 토론 주제 추천게시판 테이블 영역 시작 -->
   	<div class="card shadow mb-4">
 	  	<div class="card-header py-3">
 	  	
 	  	  <h6 class="m-0 font-weight-bold text-primary" style="float: right;" data-toggle="tooltip" data-placement="top" title="더보기">
	      <a href="/selectDiscussion/discussion_select_board?a_no=${ areaDataVo.a_no }&u_email=">+</a>
	      </h6>
 	  	
	      <h6 class="m-0 font-weight-bold text-primary">토론 주제 추천</h6>
	      </div>
	      <div class="card-body">
	      	<div class="table-responsive">
		      	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
		          <tbody>
			          <c:forEach items="${ selectBoardList }" var="selectBoardVo">
			          	<tr>
		           		  <td>
		           		  	<a href="#" style="float: left;" class="select_title" data-b_no="${ selectBoardVo.b_no }">[${ selectBoardVo.d_name }]
		           		  	<c:choose>
		           		  	<c:when test="${ fn:length(selectBoardVo.b_title) > 21 }">${ selectBoardVo.b_title.substring(0, 21) }...</c:when>
		           		  	<c:otherwise>${ selectBoardVo.b_title }</c:otherwise>
		           		  	</c:choose>
		           		  	</a>
		           		  </td>
			              <td>${ selectBoardVo.b_writer }</td>
			              <td>${ selectBoardVo.b_readCount }</td>
			              <td>${ selectBoardVo.b_upCount }</td>
			              <td><fmt:formatDate value="${ selectBoardVo.b_createdDate }" pattern="yyyy-MM-dd"/></td>
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
  
  
<!-- 청원게시판  시작 -->
  <div class="board04">
  <!-- 청원게시판 테이블 영역 시작 -->
   	<div class="card shadow mb-4">
 	  	<div class="card-header py-3">
 	  	
 	  	  <h6 class="m-0 font-weight-bold text-primary" style="float: right;" data-toggle="tooltip" data-placement="top" title="더보기">
	      <a href="/petition_board/petitionMain?a_no=${ a_no }">+</a>
	      </h6>
 	  	
	      <h6 class="m-0 font-weight-bold text-primary">HOT한 청원</h6>
	      </div>
	      <div class="card-body">
	      	<div class="table-responsive">
	      	
		      	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
					<tbody>
					<c:forEach items="${pMain}" var="peVo">
						<tr>
							<td>
								<a href="/petition_board/petitionRead?a_no=${ a_no }&b_serialno=${ peVo.b_serialno }" class="a_title" style="float: left;" data-bno="${peVo.b_no}">
								<c:if test="${ peVo.ranking == '1' || peVo.ranking == '2' || peVo.ranking == '3'}">
									<img src="/resources/img/rank${ peVo.ranking }.png" style="width: 25px; height: auto;">
								</c:if>
									<span style="font-size: 14px"> [${peVo.d_name}] </span>${peVo.b_title}
								</a>
							</td>
							<td>
								<c:choose>
									<c:when test="${peVo.b_progress == 1}" >사전 동의 진행중</c:when>
									<c:when test="${peVo.b_progress == 2}">청원 시작</c:when>
									<c:when test="${peVo.b_progress == 3}">청원 진행중</c:when>
									<c:when test="${peVo.b_progress == 4}">청원 종료</c:when>
									<c:otherwise>답변 완료</c:otherwise>
								</c:choose>
							</td>													
							<td>${peVo.b_agree}</td>
							<td>${peVo.b_readcount}</td>
							<td><fmt:formatDate value="${peVo.b_enddate}" pattern="yyyy-MM-dd"/> </td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
	     	</div>
	      </div>
 	</div>
 	<!-- 청원게시판 테이블 영역 끝 -->
  </div>
<!-- 청원게시판 끝 -->

<!-- 자유게시판 시작 -->
  <div class="board05">
  <!-- 자유게시판 테이블 영역 시작 -->
   	<div class="card shadow mb-4">
 	  	<div class="card-header py-3">
 	  	
 	  	  <h6 class="m-0 font-weight-bold text-primary" style="float: right;" data-toggle="tooltip" data-placement="top" title="더보기">
	      <a href="/suggest_board/suggest_list?a_no=${ a_no }">+</a>
	      </h6>
 	  	
	      <h6 class="m-0 font-weight-bold text-primary">자유게시판</h6>
	      </div>
	      <div class="card-body">
	      	<div class="table-responsive">
		      	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
			      <tbody>
		          <c:forEach items="${ boardList }" var="boardList">
		          
		          <c:if test="${ boardList.b_checkeddel == 0 }">
		            <tr>
		              <td>
		              	<a href="/suggest_board/suggest_read?b_no=${ boardList.b_no }&a_no=${ a_no }" class="title" style="float: left;" 
		              	data-b_no="${ boardList.b_no }" data-a_no="${ boardList.a_no }">
		              	${ boardList.b_title }
		              	<c:if test="${ boardList.b_readcount >= 10 }"><img src="/resources/img/hot.gif"></c:if>
		              	</a>
	           		  </td>
	           		  <td>${ boardList.b_writer }</td>
	           		  <td>${ boardList.b_readcount }</td>
		              <td><fmt:formatDate value="${ boardList.b_createddate }" pattern="yyyy-MM-dd"/></td>
		            </tr>
				  </c:if>
	           	  </c:forEach>
		          </tbody>
				</table>
	     	</div>
	      </div>
 	</div>
 	<!-- 자유게시판 테이블 영역 끝 -->
  </div>
<!-- 자유게시판 끝 -->

  <div class="blank01"></div>
  <div class="blank02"></div>
  <div class="blank03"></div>
  <div class="blank04"></div>
  <div class="blank05"></div>
  <div class="blank06"></div>
  <div class="blank07"></div>
  
</div>

<%@include file="../include/footer.jsp" %>