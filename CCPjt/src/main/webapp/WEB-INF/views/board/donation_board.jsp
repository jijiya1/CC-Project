<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<title>정책 후원 모금</title>
<!--[if lte IE 7]><script src="lte-ie7.js"></script><![endif]-->
<script>
$(document).ready(function(){
	
	});
	
</script>	

<style>

html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,

	p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,

	dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,

	i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,

	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,

	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,

	output, ruby, section, summary, time, mark, audio, video {

	margin: 0;

	padding: 0;

	border: 0;

	font-size: 100%;

	do: inherit;

	vertical-align: baseline;

}

.donation_main_btn{
	padding: 10px;
}

article, aside, details, figcaption, figure, footer, header, hgroup,

	menu, nav, section {

	display: block;

}



blockquote, q {

	quotes: none;

}



blockquote : before, blockquote : after, q : before, q : after {

	content: '';

	content: none;

}



table {

	border-collapse: collapse;

	border-spacing: 0;

}

/*css 초기화*/



.card {

	height: 400px;

	width: 350px;

	border-radius: 15px;

	display: inline-block;

	margin-top: 30px;

	margin-left: 30px;

	margin-bottom: 30px;

	position: relative;

	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

	overflow: hidden;

}



.card-header {

	-webkit-transition: 0.5s; /*사파리 & 크롬*/

    -moz-transition: 0.5s;  /*파이어폭스*/

    -ms-transition: 0.5s;	/*인터넷 익스플로러*/

    -o-transition: 0.5s;  /*오페라*/

    transition: 0.5s;

	width: 100%;

	height: 270px;

	border-radius: 15px 15px 0 0;

/* 	background-image: url("/resources/sponsor_images/haeyang.jpg"); */

	background-size: 100% 280px;

	background-repeat: no-repeat;	

}

.card-header img{
	width : 100%;
	height : 100%;
	background-repeat: repeat;
}



.card:hover .card-header  {

	opacity: 0.8;

	height: 100px;

}



.card-header-is_closed{

    background-color: #EF5A31 ;

    color: #FFF ;

    font-weight: bold ;

    text-align: center ;

    float: right;

    margin: 15px 15px 0 0;

    border-radius: 50%;

    font-weight: bold;

    padding: 10px 10px;

    line-height: 20px;

}



h1 {

    font-size: 22px;
	letter-spacing:0px;
    font-weight: bold;

}



.card-body {

}



.card-body-header{

	line-height: 15px;

	margin: 5px 15px 0px 15px;

}



.card-body-description  {

    opacity: 0;

    color: #757B82;

    line-height: 25px;

    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/

    -moz-transition: .2s ease-in-out; /*파이어폭스*/

    -ms-transition: .2s ease-in-out; /*익스플로러*/

    -o-transition: .2s ease-in-out; /*오페라*/

    transition : .2s ease-in-out;

    overflow: hidden;

	height: 180px;

	margin: 5px 20px;

}



.card:hover .card-body-description {

    opacity: 1;

    -webkit-transition: .5s ease-in-out;

    -moz-transition: .5s ease-in-out;

    -ms-transition: .5s ease-in-out;

    -o-transition: .5s ease-in-out;

    transition : .5s ease-in-out;

    overflow: scroll;

}



.card-body-hashtag {

	color: #2478FF;

	font-style: italic;

}



.card-body-footer {

  	position: absolute; 

  	margin-top: 15px;

  	margin-bottom: 6px;

    bottom: 0; 

    width: 314px;

    font-size: 14px;

    color: #9FA5A8;

    padding: 0 15px;

}



.icon {

    display: inline-block;

    vertical-align: middle;

    margin-right: 2px;

}



.icon-view_count {

    width: 25px;

    height: 17px;


}



.icon-comments_count {

	margin-left: 5px;

	width: 25px;

    height: 17px;


}



.reg_date {

	float: right;

}



</style>
<div>
<div class="donation_main_btn">
	<div class="col-md-2">
		<form class="form-inline mr-auto w-100 navbar-search">
	     <div class="input-group">
	     	<select>
	     		<option>소속당</option>
	     		<option>이름</option>
	     		<option>내용</option>
	     	</select>
	       <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
	       <div class="input-group-append">
	         <button class="btn btn-primary" type="button">
	           <i class="fas fa-search fa-sm"></i>
	         </button>
	         
	         <input type="button" value="글 작성" id="btnWrite" class="btn btn-primary">
	       </div>
	     </div>
	   </form>
	</div>
	<div class="col-md-2">
	<select>
		<option>
	</select></div>
</div>
 <div class="row">
 <c:forEach items="${doList}" var="doVo">
 
 
	  <div class="col-md-3">
		<a href=""> <!-- 클릭 시 링크 설정 -->
			<div class="card">
				<!-- 카드 헤더 -->
				<div class="card-header" >
					<img src="/resources/sponsor_images/haeyang.jpg">
			 
				</div>
		
				<!--  카드 바디 -->
		
				<div class="card-body">
					
		
		
					<!--  카드 바디 헤더 -->
		
					<div class="card-body-header">
						
						<h1>${doVo.b_title} </h1>
		
						<p class="card-body-hashtag">${doVo.b_subtitle}</p>
		
						 <p class = "card-body-nickname"> 
		
		                                 작성자: ${doVo.b_writer} ( ${doVo.u_id} )
		
		           		         </p>
		
					</div>
		
					<p class="card-body-description">
		
						${doVo.b_content}
		
					</p>
		
					<!--  카드 바디 본문 -->
		
		
		
					<!--  카드 바디 푸터 -->
		
					<div class="card-body-footer">
		
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
		
						기부 금액  : ${doVo.b_money}
					</div>
			</div>
		</div>
	   </a>
	  </div><!-- col-md-3 -->
	  </c:forEach>
 	</div><!-- row div -->
 
	</div>
	
<div class="col-md-4"></div>
<div class="col-md-4">
	<nav>
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="#">Previous</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">1</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">2</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">3</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">4</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">5</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">Next</a>
			</li>
		</ul>
	</nav>
</div>
<div class="col-md-4"></div>

<%@include file="../include/footer.jsp" %>
