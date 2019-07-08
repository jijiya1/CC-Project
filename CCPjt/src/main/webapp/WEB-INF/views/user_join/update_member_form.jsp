<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>
<style>
.form-group{
	color:black;
};

</style>

<script>
	var checkChangePw=0;
	var checkAdd=0;

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
    	
    	$("#u_party").change(function(){
    		var value = $("#u_party").val();
    		$("#txtInput").val(value);
    	});
    	
    	$("#btnUpdate").click(function(){
    		if(checkChangePw==1){
				$("#updateForm").submit();
    		}else{
    			checkFormInfo();
    			alert("회원정보 수정 실패 : 정보를 정확히 입력하세요.");
    		}
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
              <form class="user" action="/user_join/update_member_run" method="post" id="updateForm">
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0" >
                    <input type="email" class="form-control form-control-user" id="joinEmail" name="u_email" placeholder="이메일 주소"  value="${memberVo.u_email }" >
                  </div>
                </div>
                <div class="form-group row" id="divUpdatePw">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="joinPw" name="u_pw" placeholder="비밀번호 변경" required="required">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="joinPwCheck" placeholder="비밀번호 변경확인" required="required" disabled="disabled">
                  </div>
                </div>
                <div class="form-group row" >
                	<div class="col-sm-12 mb-3 mb-sm-0">
                    	&nbsp &nbsp &nbsp <span id="txtPwCheck" style="color:gray;"></span>
                    </div>
                </div>
                <div class="form-group">
	                <div class="form-group row">
	                  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <input type="text" class="form-control form-control-user" id="joinName" name="u_name" placeholder="이름" value="${memberVo.u_name}" required="required" readonly="readonly">
                	  </div>
	               	  <div class="col-sm-5 mb-3 mb-sm-0">
	               	  	<input type="text" class="form-control form-control-user" id="txtInput" value="정당">
                	  
	               	  </div>
	               	  <div class="col-sm-1 mb-3 mb-sm-0">
		                    <select id="u_party" name='u_party' class="form-control form-control-user">
			 					<option value='정당' selected>정당</option>
							    <option value='더불어민주당'>더불어민주당</option>
							    <option value='자유한국당'>자유한국당</option>
							    <option value='바른미래당'>바른미래당</option>
							    <option value='민주평화당'>민주평화당</option>
							    <option value='정의당'>정의당</option>
							    <option value='민중당'>민중당</option>
							    <option value='대한애국당'>대한애국당</option>
							    <option value='무소속'>무소속</option>
							</select>
						</div>
	               	</div>
               	</div>
                
                <div class="form-group">
	                <div class="form-group row">
	                  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <input type="text" id="userAddress" name="u_address" class="form-control form-control-user"  value="${memberVo.u_address }" readonly="readonly">
	               	  </div>
	               	  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <input type="text" id="userDetail" name="u_detail" class="form-control form-control-user"  value="${memberVo.u_detail }" readonly="readonly">
	               	  </div>
	               	</div>
               	</div>
                
                <div class="form-group row">
                	<div class="col-sm-6 mb-3 mb-sm-0">
                		<input type="button" class="btn btn-primary btn-user btn-block" id="btnUpdate" value="가입완료">
                	</div>
	                <div class="col-sm-6">
	                	<input type="button" class="btn btn-success btn-user btn-block" id="btnMain" value="메인">
	                </div>
                </div>
                <input type="hidden" name="u_photo" value="${memberVo.u_photo }">
              </form>
            </div>
          </div>
          <div class="col-lg-2"></div>
        </div>
      </div>
    </div>

  </div>

</body>

<%@include file="../include/footer.jsp" %>