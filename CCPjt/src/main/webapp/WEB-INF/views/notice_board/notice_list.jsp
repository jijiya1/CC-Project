<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/head.jsp" %>

<script>
$(document).ready(function() {
	$("#btnNoticeWrite").click(function() {
		location.href = "notice_write";
	});
 });
</script>

<style>

</style>

        <!-- 공지사항 시작 -->
        <div class="container-fluid">
        
        <p class="mb-4"><a href="/">홈</a> > 공지사항</p>

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">공지사항</h1>
          <p class="mb-4">항상 공지사항을 확인하세요.</p>

          <!-- 공지사항 리스트 -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번&nbsp;&nbsp;호</th>
                      <th>제&nbsp;&nbsp;목</th>
                      <th>작성자</th>
                      <th>조회수</th>
                      <th>작성날짜</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>공지사항</td>
                      <td>관리자</td>
                      <td>10</td>
                      <td>2019. 06. 20</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
          <div>
          <button class="btn btn-primary" id="btnNoticeWrite">공지사항 작성</button>
          </div>

        </div>
        <!-- 공지사항 끝 -->

<%@include file="../include/footer.jsp" %>