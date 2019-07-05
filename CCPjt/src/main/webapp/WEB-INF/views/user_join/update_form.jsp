<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>
<style>
.form-group{
	color:black;
};
</style>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	var message = "${message}";
	if(message=="updateRun"){
		alert("회원정보 수정완료");
	}else if(message=="updatePw"){
		alert("비밀번호 변경완료");
	}
	var checkPw=0;
	var checkChangePw=0;
	var checkAdd=0;

    function searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("joinExtraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("joinExtraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('joinPostcode').value = data.zonecode;
                document.getElementById("joinAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("joinDetailAddress").focus();
				$("#joinAddress").attr("style", "border:1px solid green;");
				$("#joinDetailAddress").attr("style", "border:1px solid green;");
				$("#joinPostcode").attr("style", "border:1px solid green;");
				$("#joinExtraAddress").attr("style", "border:1px solid green;");
				checkAdd = 1;
            }
        }).open();
    }
	function checkFormInfo(){
		if(checkPw==0){
			$("#joinPw").attr("style", "border:1px solid gold;");
			$("#joinPwCheck").attr("style", "border:1px solid gold;");
		}
		if(checkAdd==0){
			$("#joinAddress").attr("style", "border:1px solid gold;");
			$("#joinDetailAddress").attr("style", "border:1px solid gold;");
			$("#joinPostcode").attr("style", "border:1px solid gold;");
			$("#joinExtraAddress").attr("style", "border:1px solid gold;");
		}
	}
    $(document).ready(function(){
    	$("#updatePw").blur(function(){
    		var inputPw = $("#updatePw").val();
    		var userPw = "${userVo.u_pw}";
    		if(inputPw == userPw){
				$("#updatePw").attr("style", "border:1px solid green;");
				checkPw = 1;
    		}else{
				$("#updatePw").attr("style", "border:1px solid gold;");
    			checkPw = 0;
    		}
    	});
    	
    	$("#joinPw").blur(function(){
    		var pwVal = $("#joinPw").val();
    		if(pwVal.length > 8 && pwVal.length < 20){
    				$("#joinPw").attr("style", "");
        			$("#joinPwCheck").attr("style", "");
    				$("#txtPwCheck").text("비밀번호 확인해주세요.");
    				$("#txtPwCheck").attr("style", "color:green;");
    				$("#joinPwCheck").removeAttr("disabled");
    				checkChangePw=0;
    		}else{
				$("#joinPw").attr("style", "border:1px solid gold;");
    			$("#joinPwCheck").attr("style", "border:1px solid gold;");
				$("#txtPwCheck").text("유효하지않은 비밀번호입니다.");
				$("#txtPwCheck").attr("style", "color:gold;");
				$("#joinPwCheck").attr("disabled", "disabled");
				checkChangePw=0
    		}
    	});
    	
    	$("#joinPwCheck").blur(function(){
    		var pwVal = $("#joinPw").val();
    		var pwValCheck = $("#joinPwCheck").val();
    		if(pwVal==pwValCheck){
    			$("#joinPw").attr("style", "border:1px solid green;");
    			$("#joinPwCheck").attr("style", "border:1px solid green;");
				$("#txtPwCheck").text("사용 가능한 비밀번호입니다.");
				$("#txtPwCheck").attr("style", "color:green;");
				$("#hiddenPw").val(pwVal);
				checkChangePw=1
    		}else{
    			$("#joinPw").attr("style", "border:1px solid gold;");
    			$("#joinPwCheck").attr("style", "border:1px solid gold;");
				$("#txtPwCheck").text("비밀번호가 다릅니다.");
				$("#txtPwCheck").attr("style", "color:gold;");
				checkChangePw=0
    		}
    	});
    	
    	$("#btnUpdate").click(function(){
    		if(checkPw==1 && checkAdd==1){
				$("#updateForm").submit();
    		}else{
    			checkFormInfo();
    			alert("회원정보 수정 실패 : 정보를 정확히 입력하세요.");
    		}
    	});
    	$("#btnDelete").click(function(){
    		var pw = $("#updatePw").val();
    		if(pw == null || pw ==""){
    			alert("비밀번호를 입력해주세요.");
    			$("#updatePw").attr("style", "border:1px solid red;");
    		}else{
    			if(checkPw==1){
    				var checkDelete = confirm("정말 회원탈퇴 하시겠습니까?\n(14일 안에 다시 로그인하시면 회원정보가 복구됩니다.)");
    				if(checkDelete == true){
	        			$("#updateForm").attr("action", "/user_join/delete");
    	    			$("#updateForm").submit();
    				}
        		}else{
        			alert("비밀번호가 틀렸습니다.");
        			$("#updatePw").attr("style", "border:1px solid gold;");
        			$("#txtPwCheck").text()
        		}
    		}
    		
    	});
    	
    	$("#btnUpdatePw").click(function(){
    		var btnTxt = $("#btnUpdatePw").val();
    		switch(btnTxt){
    			case "비밀번호 변경":
    				if(checkPw==1){
        				$("#divUpdatePw").attr("style", "");
        				$("#divCanclePw").attr("style","");
        				$("#updatePw").attr("disabled","disabled");
    					$("#txtPwCheck").text("8 ~ 20 자리의 비밀번호를 입력해주세요.");
	    	    		$("#txtPwCheck").attr("style","color:gray;");
        	    		$("#btnUpdatePw").attr("class", "btn btn-success btn-user btn-block");
        	    		$("#btnUpdatePw").val("변경완료");
    				}else{
    					$("#txtPwCheck").text("현재 비밀번호를 확인해주세요.");
	    	    		$("#txtPwCheck").attr("style","color:gold;");
    				}
    				break;
    			case "변경완료":
    				if(checkChangePw==1 && checkPw==1){
						$("#divUpdatePw").attr("style", "display:none;");
        				$("#divCanclePw").attr("style", "display:none;");
	    				$("#btnUpdatePw").attr("class", "btn btn-primary btn-user btn-block");
	    	    		$("#btnUpdatePw").val("비밀번호 변경");
	    	    		$("#hiddenForm").submit();
    				}
    				break;
    		}
    	
    	});
    	
    	$("#btnCanclePw").click(function(){
			$("#divUpdatePw").attr("style", "display:none;");
			$("#txtPwCheck").text("");
    		$("#txtPwCheck").attr("style","color:gray;");
    		$("#joinPw").val("");
    		$("#joinPwCheck").val("");
    		$("#joinPw").attr("style", "");
    		$("#joinPwCheck").attr("style", "");
    		$("#updatePw").removeAttr("disabled");
    		$("#updatePw").val("");
    		$("#updatePw").attr("style", "");
    		$("#updatePw").attr("placeholder", "현재 비밀번호");
    		$("#btnUpdatePw").attr("class", "btn btn-primary btn-user btn-block");
    		$("#btnUpdatePw").val("비밀번호 변경");
			$("#divCanclePw").attr("style", "display:none;");
    		
    	});
    	
    	$("#btnMain").click(function(){
    		location.href="/";
    	});
    });
</script>
<head>
  <title>회원정보 변경</title>
	
</head>

<body class="bg-gradient-primary">
<form action="/user_join/update_pw" id="hiddenForm">
	<input type="hidden" id="hiddenPw" name="hiddenPw"/>
</form>  
  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <div class="row">
		  <div class="col-lg-2"></div>
          <div class="col-lg-8">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">정보 수정</h1>
              </div>
              <form class="user" action="/user_join/update_run" method="post" id="updateForm">
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0" >
                    <input type="email" class="form-control form-control-user" id="joinEmail" name="joinEmail" placeholder="이메일 주소"  value="${userVo.u_email }" disabled="disabled">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-8 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="updatePw" name="joinPw" placeholder="현재 비밀번호" required="required">
                  </div>
                  <div class="col-sm-4">
                    <input type="button" class="btn btn-primary btn-user btn-block" id="btnUpdatePw" value="비밀번호 변경" >
                  </div>
                </div>
                <div class="form-group row" id="divUpdatePw" style="display:none;">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="joinPw" name="joinPw" placeholder="비밀번호 변경" required="required">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="joinPwCheck" placeholder="비밀번호 변경확인" required="required" disabled="disabled">
                  </div>
                </div>
                <div class="form-group row" >
                	
                	<div class="col-sm-8 mb-3 mb-sm-0">
                    	&nbsp &nbsp &nbsp <span id="txtPwCheck" style="color:gray;"></span>
                    </div>
	                <div class="col-sm-4" id="divCanclePw" style="display:none">
	                    <input type="button" class="btn btn-secondary btn-user btn-block" id="btnCanclePw" value="취소" >
	                </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="joinName" name="joinName" placeholder="이름" value="${userVo.u_name}" required="required">
                </div>
                <div class="form-group row">
                  <div class="col-sm-8 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="joinPostcode" name="joinPostcode" readonly="readonly" placeholder="우편번호" required="required" value="${userVo.u_postcode }">
                  </div>
                  <div class="col-sm-4">
                	<a href="#" onclick="searchAddress()" class="btn btn-primary btn-user btn-block">우편번호 찾기</a>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" id="joinAddress" name="joinAddress" class="form-control form-control-user" placeholder="주소" readonly="readonly" value="${userVo.u_address } ${userVo.u_detail} ${userVo.u_local}">
				  <span id="guide" style="color:#999;display:none"></span>
                </div>
                <div class="form-group row">
                  <div class="col-sm-8 mb-3 mb-sm-0">
                    <input type="text" id="joinDetailAddress" name="joinDetailAddress" class="form-control form-control-user" placeholder="상세주소" value="${userVo.u_localextra }">
               	  </div>
                  <div class="col-sm-4">
                	<input type="text" id="joinExtraAddress" class="form-control form-control-user" placeholder="" readonly="readonly">
                  </div>
                </div>
                <div class="form-group row">
                	<div class="col-sm-6 mb-3 mb-sm-0">
                		<input type="button" class="btn btn-primary btn-user btn-block" id="btnUpdate" value="수정완료">
                	</div>
	                <div class="col-sm-6">
	                	<input type="button" class="btn btn-danger btn-user btn-block" id="btnDelete" value="회원탈퇴">
	                </div>
                </div>
              </form>
              <hr>
              <div class="col-sm-12 mb-3 mb-sm-0">
				<input type="button" class="btn btn-success btn-user btn-block" id="btnMain" value="메인">
              </div>
            </div>
          </div>
          <div class="col-lg-2"></div>
        </div>
      </div>
    </div>

  </div>

</body>

<%@include file="../include/footer.jsp" %>