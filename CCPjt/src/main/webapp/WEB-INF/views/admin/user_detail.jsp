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
    $(document).ready(function(){
    	$("#btnUserPwUpdate").click(function(){
    		var checkConfirm = confirm("${userDetailVo.u_email } 로 새 비밀번호를 전송하겠습니까?");
    		if(checkConfirm==true){
    			var u_email = '${userDetailVo.u_email }';
    			var url = "/admin/send_newPw"
    	    	var data = {
    	    		"u_email" : u_email
    	    	}
    	    	$.ajax({
    	    		"type" : "post",
    	    		"url" : url,
    	    		"headers" : {
    	    			"Content-Type" : "application/json",
    	    			"X-HTTP-Method-Override" : "post"
    	    		},
    	    		"dataType" : "text",
    	    		"data" : JSON.stringify(u_email),
    	    		"success" : function(receivedData){
            			var result = receivedData.trim();
            			if(result == "true"){
            				var txt = "${userDetailVo.u_email } 로 새 비밀번호를 전송하였습니다."
                		   	alert(txt);
            	  	  	}else{
            	   		 	alert("발송 실패");
            	   		}
            		}
            	})		
    		}
    	});
    	
    	$("#btnMain").click(function(){
    		location.href="/";
    	});
    });
</script>
<head>
  <title>회원 정보 조회</title>
</head>

<body class="bg-gradient-primary">
<form action="/user_join/update_pw" id="hiddenForm">
	<input type="hidden" id="hiddenPw" name="hiddenPw"/>
</form>  
  <div class="container">
    <div class="row justify-content-center">
   <div class="col-xl-8 col-lg-12 col-md-9">
    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">회원 정보 조회</h1>
              </div>
              <form class="user"  method="post" >
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0" >
                    <input type="email" class="form-control form-control-user" id="userEmail" name="userEmail" value=" 이메일주소 : ${userDetailVo.u_email }" disabled="disabled">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="button" class="btn btn-primary btn-user btn-block" id="btnUserPwUpdate" value="비밀번호 변경" >
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="userName" name="userName"  value="이름 : ${userDetailVo.u_name}" disabled="disabled">
                </div>
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="userPostcode" name="userPostcode" readonly="readonly"  disabled="disabled" value="우편번호 : ${userDetailVo.u_postcode }">
                  </div>
                </div>
                <div class="form-group">
	                <div class="form-group row">
	                  <div class="col-sm-3 mb-3 mb-sm-0">
	                    <input type="text" id="userAddress" name="userAddress" class="form-control form-control-user"  value="지역 : ${userDetailVo.u_address }" disabled="disabled">
	               	  </div>
	               	  <div class="col-sm-3 mb-3 mb-sm-0">
	                    <input type="text" id="userDetail" name="userDetail" class="form-control form-control-user"  value="선거구 : ${userDetailVo.u_detail }" disabled="disabled">
	               	  </div>
	               	  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <input type="text" id="userLocal" name="userLocal" class="form-control form-control-user" value="주소 : ${userDetailVo.u_local }" disabled="disabled">
	               	  </div>
	               	</div>
               	</div>
                <div class="form-group row">
                  <div class="col-sm-8 mb-3 mb-sm-0">
                    <input type="text" id="userLocalextra" name="userLocalextra" class="form-control form-control-user" value="상세주소 : ${userDetailVo.u_localextra }" disabled="disabled">
               	  </div>
                  <div class="col-sm-4">
                	<input type="text" id="joinExtraAddress" class="form-control form-control-user" placeholder="" disabled="disabled">
                  </div>
                </div>
              </form>
              <hr>
              <div class="col-sm-12 mb-3 mb-sm-0">
				<input type="button" class="btn btn-success btn-user btn-block" id="btnMain" value="메인">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</div>
</body>

<%@include file="../include/footer.jsp" %>