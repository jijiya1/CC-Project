<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/head.jsp" %>
<h1>토론 추천 게시판</h1>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<table class="table">
				<thead>
					<tr>
						<th>
							#
						</th>
						<th>
							Product
						</th>
						<th>
							Payment Taken
						</th>
						<th>
							Status
						</th>
					</tr>
				</thead>
				<tbody >
					<tr style="border-left-color: blue;">
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Default
						</td>
					</tr>
					<tr >
						<td >
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
					</tr>
					<tr class="table-success" class="table-active" style=" border-left-color: red;">
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>