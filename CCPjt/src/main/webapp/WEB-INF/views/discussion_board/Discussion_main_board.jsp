<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
	* {box-sizing: border-box}
	body {font-family: Verdana, sans-serif; margin:0}
	
	/* Slideshow container */
	.slideshow-container {
	  position: relative;
	}
	
	/* Slides */
	.mySlides {
	  display: none;
	  padding: 80px;
	  text-align: center;
	}
	
	/* Next & previous buttons */
	.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;
	  width: auto;
	  margin-top: -30px;
	  padding: 16px;
	  color: #888;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	}
	
	/* Position the "next button" to the right */
	.next {
	  position: absolute;
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover, .next:hover {
	  background-color: rgba(0,0,0,0.8);
	  color: white;
	}
	
	/* The dot/bullet/indicator container */
	.dot-container {
	    text-align: center;
	    padding: 20px;
	    background: #ddd;
	}
	
	/* The dots/bullets/indicators */
	.dot {
	  cursor: pointer;
	  height: 15px;
	  width: 15px;
	  margin: 0 2px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	  transition: background-color 0.6s ease;
	}
	
	/* Add a background color to the active dot/circle */
	.active, .dot:hover {
	  background-color: #717171;
	}
	
	/* Add an italic font style to all quotes */
	q {font-style: italic;}
	
	/* Add a blue color to the author */
	.author {color: cornflowerblue;}
</style>


<div class="slideshow-container">
	<select>
		<option>토론 분류 select1</option>
		<option>토론 분류 select2</option>
		<option>토론 분류 select3</option>
	</select>

	<div class="mySlides">
	  <q style="font-size: 40px">토론 주제</q>
	  <p>- 토론 찬성 <input type="radio" name ="rdo_select"> </p>
	  <p>- 토론 반대 <input type="radio" name ="rdo_select"> </p>
	</div>
	
	<div class="mySlides">
	  <q style="font-size: 40px">토론 주제1</q>
	  <p>- 토론 찬성 <input type="radio" name ="rdo_select"> </p>
	  <p>- 토론 반대 <input type="radio" name ="rdo_select"> </p>
	</div>
	
	<div class="mySlides">
	  <q style="font-size: 40px">토론 주제2</q>
	  <p>- 토론 찬성 <input type="radio" name ="rdo_select"> </p>
	  <p>- 토론 반대 <input type="radio" name ="rdo_select"> </p>
	</div>
	
	<div class="mySlides">
	  <q style="font-size: 40px">토론 주제3</q>
	  <p>- 토론 찬성 <input type="radio" name ="rdo_select"> </p>
	  <p>- 토론 반대 <input type="radio" name ="rdo_select"> </p>
	</div>
	
	<a class="prev" onclick="plusSlides(-1)">❮</a>
	<a class="next" onclick="plusSlides(1)">❯</a>
</div>

<div class="dot-container">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
</div>

<div style="text-align: right;">
	<input type="button" id="btn_Discussion_rec" value="토론주제 추천 게시판" >
</div>


<script>
	var slideIndex = 1;
	showSlides(slideIndex);
// 	console.log("slideIndex값 : " + slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
		console.log("n값 : " + n);
	  var i; 
	  var slides = document.getElementsByClassName("mySlides");
// 	  console.log("slides.length  : " + slides.length);
	  console.log(slides);
	  var dots = document.getElementsByClassName("dot");
	  
	  if (n > slides.length) {slideIndex = 1}
	  
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	}
	
	// 토론 주제 선정 게시판버튼
	$("#btn_Discussion_rec").click(function () {
		location.href = "/discussion_board/Discussion_res_board";
		console.log("버튼 클릭");
	})
</script>

<%@include file="../include/footer.jsp" %>
