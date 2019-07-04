<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>
<title>청원 하기</title>

<div class="container-fluid">
   <div class="cs_body">
        <div class="wrap">
            <div class="board">
                <div class="b_write">
                    <div class="mb10 box bg p20 text small left">
                        <strong class="text bold cb">청와대 국민청원 게시판 운영 원칙 <br></strong>
						<ul class="mt10 mb10 text" style="line-height:180%">
						<li>청와대는 사상과 표현의 다양성을 존중합니다. 동시에 타인의 권리를 침해하거나 명예를 훼손하는 내용은 제한합니다. 방송통신심의위원회의 '정보통신에 관한 심의 규정', 한국인터넷자율정책기구의 '정책규정' 등을 기반으로 문제 게시물은 삭제될 수 있습니다. 자극적이고 혐오스러운 내용, 비속어, 폭력적 내용, 특정 대상을 비하하거나 차별을 조장하는 내용, 개인정보 유출을 비롯해 타인의 권리를 침해하는 내용, 반복되는 내용, 허위사실 등은 <strong>삭제</strong>나 <strong>숨김</strong> 처리될 수 있습니다.</li>

						<li>청원글 게시 후 30일 동안 100명의 사전동의를 받은 청원에 한해 국민청원 게시판에 공개됩니다. 청원이 공개된 날로부터 30일 동안 20만 명 이상의 동의를 받은 청원에 대해 답변합니다.</li>

						<li>한 번 작성된 청원은 <strong>수정</strong> 및 <strong>삭제</strong>가 <strong>불가능</strong>합니다. 최초 청원 취지와 다른 내용으로 변경되는 것을 방지하여 청원 참여자의 의견을 보호하기 위한 조치이니 신중하게 작성하여 주시기 바랍니다.</li>
                    </div>

                    <div class="mb10 box bg p20 text small left">
						<strong class="text bold cb">청원 작성 요령 안내</strong><br>
						<ul class="mt10 mb10 text" style="line-height:180%">
						<li>새 청원글 작성 시, 내용을 대표하는 제목 및 관련 분야를 선택하신 후 내용을 입력해주시면 됩니다.</li>
 						<li>청원 내용과 관련 있는 웹사이트 또는 영상 URL이 있다면 첨부해주시기 바랍니다.</li>
 						<li>청원 내용의 주요 키워드를 태그란에 입력해주시면 다른 참여자들이 여러분들의 청원을 쉽게 찾는 데 도움이 됩니다.</li>
						</ul>
						<div style="padding:20px;">
						<ul class="pt_ver2_btn1" style="margin-bottom:5px;text-align:center">
							<li><a class="popup-modal" href="#test-modal" style="background:#112057"><i class="xi-zoom-in"></i>자세히 알아보기</a></li>
						</ul>
                    </div>
                    </div>




                    <form id="form" method="post" action="/api/PetitionWrite" onsubmit="return false">
                        <input type="hidden" id="wv_token" name="wv_petition_token" value="">

                        <div class="form">
                            <div class="f_wrap">
                                <div class="f_field">
                                    <div class="ff_title">
                                        <label for="pw_subject">청원제목</label>
                                    </div>
                                    <div class="ff_wrap">
                                        <input type="text" id="pw_subject" name="title" class="input" placeholder="청원제목을 입력해주세요." required/>
                                    </div>
                                </div>
                            </div>
                            <div class="f_wrap">
                                <div class="f_field">
                                    <div class="ff_title">
                                        <label for="pw_category">카테고리</label>
                                    </div>
                                    <div class="ff_wrap">
                                        <select id="pw_category" name="petition_category_id" class="select w450" required>
                                            <option value="" selected disabled>카테고리를 선택해주세요.</option>
											<option value="35">정치개혁</option>
<option value="36">외교/통일/국방</option>
<option value="37">일자리</option>
<option value="38">미래</option>
<option value="39">성장동력</option>
<option value="40">농산어촌</option>
<option value="41">보건복지</option>
<option value="42">육아/교육</option>
<option value="43">안전/환경</option>
<option value="44">저출산/고령화대책</option>
<option value="45">행정</option>
<option value="46">반려동물</option>
<option value="47">교통/건축/국토</option>
<option value="48">경제민주화</option>
<option value="49">인권/성평등</option>
<option value="50">문화/예술/체육/언론</option>
<option value="51">기타</option>
                                        </select>

                                    </div>
                                </div>
                            </div>

                            <div class="f_wrap">
                                <div class="f_field">
                                    <div class="ff_title">
                                        <label for="pw_contents">청원내용</label>
                                    </div>
                                    <div class="ff_wrap">
                                        <textarea id="pw_contents" name="body" rows="10" cols="80" minlength="1" class="textarea text" required></textarea>
                                    </div>
                                </div>
                            </div>

                            <div id="link-container" class="f_wrap" data-form-id="#form">
								<div class="f_field">
									<div class="ff_title">
										<label for="tw_link">관련링크</label>
									</div>
									<div class="ff_wrap button">
										<input type="url" id="tw_link" name="wv_link[]" class="input" placeholder="http://example.com" />
										<button type="button" id="tw_link_add" class="btn big t3">링크추가</button>
									</div>
								</div>
							</div>

							<div id="tag-container" class="f_wrap" data-form-id="#form">
								<div class="f_field">
									<div class="ff_title">
										<label for="tw_link">검색태그</label>
									</div>
									<div class="ff_wrap button">
										<input type="text" id="tw_tag1" name="wv_tag[]" class="input" placeholder="태그1" />
										<input type="text" id="tw_tag2" name="wv_tag[]" class="input" placeholder="태그2" />
										<input type="text" id="tw_tag3" name="wv_tag[]" class="input" placeholder="태그3" />
									</div>
								</div>
							</div>
                        </div>

                        <div class="btn_wrap">
                            <ul>
                                <li>
                                    <div style="text-align:center" class="submit_btn"><button type="submit" id="WriteBtn" class="btn t4" autocomplete="off">작성 완료</button></div>
                                </li>
                                <li><a href="/petitions" class="btn t2">작성 취소</a></li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>




		</div>



<!-- //contents END -->
					<div id="test-modal" class="mfp-hide white-popup-block">
						<h1>청원 작성 요령 안내</h1>
						<div>
							<strong>1) 검색</strong><br>
							새 청원글 작성 전 유사한 내용의 청원이 진행 중인지 먼저 확인해주세요. 새 청원글을 작성하는 것보다 유사한 기존 청원에 동의해주시면 국민의 힘을 모으는데 도움이 됩니다.<br><br>
							<strong>2) 제목 입력</strong><br>
							청원 내용을 대표하는 짧은 제목(100자 이하)을 입력해주세요. 주요 단어를 제목에 포함시켜 주시면 검색을 통한 노출이 잘 이뤄질 수 있습니다.<br><br>
							<strong>3) 카테고리 선택</strong><br>
							청원 내용과 관련된 분야를 선택해주세요. 참여자들이 '분야별 청원' 메뉴를 통해 접근할 수 있습니다.<br><br>
							<strong>4) 내용 입력</strong><br>
							사람들이 쉽게 읽고 이해할 수 있는 내용으로 작성해주시면 됩니다. 글자 수 제한은 없습니다.<br><br>
							<strong>5) 링크 첨부</strong><br>
							청원 내용과 관련된 링크 주소를 입력해주세요. 다만 청원 내용과 관련이 없거나 부적절한 링크는 관리자에 의해 숨김처리 될 수 있습니다.<br><br>
							<strong>6) 태그</strong><br>
							3개 이하의 태그를 입력해주세요. 참여자들이 손쉽게 청원을 검색하고, 내용을 이해하는 데 도움을 줄 수 있습니다.<br><br>
							<strong>7) 검토 및 게시</strong><br>
							한번 작성된 청원은 수정 및 삭제가 불가능합니다. 최초 청원 취지와 다른 내용으로 변경되는 것을 방지하여 청원작성자의 의견을 보호하기 위한 조치이니 신중하게 게시해주시기 바랍니다.
							</div>
						<p><a class="popup-modal-dismiss" href="#">창닫기</a></p>
					</div>
<%@include file="../include/footer.jsp" %>