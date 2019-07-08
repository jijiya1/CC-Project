<%@page import="com.kh.domain.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box;}
.mySlides-test {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container-test {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/*Caption text */
 .text-test {
/*    color: #f2f2f2; */
   font-size: 15px;
   padding: 8px 12px;
   position: relative;
   bottom: 8px;
   width: 100%;
/*    text-align: center; */
}

/* The dots/bullets/indicators */
.dot-test {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active-test {
  background-color: #717171;
}

/* Fading animation */
.fade-test {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 5.0s;
  animation-name: fade;
  animation-duration: 5.0s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

.container-test {
  position: relative;
  width: 50%;
}

.image-test {
  display: block;
  width: 100%;
  height: auto;
}

.overlay-test {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: #008CBA;
}

.container-test:hover .overlay-test {
  opacity: 1;
}

.text-test {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}


</style>
<div class="col-md-4">

<div class="slideshow-container slideshow-container-test">

<div class="container container-test">
<div class="mySlides fade mySlides-test fade-test">
  <img src="/resources/img/test1.jpg" style="width:100%" class="image-test">
  	<div class="overlay overlay-test">
  	<div class="text text-test">
  	My Name is John
  	테스트01
  	</div>
  	</div>
  </div>
  </div>

<div class="container container-test">
<div class="mySlides fade mySlides-test fade-test">
  <img src="/resources/img/test1.jpg" style="width:100%">
  	<div class="overlay overlay-test">
  	<div class="text text-test">
  	My Name is John
  	테스트01
  	</div>
  	</div>
  </div>
  </div>

<div class="container container-test">
<div class="mySlides fade mySlides-test fade-test">
  <img src="/resources/img/test1.jpg" style="width:100%">
  	<div class="overlay overlay-test">
  	<div class="text text-test">
  	My Name is John
  	테스트01
  	</div>
  	</div>
  </div>
  </div>

</div>
<br>

<div style="text-align:center">
  <span class="dot-test"></span> 
  <span class="dot-test"></span> 
  <span class="dot-test"></span> 
</div>
</div>

<script>
var slideIndexTest = 0;
showSlidesTest();

function showSlidesTest() {
  var i;
  var slidesTest = document.getElementsByClassName("mySlides-test");
  var dotsTest = document.getElementsByClassName("dot-test");
  for (i = 0; i < slidesTest.length; i++) {
    slidesTest[i].style.display = "none";
  }
  slideIndexTest++;
  if (slideIndexTest > slidesTest.length) {slideIndexTest = 1}    
  for (i = 0; i < dotsTest.length; i++) {
    dotsTest[i].className = dotsTest[i].className.replace(" active-test", "");
  }
  slidesTest[slideIndexTest-1].style.display = "block";  
  dotsTest[slideIndexTest-1].className += " active-test";
  setTimeout(showSlidesTest, 5000); // Change image every 2 seconds
}
</script>

<%@include file="../include/footer.jsp" %>