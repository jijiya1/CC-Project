package com.kh.hys.domain;

import java.sql.Timestamp;

public class SelectDiscussion_BoardVo {
	
	String b_serialno; // 게시글 시리얼넘버
	int b_no; // 토론주제선정 게시글번호
	String b_addInfo; // 토론주제선정 게시글 정보(지역) 서울
	String b_detailInfo;// 토론주제선정 게시글 정보(상세정보) 송파구
	String b_title; // 토론주제선정 제목
	String b_writer; // 토론주제선정 작성자
	String u_id ;// 게시글 작성자 ID
	String b_content; // 토론주제선정 내용
	int b_readCount; // 토론주제선정 조회수
	Timestamp b_createdDate; // 토론주제선정 작성일
	Timestamp b_modifiedDate; // 토론주제선정 수정일
	int b_recommendCount; // 토론주제선정 추천수
	int b_up; // 토론주제선정 글 좋아요
	int b_down; // 토론주제선정 글 싫어요
	int b_checkedDel; // 게시글 삭제 여부
	public String getB_serialno() {
		return b_serialno;
	}
	public void setB_serialno(String b_serialno) {
		this.b_serialno = b_serialno;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_addInfo() {
		return b_addInfo;
	}
	public void setB_addInfo(String b_addInfo) {
		this.b_addInfo = b_addInfo;
	}
	public String getB_detailInfo() {
		return b_detailInfo;
	}
	public void setB_detailInfo(String b_detailInfo) {
		this.b_detailInfo = b_detailInfo;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_readCount() {
		return b_readCount;
	}
	public void setB_readCount(int b_readCount) {
		this.b_readCount = b_readCount;
	}
	public Timestamp getB_createdDate() {
		return b_createdDate;
	}
	public void setB_createdDate(Timestamp b_createdDate) {
		this.b_createdDate = b_createdDate;
	}
	public Timestamp getB_modifiedDate() {
		return b_modifiedDate;
	}
	public void setB_modifiedDate(Timestamp b_modifiedDate) {
		this.b_modifiedDate = b_modifiedDate;
	}
	public int getB_recommendCount() {
		return b_recommendCount;
	}
	public void setB_recommendCount(int b_recommendCount) {
		this.b_recommendCount = b_recommendCount;
	}
	public int getB_up() {
		return b_up;
	}
	public void setB_up(int b_up) {
		this.b_up = b_up;
	}
	public int getB_down() {
		return b_down;
	}
	public void setB_down(int b_down) {
		this.b_down = b_down;
	}
	public int getB_checkedDel() {
		return b_checkedDel;
	}
	public void setB_checkedDel(int b_checkedDel) {
		this.b_checkedDel = b_checkedDel;
	}
	@Override
	public String toString() {
		return "SelectDiscussion_boardVo [b_serialno=" + b_serialno + ", b_no=" + b_no + ", b_addInfo=" + b_addInfo
				+ ", b_detailInfo=" + b_detailInfo + ", b_title=" + b_title + ", b_writer=" + b_writer + ", u_id="
				+ u_id + ", b_content=" + b_content + ", b_readCount=" + b_readCount + ", b_createdDate="
				+ b_createdDate + ", b_modifiedDate=" + b_modifiedDate + ", b_recommendCount=" + b_recommendCount
				+ ", b_up=" + b_up + ", b_down=" + b_down + ", b_checkedDel=" + b_checkedDel + "]";
	}
	
}
