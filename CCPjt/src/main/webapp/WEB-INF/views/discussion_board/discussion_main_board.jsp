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
	  margin-top: 20px;
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
	
	#btn_Discussion_rec {
		margin-top: 15px;
		margin-bottom: 5px;
	}
	
	#replyButton {
		margin-left:30px;
		font-size: 20px;
	}
</style>

<p>데이터 확인 :  ${replyPaginnationDto}</p>

<div class="slideshow-container">
	<div>
		<select>
			<option>토론 분류 select1</option>
			<option>토론 분류 select2</option>
			<option>토론 분류 select3</option>
		</select>
		<input type="button" id="btn_Discussion_rec" value="토론주제 추천 게시판" style="float: right;" >
	</div>
	
	<c:forEach items="${discussionList }" var="discussion_boardVo" >
		<div class="mySlides" data-b_serialno ="${discussion_boardVo.b_serialno}">
			<q style="font-size: 50px">${discussion_boardVo.b_title } / ${discussion_boardVo.b_serialno}</q>
			<p> 토론에 대해서 <input type="radio" name = "radioSelect${discussion_boardVo.b_no }" class="radioYorN" data-YorN = "Y"></p>
			<p> 토론에 대해서 <input type="radio" name = "radioSelect${discussion_boardVo.b_no }" class="radioYorN" data-YorN = "N"></p>
		</div>
	</c:forEach>
	
	<a class="prev" onclick="plusSlides(-1)">❮</a>
	<a class="next" onclick="plusSlides(1)">❯</a>
</div>

<div class="dot-container">
	<c:forEach begin="1" end="${discussionListSize }" var= "i" >
		<span class="dot" onclick="currentSlide(${i})"></span> 
	</c:forEach>
</div>

<!-- 댓글 보기 버튼 -->
<input type="button" value="댓글 보기" id="btnReplyList"   >

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div id = "discussion_ReplyList">
			</div>
		</div>
	</div>
</div>



<script>
	var slideIndex = 1;
	
	// 현재 보고 있는 토론게시판 시리얼 번호
	var nowDiscussion_b_serialno = "${firstDiscussion_b_serialno}"; 
	// 현재 보고 있는 댓글 페이지 번호
	var nowReplyPage = 1; 
	// 현재 보고 있는 토론게시글 댓글수
		
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	  nowDiscussion_b_serialno = $(".mySlides").eq(slideIndex - 1).attr("data-b_serialno");
// 	  console.log("n:" + n);
// 	  console.log("nowDiscussion_b_bno :"+nowDiscussion_b_bno);
	  $("#discussion_ReplyList").html("");
	}
	
	function currentSlide(n) {
	  var number = showSlides(slideIndex = n);
	  nowDiscussion_b_serialno = $(".mySlides").eq(slideIndex - 1).attr("data-b_serialno");
// 	  console.log("nowDiscussion_b_bno :"+nowDiscussion_b_bno);
	  $("#discussion_ReplyList").html("");
	}
	
	function showSlides(n) {
		
	  var i; 
	  var slides = document.getElementsByClassName("mySlides");
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
	} //showSlides(n)
	
	
	// 토론 주제선정 게시판으로 이동버튼
	$("#btn_Discussion_rec").click(function () {
		location.href = "/discussion_board/discussion_res_board";
	})
	
	// 토론 찬성 또는 반대(radio 버튼)에 따른 기능구분
	$(".radioYorN").click(function () {
		var YorN = $(this).attr("data-YorN");
		console.log(YorN+"체크함");
	});
	
	// 댓글보기 버튼
	$("#btnReplyList").click(function () {
		var url = "/discussion_reply/list/"+nowDiscussion_b_serialno+"/"+nowReplyPage;
		$.getJSON(url, function (receivedData) {
			console.log("getDiscussionRepiyList, receivedData : " + receivedData);
			
			var strHtml = "";
			var borderColor = "";
			var YorN = "";
			var YorNColor = "";
			
			$(receivedData).each(function (i) {
				if (this.r_yesOrNo == "0") {
					borderColor = "primary"
					YorN = "찬성";
					YorNColor = "blue";
				} else if (this.r_yesOrNo == "1") {
					borderColor = "danger";
					YorN = "반대";
					YorNColor = "red";
				}//if

				strHtml += "<div class='card mb-1 py-0.1 border-left-"+borderColor+"'>"
				 		+ 		"<div class='card-body'>"
						+			"<p>"+this.r_no+". "+this.r_writer+ "<span style='float: right; color:"+YorNColor+";'>"+YorN+"</span>"+"</p>"
						+			"<p>"+this.r_content+"</p>"
						+			"<p style='text-align: right;'>"+this.r_up+" / "+ this.r_down+"</p>"
						+ 		"</div>"
						+  "</div>";
			});
			
			if(strHtml != ""){
				strHtml += 	"<div class='container-fluid'>"
							+	"<div class='row'>"
								+	"<div class='col-md-4'></div>"
								+	"<div class='col-md-4'>"
									+	"<ul class='pagination'>"
					 				+ 		"<li class='paginate_button page-item previous disabled' id='reply_previous'><a class='page-link href='#'>Previous</a></li>"
					 				+		"<li class='paginate_button page-item'><a class='page-link' data-reply_page = '1' href='#'>1</a></li>"
					 				+		"<li class='paginate_button page-item'><a class='page-link' data-reply_page = '2' href='#'>2</a></li>"
					 				+		"<li class='paginate_button page-item'><a class='page-link' data-reply_page = '3' href='#'>3</a></li>"
									+		"<li class='paginate_button page-item' id='reply_next'><a class='page-link href='#'>Next</a></li>"
				 				+		"</ul>";
				 				+	"</div>"
				 				+	"<div class='col-md-4'></div>"
		 				+	"</div>";
			}//if		
			$("#discussion_ReplyList").html(strHtml);
		});//$.getJSON(url, function (receivedData)
	});// $("#btnReplyList").click
	
	// 댓글 페이징 버튼
	$("#discussion_ReplyList").on("click",".page-link", function (e) {
		e.preventDefault();
		var reply_page =  $(this).attr("data-reply_page");
		nowReplyPage = reply_page;
		$("#btnReplyList").trigger("click");
		console.log(reply_page+" 페이지 버튼")
	})
</script>

<%@include file="../include/footer.jsp" %>
