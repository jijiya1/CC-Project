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
	var checkPw=0;
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
    	$("#joinPw").blur(function(){
    		var pwVal = $("#joinPw").val();
    		if(pwVal.length > 8 && pwVal.length < 20){
    				$("#joinPw").attr("style", "");
        			$("#joinPwCheck").attr("style", "");
    				$("#txtPwCheck").text("비밀번호 확인해주세요.");
    				$("#txtPwCheck").attr("style", "color:green;");
    				$("#joinPwCheck").removeAttr("disabled");
    		}else{
				$("#joinPw").attr("style", "border:1px solid gold;");
    			$("#joinPwCheck").attr("style", "border:1px solid gold;");
				$("#txtPwCheck").text("유효하지않은 비밀번호입니다.");
				$("#txtPwCheck").attr("style", "color:gold;");
				$("#joinPwCheck").attr("disabled", "disabled");
				checkPw = 0;
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
				checkPw = 1;
    		}else{
    			$("#joinPw").attr("style", "border:1px solid gold;");
    			$("#joinPwCheck").attr("style", "border:1px solid gold;");
				$("#txtPwCheck").text("비밀번호가 다릅니다.");
				$("#txtPwCheck").attr("style", "color:gold;");
				checkPw = 0;
    		}
    	});
    	
    	$("#btnUpdate").click(function(){
    		if(checkPw==1 && checkAdd==1){
				$("#updateForm").submit();
    		}else{
    			checkFormInfo();
    			alert("가입실패 : 정보를 정확히 입력하세요.");
    		}
    	});
    	$("#btnDelete").click(function(){
    		if(checkPw==1){
    			$("#updateForm").attr("action", "/user_join/delete);
    			$("#updateForm").submit();
    		}else{
    			$("#joinPw").attr("style", "border:1px solid gold;");
    			$("#joinPwCheck").attr("style", "border:1px solid gold;");
    			$("#txtPwCheck").text()
    		}
    	});
    });
</script>
<head>
  <title>회원정보 변경</title>
	
</head>

<body class="bg-gradient-primary">
  
  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <div class="row">
		  <div class="col-lg-2"></div>
          <div class="col-lg-8">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
              </div>
              <form class="user" action="/user_join/update_run" method="post" id="updateForm">
                <div class="form-group row">
                  <div class="col-sm-8 mb-3 mb-sm-0" >
                    <input type="email" class="form-control form-control-user" id="joinEmail" name="joinEmail" placeholder="이메일 주소"  value="${userVo.u_email }" disabled="disabled">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="joinPw" name="joinPw" placeholder="비밀번호" required="required">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="joinPwCheck" placeholder="비밀번호 확인" required="required" disabled="disabled">
                  </div>
                  	&nbsp &nbsp &nbsp <span id="txtPwCheck" style="color:gray;">8 ~ 20 자리의 비밀번호를 입력해주세요.</span>

                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="joinName" name="joinName" placeholder="이름" required="required">
                </div>
                <div class="form-group row">
                  <div class="col-sm-8 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="joinPostcode" readonly="readonly" placeholder="우편번호" required="required">
                  </div>
                  <div class="col-sm-4">
                	<a href="#" onclick="searchAddress()" class="btn btn-primary btn-user btn-block">우편번호 찾기</a>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" id="joinAddress" name="joinAddress" class="form-control form-control-user" placeholder="주소" readonly="readonly">
				  <span id="guide" style="color:#999;display:none"></span>
                </div>
                <div class="form-group row">
                  <div class="col-sm-8 mb-3 mb-sm-0">
                    <input type="text" id="joinDetailAddress" name="joinDetailAddress" class="form-control form-control-user" placeholder="상세주소">
                </div>
                  <div class="col-sm-4">
                	<input type="text" id="joinExtraAddress" class="form-control form-control-user" placeholder="" readonly="readonly">
                  </div>
                </div>
                <input type="button" class="btn btn-primary btn-user btn-block" id="btnUpdate" value="수정완료">
                <hr>
                <input type="button" class="btn btn-danger btn-user btn-block" id="btnDelete" value="회원탈퇴">
              </form>
              <hr>
              <div class="row">
				<div class="col-md-6 text-right">
              	  <a class="small" href="/">메인</a>
				</div>
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