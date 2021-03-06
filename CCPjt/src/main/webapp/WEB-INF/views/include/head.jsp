<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Custom fonts for this template-->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <link rel="shortcut icon" type="image/x-icon" href="/resources/img/mainIcon.png">

<script>
$(document).ready(function() {
	// 툴팁
	$('[data-toggle="tooltip"]').tooltip();
	
	// 검색 -> 지역 선택시 페이지 이동
	function searchLocal() {
		$("#searchTypeAll").change(function(e) {
			var sendData = $("#searchTypeAll").val();
// 			console.log(sendData);
			if (sendData == 'u_local') {
				location.href="/main/member_search_area";
			}
		});
	}
	searchLocal();
	
	// 전체 검색(버튼 클릭)
	$("#btnSearchAll").click(function() {
		$("input[name=a_no]").val(10);
		
		$("input[name=searchTypeAll]").val("u_name");
		
		var keywordAll = $("#keywordAll").val();
// 		console.log(keyword);
		$("input[name=keywordAll]").val(keywordAll);
		
		$("#searchAllData").submit();
	});
	
	// 신고 게시물 클릭시
	$("#btnReport").click(function() {
		alert("현재 서비스 점검 중입니다.");
	});
	
});
</script>

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Community Center<sup>5</sup></div>
      </a>
	
      <!-- Divider -->
      <hr class="sidebar-divider">


<!--       Nav Item - Dashboard -->
<!--       <li class="nav-item active"> -->
<!--         <a class="nav-link" href="/"> -->
<!--           <i clas="fas fa-fw fa-tachometer-alt"></i> -->
<!--           <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60"> -->
<!--           <span>사용자명</span></a> -->
<!--       </li> -->
      
<!--       Divider -->
<!--       <hr class="sidebar-divider"> -->


	<!-- 좌측 메뉴바 시작 -->
      <!-- Heading -->
      <div class="sidebar-heading">
        notice
      </div>
      
      	<!-- Nav Item - 공지사항 -->
      	<c:choose>
      	<c:when test="${ areaDataVo.a_no == null }">
    	 <li class="nav-item active">
	        <a class="nav-link" href="/notice_board/notice_list?b_no=&a_no=10&nowPage=1&perPage=10&searchType=b_addinfo&keyword=10">
	          <i class="fas fa-fw fas fas fa-exclamation-circle"></i>
	          <span>공지사항</span></a>
	    </li>
	    </c:when>
	    <c:otherwise>
       	 <li class="nav-item active">
	        <a class="nav-link" href="/notice_board/notice_list?b_no=&a_no=${ areaDataVo.a_no }&nowPage=1&perPage=10&searchType=b_addinfo&keyword=${ areaDataVo.a_no }">
	          <i class="fas fa-fw fas fas fa-exclamation-circle"></i>
	          <span>공지사항</span></a>
	    </li>
	    </c:otherwise>
	    </c:choose>


	<c:if test="${ areaDataVo.a_no != null }">
		      <!-- Divider -->
      <hr class="sidebar-divider">
      
	<c:choose>
	
		<c:when test="${ areaDataVo.a_no == 10 }">
		<!-- Nav Item - 지역선택 -->
	     <div class="sidebar-heading">
	        Location
	      </div>
	      <li class="nav-item active">
	        <a class="nav-link" href="/notice_board/notice_location">
	          <i class="fas fa-fw fas fa-globe-americas"></i>
	          <span>지역 선택</span></a>
	      </li>
		</c:when>
		
		<c:otherwise>
	      <!-- Heading -->
	      <div class="sidebar-heading">
	        ${ areaDataVo.a_engname }
	      </div>
	      
     	<!-- Nav Item - 손병진 -->
	      <li class="nav-item active">
	        <a class="nav-link" href="/person_board/person_list?a_no=${ areaDataVo.a_no }">
	          <i class="fas fa-fw fas fa-user-tie"></i>
	          <span>의원 정보</span></a>
	      </li>
	
		<!-- Nav Item - 정혜지 -->
	      <li class="nav-item active">
	        <a class="nav-link" href="/petition_board/petitionMain?a_no=${ areaDataVo.a_no }">
	          <i class="fas fa-fw fas fa-comment-dots"></i>
	          <span>청원게시판</span></a>
	      </li>
	      
		<!-- Nav Item - 황용석 -->
	      <li class="nav-item active">
	        <a class="nav-link" href="/discussion_board/discussion_main_board?a_no=${ areaDataVo.a_no }">
	          <i class="fas fa-fw far fa-comments"></i>
	          <span>토론게시판</span></a>
	      </li>
	      
		<!-- Nav Item - 박석환 -->
	      <li class="nav-item active">
	        <a class="nav-link" href="/suggest_board/suggest_list?a_no=${ areaDataVo.a_no }">
	          <i class="fas fa-fw fa-list-alt"></i>
	          <span>자유게시판</span></a>
	      </li>
	
	
	      </c:otherwise>
      </c:choose>
            <!-- Divider -->
      <hr class="sidebar-divider">
     </c:if>
      
      
	<!-- 좌측 메뉴바 끝 -->
	
	<!-- 관리자 메뉴바 시작 -->
	<c:if test="${ userVo.u_email eq 'admin' }">
		<div class="sidebar-heading">
		    admin
		</div>
		<li class="nav-item active">
		    <a class="nav-link" href="/admin/user_list?nowPage=1&perPage=10&searchType=&keyword=">
		      <i class="fas fa-fw fa-user-alt"></i>
		      <span>회원 관리</span></a>
		</li>
		<li class="nav-item active">
		    <a class="nav-link" href="/admin/member_selectArea">
		      <i class="fas fa-fw fa fa-address-book"></i>
		      <span>의원 입력</span></a>
		</li>
		<li class="nav-item active">
		    <a class="nav-link" href="#">
		      <i class="fas fa-fw fas fa-exclamation-triangle"></i>
		      <span id="btnReport">신고 게시물</span></a>
		</li>
<!-- 		<li class="nav-item active"> -->
<!-- 		    <a class="nav-link" href="/admin/test_board"> -->
<!-- 		      <i class="fas fa-fw fas fas fa-cog"></i> -->
<!-- 		      <span>테스트</span></a> -->
<!-- 		</li> -->
	</c:if>
	<!-- 관리자 메뉴바 끝 -->

      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- 전체 검색바 -->
          <form class="d-none d-sm-inline-block form-inline ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="/main/search_all" id="searchAllData">
            <div class="input-group">
              <select class="form-control-sm bg-light border-0" id="searchTypeAll">
              	<option value="u_name">이름</option>
              	<option value="u_local">지역</option>
              </select>
              <input type="text" class="form-control bg-light border-0 small"  id="keywordAll" placeholder="의원 검색" aria-label="Search" aria-describedby="basic-addon2">
              <input type="hidden" name="a_no">
              <input type="hidden" name="searchTypeAll">
              <input type="hidden" name="keywordAll">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button" id="btnSearchAll">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

<!-- 메시지, 새소식 -->
			<c:if test="${userVo != null }">
				<!-- 새소식-->
	            <li class="nav-item dropdown no-arrow mx-1">
	              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-bell fa-fw"></i>
	                <!-- Counter - Alerts -->
	                <span class="badge badge-danger badge-counter">3+</span>
	              </a>
	              
	              
	              <!-- Dropdown - Alerts -->
	              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
	                <h6 class="dropdown-header">
	                  Alerts Center
	                </h6>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-primary">
	                      <i class="fas fa-file-alt text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">2019. 7. 10</div>
	                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-success">
	                      <i class="fas fa-donate text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 7, 2019</div>
	                    $290.29 has been deposited into your account!
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-warning">
	                      <i class="fas fa-exclamation-triangle text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">2019. 07. 15</div>
	                    [울산] 자유게시판 10번 글 신고가 접수되었습니다.
	                  </div>
	                </a>
	                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
	              </div>
	            </li>
	            
	
	            <!-- 메세지 -->
	            <li class="nav-item dropdown no-arrow mx-1">
	              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-envelope fa-fw"></i>
	                <!-- Counter - Messages -->
	                <span class="badge badge-danger badge-counter">7</span>
	              </a>
	              <!-- Dropdown - Messages -->
	              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
	                <h6 class="dropdown-header">
	                  Message Center
	                </h6>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="http://placehold.it/60x60" alt="">
	                    <div class="status-indicator bg-success"></div>
	                  </div>
	                  <div class="font-weight-bold">
	                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
	                    <div class="small text-gray-500">Emily Fowler · 58m</div>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="http://placehold.it/60x60" alt="">
	                    <div class="status-indicator"></div>
	                  </div>
	                  <div>
	                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
	                    <div class="small text-gray-500">Jae Chun · 1d</div>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="http://placehold.it/60x60" alt="">
	                    <div class="status-indicator bg-warning"></div>
	                  </div>
	                  <div>
	                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
	                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="http://placehold.it/60x60" alt="">
	                    <div class="status-indicator bg-success"></div>
	                  </div>
	                  <div>
	                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
	                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
	                  </div>
	                </a>
	                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
	              </div>
	            </li>
				
			</c:if>
<!-- 			새소식, 메시지끝 -->
            
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
           		<c:choose>
            		<c:when test="${userVo != null }">
		              	<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                    <span class="mr-2 d-none d-lg-inline text-gray-600">${userVo.u_name }</span>
		                    <img class="img-profile rounded-circle" src="/resources/img/preePoto.png">
	                    </a>
            		</c:when>
            		<c:otherwise>
	            		<a class="nav-link dropdown-toggle" href="/login" id="userLogin" role="button" aria-haspopup="true" aria-expanded="false" >
		               		<span class="mr-2 d-none d-lg-inline text-gray-600">Login</span>
		              	</a>
            		</c:otherwise>
            	</c:choose>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/user_join/update_form">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  내 정보
                </a>
<!--                 <a class="dropdown-item" href="#"> -->
<!--                   <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> -->
<!--                   Settings -->
<!--                 </a> -->
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  내 게시글
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-envelope fa-fw mr-2 text-gray-400"></i>
                  메시지
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/logout" >
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  로그아웃
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->
