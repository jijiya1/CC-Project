<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script>

$(document).ready(function(){
	var message = "${message}";
	if(message == "searchFail"){
		var failEmail = "${inputEmail}";
		console.log("failEmail = "+failEmail);
		$("#u_email").val(failEmail);
		$("#u_email").attr("style", "border:1px solid green;");
		$("#u_name").attr("style", "border:1px solid gold;");
		alert("일치하지 않는 이름입니다.");
	}
	var checkEmail = 0;
	var checkName = 0;
	
	$("#u_email").blur(function(){
		var inputEmail = $("#u_email").val();
		if(inputEmail==null || inputEmail==""){
			$("#u_email").attr("style", "border:1px solid gold;");
			return;
		}
		
		var url = "/user_join/search_email"
		var data = {
				"inputEmail" : inputEmail
		}
		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(inputEmail),
			"success" : function(receivedData){
				var result = receivedData.trim();
				if(result == 'true'){
					checkEmail=1;
    	    		$("#u_email").attr("style", "border:1px solid green;");
				}else if(result == 'false'){	
					$("#u_email").attr("style", "border:1px solid gold;");
					var select = confirm("가입되어있지 않은 이메일입니다.\n회원가입 하시겠습니까?");
					if(select==true){
						location.href="/user_join/join_form?";
					}
    	    	}
			}
		})
	});
	$("#btnSearchPw").click(function(){
		if(checkEmail ==1){
			$("#searchPwForm").submit();
		}
	});
	$("#u_name").keyup(function(e) {
		if (e.keyCode == 13) {
			if(checkEmail ==1){
				$("#searchPwForm").submit();
			}
		}
	});
});
</script>
<head>

<title>CCPJT - 비밀번호 찾기</title>

</head>
<body class="bg-gradient-primary">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-xl-6 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
	              <div class="text-center">
	                <h1 class="h4 text-gray-900 mb-4">비밀번호 찾기</h1>
	              </div>
                  <div class="text-center">
                  </div>
                  <form class="user" id="searchPwForm" action="/user_join/searchPw_run" method="POST">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="u_email" name="u_email" aria-describedby="emailHelp"
                       placeholder="이메일을 입력해주세요" >
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="u_name" name="u_name" placeholder="이름" >
                    </div>
                    <input type="button" id="btnSearchPw" class="btn btn-primary btn-user btn-block" value="확인">
                    
                    <hr>
                  </form>
                  <div class="row">
					<div class="col-md-6 text-left">
                	  <a class="small" href="/login">로그인</a>
					</div>
					<div class="col-md-6 text-right">
              	 	  <a class="small" href="/user_join/join_form">회원가입</a>
					</div>
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