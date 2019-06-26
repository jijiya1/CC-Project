<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>

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
	.dactive, .dot:hover {
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

<p>데이터 확인 : </p>

<div class="slideshow-container">
	<div>
		<input type="button" id="btn_Discussion_rec" value="토론주제 추천 게시판" style="float: right;" >
	</div>
	
	<c:forEach items="${discussionList }" var="boardVo_discussion" >
		<div class="mySlides" data-b_serialno ="${boardVo_discussion.b_serialno}" data-YorNSelect ="">
			<q style="font-size: 50px">${boardVo_discussion.b_title } / ${boardVo_discussion.b_serialno}</q>
			<p> 토론에 대해서 찬성 <input type="radio" name = "radioSelect${boardVo_discussion.b_no }" class="radioYorN" data-YorN = "Y"></p>
			<p> 토론에 대해서 반대 <input type="radio" name = "radioSelect${boardVo_discussion.b_no }" class="radioYorN" data-YorN = "N"></p>
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
<br>

<!-- 댓글(의견) 달기 부분 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" id = "reply_Textarea">
			<!-- 댓글 리스트 표시 부분 -->
			<a href="#" class="btn btn-primary btn-icon-split btnReplyList"  id="btnReplyList">                     
				<span class="icon text-white-50">
					<i class="fas fa-flag"></i>
				</span>
				<span class='text'>댓글 보기</span>
			</a>

		</div>
	</div>
</div>
<br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div id = "discussion_ReplyList">
				
			</div>
		</div>
	</div>
</div>

<!-----------------------------------  스크립트 ----------------------------------->
<script>
	// 현재 보고 있는 토론게시판 시리얼 번호
	var nowDiscussion_b_serialno = "${firstDiscussion_b_serialno}"; 
	
	// 현재 보고 있는 댓글 페이지 번호
	var nowReplyPage = 1;
	
	//임시 로그인 중인 사용자 -------------------------------------------
	var r_writer = "홍길동(user1)";
	// --------------------------------------------------------------------
	
	// 현재 댓글이 표시 되고 있는지
	var replyListShow = false;
	
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {		
	  showSlides(slideIndex += n);
	  nowDiscussion_b_serialno = $(".mySlides").eq(slideIndex - 1).attr("data-b_serialno");
	  nowSlideIndex = slideIndex - 1;
	  
// 	  console.log("n:" + n);
// 	  console.log("nowDiscussion_b_serialno :"+nowDiscussion_b_serialno);
	  $("#discussion_ReplyList").html("");
	  replyListShow =false;
	  
	  var YorNSelect = $(".mySlides").eq(slideIndex - 1).attr("data-YorNSelect");
// 	  console.log("YorNSelect :" +nowDiscussion_b_serialno +" / " + YorNSelect);
	  
	  if( YorNSelect != "") {
		  addReplyTextarea(YorNSelect);
	  } else {
		  addReplyListButton();
	  }
	}
	
	function currentSlide(n) {
	  var number = showSlides(slideIndex = n);
	  nowDiscussion_b_serialno = $(".mySlides").eq(slideIndex - 1).attr("data-b_serialno");
	  nowSlideIndex = slideIndex - 1;
// 	  console.log("nowDiscussion_b_bno :"+nowDiscussion_b_bno);
	  $("#discussion_ReplyList").html("");
	  replyListShow =false;
	  
	  var YorNSelect = $(".mySlides").eq(slideIndex - 1).attr("data-YorNSelect");
// 	  console.log("YorNSelect :" +nowDiscussion_b_serialno +" / " + YorNSelect);
	  
	  // 찬성 또는 반대를 체크한 토론만 댓글 입력창 뜨게하기
	  if( YorNSelect != "") {
		  addReplyTextarea(YorNSelect);
	  } else {
		  addReplyListButton();
	  }// if
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
	      dots[i].className = dots[i].className.replace(" dactive", "");
	  }
	  
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " dactive";
	} //showSlides(n)
	
	
	// 토론 주제선정 게시판으로 이동버튼
	$("#btn_Discussion_rec").click(function () {
		location.href = "/discussion_board/discussion_res_board";
	});//("#btn_Discussion_rec").click
	
	
	// 댓글 작성(쓰기) 텍스트 Area Html 추가 기능
	function addReplyTextarea(YorNSelect) {
		var strHtml = "";
		var borderColor = "";
		// #FF0000 -- 빨강 / 반대
		// #1E90FF -- 파랑 / 찬성
		
		if( YorNSelect == "Y") {
			borderColor = "#1E90FF";
		} else {
			borderColor = "#FF0000";
		}//if

		strHtml += "<textarea class='form-control r_content' id='r_content' style = 'box-sizing: border-box; border: solid 2px "+borderColor+"; padding: 10px;'></textarea>"
					// 댓글 보기 버튼(html 코드)
					+"<a href='#' class='btn btn-primary btn-icon-split btnReplyList' id='btnReplyList'>"
					+	"<span class='icon text-white-50'>"
					+		"<i class='fas fa-flag'></i>"
					+	"</span>"
					+	"<span class='text'>댓글 보기</span>"
					+"</a>"
					
					// 댓글 작성(쓰기)완료 버튼 (html 코드)
					+"<a href='#' class='btn btn-success btn-icon-split btnReplyWrite' style='float: right;'>"
					+	"<span class='icon text-white-50'>"
					+		"<i class='fas fa-check'></i>"
					+	"</span>"
					+	"<span class='text'>댓글(의견) 작성완료</span>"
					+"</a>";
		$("#reply_Textarea").html(strHtml);
	};//function addReplyTextarea()
	
	// 댓글 보기 버튼 html 추가 기능
	function addReplyListButton() {
		var strHtml = "";
		// 댓글보기 버튼 html 코드
		strHtml += "<a href='#' class='btn btn-primary btn-icon-split btnReplyList'  id='btnReplyList'>"
					+	"<span class='icon text-white-50'>"
					+		"<i class='fas fa-flag'></i>"
					+	"</span>"
					+	"<span class='text'>댓글 보기</span>"
					+"</a>"
		$("#reply_Textarea").html(strHtml);
	};//function addReplyTextarea()
	
	
	// 토론 찬성 또는 반대(radio 버튼)에 따른 기능구분
	$(".radioYorN").click(function () {
		var YorN_Select = $(this).attr("data-YorN");
// 		console.log(YorN_Select+"체크함");
		
		$(".mySlides").eq(slideIndex-1).attr("data-YorNSelect", YorN_Select);
		
		addReplyTextarea(YorN_Select);
	});// $(".radioYorN").click
	
	
	// 댓글 작성(쓰기)완료 버튼
	$("#reply_Textarea").on("click",".btnReplyWrite", function () {
		console.log("작성 완료 버튼");
		var r_content = $(".r_content").val(); // 댓글 내용 가져 오기
		var YorNSelect = $(".mySlides").eq(slideIndex - 1).attr("data-YorNSelect"); // 찬성 || 반대 정보 가져오기
// 		console.log("r_content : " + YorNSelect+ " / "+ r_content);
		
		// 공란일때 알림
		if(r_content == "") {
			alert("내용을 입력해주세요");
		} else {
			var url = "/discussion_reply/writeReply/"+YorNSelect;
			var sendData = {
					"b_serialno" : nowDiscussion_b_serialno,
					"r_writer" : r_writer,
					"r_content" : r_content
			};
			$.ajax ({
				"type" : "post",
				"url" : url,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method_Override" : "post"
				},
				"dataType" : "text",
				"data" : JSON.stringify(sendData),
				"success" : function (receiveData) {
					nowReplyPage = 1;
					getReplyList();
				}
			});//$.ajax
		}// if
	});// $("#reply_Textarea").on
	
	// 댓글보기 버튼
	$("#reply_Textarea").on("click",".btnReplyList", function (e) {
		e.preventDefault();
		
		if ( replyListShow == false ) {
			replyListShow =true
			getReplyList();
		} else {
			replyListShow =false
			$("#discussion_ReplyList").html("");
		}
		
	});// $("#btnReplyList").click
	
	
	// getJSON 댓글 리스트 가져오기 기능
	function getReplyList() {
// 		console.log("버튼 클릭");
		var url = "/discussion_reply/list/"+nowDiscussion_b_serialno+"/"+nowReplyPage;
		
		$.getJSON(url, function (receivedData) {
// 			console.log("getDiscussionRepiyList, receivedData11 : ", receivedData);
			
			var discussionReplyList = receivedData.discussionReplyList;
			var replyLikeInfoList = receivedData.replyLikeInfoList;
// 			console.log("discussionReplyList : " ,  discussionReplyList);
// 			console.log("replyLikeInfoList : " ,replyLikeInfoList);
			var strHtml = "";
			var borderColor = "";
			var YorN = "";
			var YorNColor = "";
			var totalReplyCount = 1;
			
			$(discussionReplyList).each(function (i) {
				if (this.r_yesOrNo == "0") {
					borderColor = "primary"
					YorN = "찬성";
					YorNColor = "blue";
				} else if (this.r_yesOrNo == "1") {
					borderColor = "danger";
					YorN = "반대";
					YorNColor = "red";
				}//if
				
				totalReplyCount = this.totalreplycount;
				var listR_no = parseInt(this.r_no);
				
// 				console.log("r_no" + listR_no)
				
				strHtml += "<div class='card mb-1 py-0.1 border-left-"+borderColor+"'>"
				 		+ 		"<div class='card-body'>"
						+			"<p>"+this.r_no+". "+this.r_writer+ "<span style='float: right; color:"+YorNColor+";'>"+YorN+"</span>"+"</p>"
						+			"<p>"+this.r_content+"</p>"
						+			"<p style='text-align: right;'>"
										// 좋아요 버튼

						+				"<a href='#' class='btn btn-primary btn-sm btnLike' data-r_no='"+this.r_no+"'";
						
											$(replyLikeInfoList).each(function (i) {
												if(this.r_no == listR_no && this.r_up == 1) {
													strHtml +=	"style = 'border: solid 3px; border-color: #F28705;'";
												} else {
													
												}
											})
											
				strHtml +=				">"
						+				"<span class='fas fa-thumbs-up'>&nbsp;"+this.r_upcount+"</span></a>&nbsp;"
										// 싫어요 버튼
						+				"<a href='#' class='btn btn-danger btn-sm btnDisLike' data-r_no='"+this.r_no+"'";
										$(replyLikeInfoList).each(function (i) {
											if(this.r_no == listR_no && this.r_down == 1) {
												strHtml +=	"style = 'border: solid 3px; border-color: #F28705;'";
											} else {
												
											}
										})
				strHtml +=				">"
						+				"<span class='fas fa-thumbs-down'>&nbsp;"+this.r_downcount+"</span></a></p> "
						+ 		"</div>"
						+  "</div>";
			});//$(receivedData).each
			
			var startPage = 1;
			var endPage = 10;
			var perPage = 5;
			
			// 리플 페이징 수
			var replyPaging = parseInt(totalReplyCount/perPage);
			if (totalReplyCount%perPage > 0) {
				replyPaging += 1;
			}; //if
			
			var pageConunt = parseInt((nowReplyPage-1)/perPage);
			
			startPage = startPage + (perPage*pageConunt);
			endPage = startPage + (perPage-1);
			if (replyPaging < endPage){
				endPage = replyPaging;
			}; // if
			
// 			console.log("startPage :" + startPage )
			
			if(strHtml != ""){
				strHtml += 	"<div class='container-fluid'>"
							+	"<div class='row'>"
							+	"<div class='col-md-4'></div>"
							+	"<div class='col-md-4'>"
							+	"<ul class='pagination'>"
							
							//startPage가 1일때 이전 버튼 비활성화
							if(startPage == "1"){
								strHtml += "<li class='paginate_button page-item previous disabled' id='reply_previous'>";
							} else {
								strHtml += "<li class='paginate_button page-item previous' id='reply_previous'>";
							};// if
							
							startPage -= 1;
							strHtml += "<a class='page-link' data-reply_page = '"+startPage+"' href='#'>Previous</a></li>";
			 				
							startPage += 1;
			 				for (var i = startPage; i<= endPage ; i++){
			 					strHtml +=	"<li class='paginate_button page-item";
			 					if(i == nowReplyPage) {
			 						strHtml += " active";
			 					}
			 					strHtml += "'><a class='page-link' data-reply_page = '"+i+"' href='#'>"+i+"</a></li>";
			 				};//for
			 				
			 				//endPage가 마지막일때 이전 버튼 비활성화
			 				if(replyPaging == endPage) {
			 					strHtml +=	"<li class='paginate_button page-item disabled' id='reply_next'>";
			 				} else {
			 					strHtml +=	"<li class='paginate_button page-item' id='reply_next'>";
			 				};//if
			 				
			 				endPage += 1;
				 			strHtml +=	"<a class='page-link' data-reply_page = '"+endPage+"' href='#'>Next</a></li>";
			 				+		"</ul>";
			 				+	"</div>"
			 				+	"<div class='col-md-4'></div>"
		 				+	"</div>";
			}//if		
			$("#discussion_ReplyList").html(strHtml);
		});//$.getJSON(url, function (receivedData)
			
	}//getReplyList()
	
	// 댓글 좋아요 버튼
	$("#discussion_ReplyList").on("click",".btnLike", function (e) {
		e.preventDefault();
		
		var r_no = $(this).attr("data-r_no");
// 		console.log(r_no +" 좋아요 버튼");
        var u_id = "user1";
        var r_up = 1;
        var r_Down = 0;
        var url = "/discussion_reply/likeOrDislikeSelect";
        var sendData = {
        	"u_id" : u_id,
        	"r_no" : r_no,
        	"r_up" : r_up,
        	"r_Down" : r_Down
        };
        
        $.ajax ({
        	"type" : "post",
        	"url" : url,
        	"headers" : {
        		"Content-Type" : "application/json",
        		"X-HTTP-Method_Override" : "post"
        	},
        	"dataType" : "text",
        	"data" : JSON.stringify(sendData),
        	"success" : function (receivedData) {
        		getReplyList()
			}
        });//$.ajax
	});//$("#discussion_ReplyList").on("click",".btnLike"
	
	// 댓글 싫어요 버튼
	$("#discussion_ReplyList").on("click",".btnDisLike", function (e) {
		e.preventDefault();
		var r_no = $(this).attr("data-r_no");
// 		console.log( r_no +" 싫어요 버튼");
        var u_id = "user1";
        var r_up = 0;
        var r_down = 1;
        var url = "/discussion_reply/likeOrDislikeSelect";
        var sendData = {
        	"u_id" : u_id,
        	"r_no" : r_no,
        	"r_up" : r_up,
        	"r_down" : r_down
        };
        
        $.ajax ({
        	"type" : "post",
        	"url" : url,
        	"headers" : {
        		"Content-Type" : "application/json",
        		"X-HTTP-Method_Override" : "post"
        	},
        	"dataType" : "text",
        	"data" : JSON.stringify(sendData),
        	"success" : function (receivedData) {
        		getReplyList()
			}
        });//$.ajax
		
	});// $("#discussion_ReplyList").on("click",".btnDisLike"
			
	
	// 댓글 페이징 버튼
	$("#discussion_ReplyList").on("click",".page-link", function (e) {
		e.preventDefault();
		var reply_page =  $(this).attr("data-reply_page");
		
		nowReplyPage = reply_page;
		getReplyList();
		console.log(reply_page+" 페이지 버튼")
	})
</script>

<%@include file="../include/footer.jsp" %>
