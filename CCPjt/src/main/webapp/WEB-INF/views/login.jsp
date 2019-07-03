<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="include/head.jsp" %>

<script>

$(document).ready(function(){
	var loginTryEmail = "${inputEmail}";
	var u_email = "${u_email}";
	var u_pw = "${u_pw}";
	if(u_email != ""){
		$("#u_email").val(u_email);
		$("#u_pw").val(u_pw);
		$("#keepLogin").attr("checked", "checked");
	}else{
		if(loginTryEmail != ""){
			$("#u_email").val(loginTryEmail);
			$("#u_pw").attr("placeholder","잘못입력하셨습니다.");
			$("#u_email").attr("style", "border:1px solid gold;");
			$("#u_pw").attr("style", "border:1px solid gold;");
		}else{
			$("#u_email").attr("style", "");
			$("#u_pw").attr("style", "");
		}
	}
	
	$("#btnLogin").click(function(){
		$("#loginForm").submit();
	});
});
</script>
<head>

  <title>Login</title>

</head>
<body class="bg-gradient-primary">
  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
<!--                     <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1> -->
                  </div>
                  <form class="user" id="loginForm" action="/login_run" method="POST">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="u_email" name="u_email" aria-describedby="emailHelp"
                       placeholder="이메일을 입력해주세요..." >
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="u_pw" name="u_pw" placeholder="비밀번호" >
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="keepLogin" name="keepLogin" >
                        <label class="custom-control-label" for="keepLogin">로그인정보 저장하기</label>
                      </div>
                    </div>
                    <input type="button" id="btnLogin" class="btn btn-primary btn-user btn-block" value="로그인">
                    
                    <hr>
<!--                     <a href="index.html" class="btn btn-google btn-user btn-block"> -->
<!--                       <i class="fab fa-google fa-fw"></i> Login with Google -->
<!--                     </a> -->
<!--                     <a href="index.html" class="btn btn-facebook btn-user btn-block"> -->
<!--                       <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook -->
<!--                     </a> -->
                  </form>
                  <div class="row">
					<div class="col-md-6 text-left">
                	  <a class="small" href="/user_join/find_password">비밀번호 찾기</a>
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
<%@include file="include/footer.jsp" %>