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
    	$("#btnMemberInsert").click(function(){
    		var memberEmail = $("#userEmail").val();
    		var checkConfirm = confirm( memberEmail+"로 의원 초대를 하시겠습니까?");
    		if(checkConfirm==true){
    			$("#memberForm").submit();
//     			location.href="/admin/member_insert_run?u_email="+memberEmail;	
    		}
    	});

    	$("#btnCancle").click(function(){
    		location.href="/admin/member_selectArea";
    	});

    	$("#btnFile").click(function(){
    		$("#fileUpload").click();
    	});
    	
    	$("#fileUpload").change(function() {
    		var filename = this.files[0].name;
    		$("#btnFile").val(filename);
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
    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <div class="row">
		  <div class="col-lg-2"></div>
          <div class="col-lg-8">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">의원 등록</h1>
              </div>
              <form class="user" id="memberForm" action="/admin/member_insert_run" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                	<div class="col-sm-12 mb-3 mb-sm-0" >
                    	<input type="email" class="form-control form-control-user" id="userEmail" name="u_email" placeholder="이메일" >
                 	</div>
                </div>
	            <div class="form-group">
	                <div class="form-group row">
	                  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <input type="text" class="form-control form-control-user" id="userName" name="u_name"  placeholder="이름" >
                 	  </div>
	               	  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <input type="file" id="fileUpload" name="file" style="display:none;">
                    	<input type="button" class="btn btn-success btn-user btn-block" id="btnFile" value="사진업로드" >
                 	  </div>
	               	</div>
               	</div>
                <div class="form-group">
	                <div class="form-group row">
	                  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <input type="text" id="userAddress" name="u_address" class="form-control form-control-user"  value="${a_name }" readonly="readonly">
	               	  </div>
	               	  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <input type="text" id="userDetail" name="u_detail" class="form-control form-control-user"  value="${detailDataVo.d_name }" readonly="readonly">
	               	  </div>
	               	</div>
               	</div>
<!--                 <div class="form-group row"> -->
<!--                   <div class="col-sm-8 mb-3 mb-sm-0"> -->
<%--                     <input type="text" id="userLocalextra" name="userLocalextra" class="form-control form-control-user" value="상세주소 : ${userDetailVo.u_localextra }" disabled="disabled"> --%>
<!--                	  </div> -->
<!--                   <div class="col-sm-4"> -->
<!--                 	<input type="text" id="joinExtraAddress" class="form-control form-control-user" placeholder="" disabled="disabled"> -->
<!--                   </div> -->
<!--                 </div> -->
              </form>
<!--               <hr> -->
<!--               <div class="col-sm-12 mb-3 mb-sm-0"> -->
<!-- 				<input type="button" class="btn btn-success btn-user btn-block" id="btnMain" value="목록"> -->
<!--               </div> -->

                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="button" class="btn btn-primary btn-user btn-block" id="btnMemberInsert" value="의원 등록" >
                  </div>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="button" class="btn btn-secondary btn-user btn-block" id="btnCancle" value="취소" >
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