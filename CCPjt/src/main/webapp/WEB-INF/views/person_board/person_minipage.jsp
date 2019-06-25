<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-8">
					<img alt="Bootstrap Image Preview" src="/resources/img/test1.jpg"  width="300"/>
				</div>
				<div class="col-md-4">
					<input type="button" class="btn btn-link" value="건의 글 보기" id="member_com"/>
					<input type="button" class="btn btn-link" value="토론 글 보기" id="member_dicussion"/>
					<input type="button" class="btn btn-link" value="후원/모금 글 보기" id="member_donation"/>
					<input type="button" class="btn btn-link" value="후원하기" id="member_myDonation"/>
					
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<dl>
						<dt>
							홍길동(너희당)
						</dt>
						<dd>
							울산 중구갑/ 국회의원
						</dd>
						<dt>
							등급 : ★★★★★★★
						</dt>
						<dd>
							"간바레"
						</dd>
						
					</dl>
				</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					<div class="container-fluid">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Product</th>
									<th>Payment Taken</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Default</td>
								</tr>
								<tr class="table-active">
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Approved</td>
								</tr>
								<tr class="table-active">
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Approved</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<input type="text"  class="text" id="txtMessage" placeholder="응원 메시지를 입력해 주세요." />
					<input type="button" class="btn-warning" id="btnMessage" value="입력"/>					
				</div>
				<div class="col-md-12">
					<div class="container-fluid">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Product</th>
									<th>Payment Taken</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Default</td>
								</tr>
								<tr class="table-active">
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Approved</td>
								</tr>
								<tr class="table-active">
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Approved</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

<%@include file="../include/footer.jsp" %>