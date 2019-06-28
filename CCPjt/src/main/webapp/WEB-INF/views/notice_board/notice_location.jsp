<%@page import="org.omg.CORBA.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<!-- 지도 시작 -->
<script type="text/javascript" src="/resources/post_inc/korea_map/raphael_min.js"></script>
<script type="text/javascript" src="/resources/post_inc/korea_map/raphael_path_s.korea.js"></script>
<script>
	var sca = '01';
</script>

<script>
$(document).ready(function() {
	
	$("#btnAll").click(function() {
		location.href="/notice_board/notice_list";
	});
	
	$("#btnSeoul").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=20";
	});
	
	$("#btnGygg").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=31";
	});
	
	$("#btnIncheon").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=32";
	});
	
	$("#btnGangwon").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=33";
	});
	
	$("#btnChungbuk").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=43";
	});
	
	$("#btnChungnam").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=41";
	});
	
	$("#btnDaejeon").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=42";
	});
	
	$("#btnSejong").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=44";
	});
	
	$("#btnJeonbuk").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=63";
	});
	
	$("#btnGwangju").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=62";
	});
	
	$("#btnJeonnam").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=61";
	});
	
	$("#btnGyeongbuk").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=54";
	});
	
	$("#btnDaegu").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=53";
	});
	
	$("#btnGyeongnam").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=55";
	});
	
	$("#btnUlsan").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=52";
	});
	
	$("#btnBusan").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=51";
	});
	
	$("#btnJeju").click(function() {
		location.href="/notice_board/notice_list?b_no=&a_no=&nowPage=1&perPage=10&searchType=b_addinfo&keyword=64";
	});

});
</script>

<style>
	#canvas {float:left; position:relative; width: 320px; height:400px; margin: 0}
	#south {width: 320px; height:400px; position: absolute; top: 0px; left: 0;}
	
	#canvas h2{ padding:0; margin:0; font-size:12px; }
	
	#seoul, #gygg, #incheon, #gangwon, #chungbuk, #chungnam, #daejeon, #sejong, #jeonbuk, #jeonnam, #gwangju, #gyeongbuk, #gyeongnam, #daegu, #busan, #ulsan, #jeju { display: none; position: absolute; height:16px; background-color:#000; color:#fff; padding:2px 5px; text-align:center;}
	
	#seoul{ left:80px; top:75px; }
	#gygg{ left:80px; top:45px; }
	#incheon{ left:60px; top:75px; }
	#gangwon{ left:150px; top:45px; }
	#chungbuk{ left:120px; top:145px; }
	#chungnam{ left:60px; top:165px; }
	#daejeon{ left:80px; top:165px; }
	#sejong{ left:70px; top:145px; }
	#jeonbuk{ left:60px; top:205px; }
	#jeonnam{ left:60px; top:260px; }
	#gwangju{ left:	60px; top:260px; }
	#gyeongbuk{ left:150px; top:165px; }
	#gyeongnam{ left:130px; top:240px; }
	#daegu{ left:170px; top:210px; }
	#busan{ left:190px; top:250px; }
	#ulsan{ left:200px; top:225px; }
	#jeju{ left:80px; top:340px; }
</style>

<div class="container-fluid">

	<p class="mb-4"><span class="fas fa-home">&nbsp;</span><a href="/">홈</a> ＞ 지역별</p>

	<div class="row">
	<div class="col-md-2"></div>
	
	<div class="col-md-3">
		<div style="width:100%; height:400px;">
			<div id="canvas" style="float: right;">
				<div id="south"></div>
				<div id="seoul"><h2>서울특별시</h2></div>
				<div id="gygg"><h2>경기도</h2></div>
				<div id="incheon"><h2>인천광역시</h2></div>
				<div id="gangwon"><h2>강원도</h2></div>
				<div id="chungbuk"><h2>충청북도</h2></div>
				<div id="chungnam"><h2>충청남도</h2></div>
				<div id="daejeon"><h2>대전광역시</h2></div>
				<div id="sejong"><h2>세종특별자치시</h2></div>
				<div id="gwangju"><h2>광주광역시</h2></div>
				<div id="jeonbuk"><h2>전라북도</h2></div>
				<div id="jeonnam"><h2>전라남도</h2></div>
				<div id="gyeongbuk"><h2>경상북도</h2></div>
				<div id="gyeongnam"><h2>경상남도</h2></div>
				<div id="daegu"><h2>대구광역시</h2></div>
				<div id="busan"><h2>부산광역시</h2></div>
				<div id="ulsan"><h2>울산광역시</h2></div>
				<div id="jeju"><h2>제주특별자치도</h2></div>
			</div>
		</div>
	</div>

	<div class="col-md-5">
		<button type="button" class="btn btn-outline-primary" id="btnAll">전 체</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnSeoul">서 울</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnGygg">경 기</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnIncheon">인 천</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnBusan">부 산</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnDaegu">대 구</button>&nbsp;&nbsp;
				<br><br>
		<button type="button" class="btn btn-outline-primary" id="btnDaejeon">대 전</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnGyeongnam">경 남</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnJeonnam">전 남</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnChungnam">충 남</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnGwangju">광 주</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnUlsan">울 산</button>&nbsp;&nbsp;
				<br><br>
		<button type="button" class="btn btn-outline-primary" id="btnGyeongbuk">경 북</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnJeonbuk">전 북</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnChungbuk">충 북</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnGangwon">강 원</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnJeju">제 주</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" id="btnSejong">세 종</button>&nbsp;&nbsp;
				<br><br>
	</div>

<!-- 	<div class="col-md-3" style="font-size: 20px;"> -->
<!-- 		<a href="#">서울</a>&nbsp; -->
<!-- 		<a href="#">경기</a>&nbsp; -->
<!-- 		<a href="#">인천</a>&nbsp; -->
<!-- 		<a href="#">부산</a>&nbsp; -->
<!-- 		<br><br> -->
<!-- 		<a href="#">대구</a>&nbsp; -->
<!-- 		<a href="#">대전</a>&nbsp; -->
<!-- 		<a href="#">경남</a>&nbsp; -->
<!-- 		<a href="#">전남</a>&nbsp; -->
<!-- 		<br><br> -->
<!-- 		<a href="#">충남</a>&nbsp; -->
<!-- 		<a href="#">광주</a>&nbsp; -->
<!-- 		<a href="#">울산</a>&nbsp; -->
<!-- 		<a href="#">경북</a>&nbsp; -->
<!-- 		<br><br> -->
<!-- 		<a href="#">전북</a>&nbsp; -->
<!-- 		<a href="#">충북</a>&nbsp; -->
<!-- 		<a href="#">제주</a>&nbsp; -->
<!-- 		<a href="#">세종</a>&nbsp; -->
<!-- 	</div> -->
	
	<div class="col-md-2"></div>
	
	</div>
</div>

<!-- 지도 끝 -->

<%@include file="../include/footer.jsp" %>