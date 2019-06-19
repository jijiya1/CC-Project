<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<div class="container-fluid">

	<div class="row">
		<div class="col-md-12">
			<h3>공지사항</h3><br>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>번  호</th>
						<th>제  목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="#">공지사항</a></td>
						<td><div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">관리자</div></td>
						<td>10</td>
						<td>2019. 06. 19</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>