package com.kh.hys.domain;

import java.sql.Timestamp;

public class SelectDiscussion_BoardVo {
	
	private String b_serialno; 			// 게시글 시리얼넘버
	private int b_no; 					// 토론주제선정 게시글번호
	private int b_addInfo; 				// 토론주제선정 게시글 정보 번호(지역)
	private String a_name;				// 토론주제선정 게시글 정보 이름(지역)
	private int b_detailInfo;			// 토론주제선정 게시글 정보 번호(상세정보)
	private String d_name;				// 토론주제선정 게시글 정보 이름(상세정보)
	private String b_title; 			// 토론주제선정 제목
	private String b_writer; 			// 토론주제선정 작성자
	private String u_email; 			// 유저 아이디(email)
	private String b_content; 			// 토론주제선정 내용
	private int b_readCount; 			// 토론주제선정 조회수
	private Timestamp b_createdDate; 	// 토론주제선정 작성일
	private Timestamp b_modifiedDate; 	// 토론주제선정 수정일
	private int b_recommendCount; 		// 토론주제선정 추천수
	private int b_upCount; 				// 토론주제선정 글 좋아요
	private int b_downCount; 			// 토론주제선정 글 싫어요
	private int b_checkedDel; 			// 게시글 삭제 여부
	private int ranking; 				// 랭킹 정보(추천수 -> 최신순)

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

	public int getB_addInfo() {
		return b_addInfo;
	}

	public void setB_addInfo(int b_addInfo) {
		this.b_addInfo = b_addInfo;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public int getB_detailInfo() {
		return b_detailInfo;
	}

	public void setB_detailInfo(int b_detailInfo) {
		this.b_detailInfo = b_detailInfo;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
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

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
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

	public int getB_upCount() {
		return b_upCount;
	}

	public void setB_upCount(int b_upCount) {
		this.b_upCount = b_upCount;
	}

	public int getB_downCount() {
		return b_downCount;
	}

	public void setB_downCount(int b_downCount) {
		this.b_downCount = b_downCount;
	}

	public int getB_checkedDel() {
		return b_checkedDel;
	}

	public void setB_checkedDel(int b_checkedDel) {
		this.b_checkedDel = b_checkedDel;
	}

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	@Override
	public String toString() {
		return "SelectDiscussion_BoardVo [b_serialno=" + b_serialno + ", b_no=" + b_no + ", b_addInfo=" + b_addInfo
				+ ", a_name=" + a_name + ", b_detailInfo=" + b_detailInfo + ", d_name=" + d_name + ", b_title="
				+ b_title + ", b_writer=" + b_writer + ", u_email=" + u_email + ", b_content=" + b_content
				+ ", b_readCount=" + b_readCount + ", b_createdDate=" + b_createdDate + ", b_modifiedDate="
				+ b_modifiedDate + ", b_recommendCount=" + b_recommendCount + ", b_upCount=" + b_upCount
				+ ", b_downCount=" + b_downCount + ", b_checkedDel=" + b_checkedDel + ", ranking=" + ranking + "]";
	}

}
