<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>
<%@page import="org.omg.CORBA.Request"%>
    
<!-- 지도 시작 -->
<script type="text/javascript" src="/resources/post_inc/korea_map/raphael_min.js"></script>
<!-- <script type="text/javascript" src="/resources/post_inc/korea_map/raphael_path_s.korea.js"></script> -->
<script type="text/javascript" src="/resources/post_inc/korea_map/raphael_path_s.korea_member.js"></script>
<script>
	var sca = '01';
</script>

<script>
$(document).ready(function() {
	var a_no = "";
	function getDetailList() {
		var url = "/admin/select_detail/"+a_no;
		$.getJSON(url, function(receivedData) {
			var strHtml = "";
			$(receivedData).each(function(i) {
				strHtml += "<button type='button' style='margin-top:7px;' class='btn btn-outline-primary btn-detail' data-ano='"+this.a_no+"' value='"+this.d_no+"'id='btn"+i+"'>"+this.d_name+"</button>&nbsp;&nbsp;"
			});
			$("#divHr").attr("style", "");
			$("#divDetail").html(strHtml);
		}); 
	}
	
	$("#divDetail").on("click", ".btn-detail", function(){
		a_no = $(this).attr("data-ano");
		var d_no = $(this).val();
		location.href="/admin/member_insert_form?d_no="+d_no+"&a_no="+a_no;
	});
	
	$("#btnSeoul").click(function() {
		a_no = $("#btnSeoul").val();
		getDetailList();
	});
	
	$("#btnGygg").click(function() {
		a_no = $("#btnGygg").val();
		getDetailList();
	});
	
	$("#btnIncheon").click(function() {
		a_no = $("#btnIncheon").val();
		getDetailList();
	});
	
	$("#btnGangwon").click(function() {
		a_no = $("#btnGangwon").val();
		getDetailList();
	});
	
	$("#btnChungbuk").click(function() {
		a_no = $("#btnChungbuk").val();
		getDetailList();
	});
	
	$("#btnChungnam").click(function() {
		a_no = $("#btnChungnam").val();
		getDetailList();
	});
	
	$("#btnDaejeon").click(function() {
		a_no = $("#btnDaejeon").val();
		getDetailList();
	});
	
	$("#btnSejong").click(function() {
		a_no = $("#btnSejong").val();
		getDetailList();
	});
	
	$("#btnJeonbuk").click(function() {
		a_no = $("#btnJeonbuk").val();
		getDetailList();
	});
	
	$("#btnGwangju").click(function() {
		a_no = $("#btnGwangju").val();
		getDetailList();
	});
	
	$("#btnJeonnam").click(function() {
		a_no = $("#btnJeonnam").val();
		getDetailList();
	});
	
	$("#btnGyeongbuk").click(function() {
		a_no = $("#btnGyeongbuk").val();
		getDetailList();
	});
	
	$("#btnDaegu").click(function() {
		a_no = $("#btnDaegu").val();
		getDetailList();
	});
	
	$("#btnGyeongnam").click(function() {
		a_no = $("#btnGyeongnam").val();
		getDetailList();
	});
	
	$("#btnUlsan").click(function() {
		a_no = $("#btnUlsan").val();
		getDetailList();
	});
	
	$("#btnBusan").click(function() {
		a_no = $("#btnBusan").val();
		getDetailList();
	});
	
	$("#btnJeju").click(function() {
		a_no = $("#btnJeju").val();
		getDetailList();
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
	<div class="row">
		<div class="col-md-6">
			<div class="col-md-12">
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
		</div>
		<div class="col-md-6">
			<div class="col-md-12">
				<button type="button" class="btn btn-outline-primary" value="20" id="btnSeoul">서 울</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="31" id="btnGygg">경 기</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="32" id="btnIncheon">인 천</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="51" id="btnBusan">부 산</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="53" id="btnDaegu">대 구</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="44" id="btnSejong">세 종</button>&nbsp;&nbsp;
						<br><br>
				<button type="button" class="btn btn-outline-primary" value="42" id="btnDaejeon">대 전</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="55" id="btnGyeongnam">경 남</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="61" id="btnJeonnam">전 남</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="41" id="btnChungnam">충 남</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="62" id="btnGwangju">광 주</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="52" id="btnUlsan">울 산</button>&nbsp;&nbsp;
						<br><br>
				<button type="button" class="btn btn-outline-primary" value="54" id="btnGyeongbuk">경 북</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="63" id="btnJeonbuk">전 북</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="43" id="btnChungbuk">충 북</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="33" id="btnGangwon">강 원</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-primary" value="64" id="btnJeju">제 주</button>&nbsp;&nbsp;
						<br><br>
				<hr>
			</div>	
			<div class="col-md-12" id="divDetail">
				
			</div>
			<div class="col-md-12" id="divHr" style="display:none;"><hr></div>
		</div>
	</div>
</div>
<!-- 지도 끝 -->



<%@include file="../include/footer.jsp" %>