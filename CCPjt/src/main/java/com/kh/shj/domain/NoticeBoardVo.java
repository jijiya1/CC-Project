package com.kh.shj.domain;

import java.sql.Timestamp;

public class NoticeBoardVo {
	private String b_serialno; // 게시글 시리얼넘버
	private int b_no; // 공지게시글 번호
	private String b_addInfo; // 공지게시글 정보(지역) 서울
	private String b_detailInfo; // 공지게시글 정보(세부정보) 송파구 
	private String b_title; // 공지게시글 제목
	private String b_writer; // 공지게시글 작성자
	private String u_id; // 게시글 작성자 ID
	private String b_content; // 공지게시글 내용 
	private int b_readCount; // 공지게시글 조회수
	private Timestamp b_createdDate; // 공지게시글 작성일
	private Timestamp b_modifiedDate; // 공지게시글 수정일
	private int b_up; // 공지게시글 글 좋아요
	private int b_down; // 공지게시글 글 싫어요
	private int b_checkedDel; // 게시글 삭제 여부
	
	public NoticeBoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeBoardVo(String b_serialno, int b_no, String b_addInfo, String b_detailInfo, String b_title,
			String b_writer, String u_id, String b_content, int b_readCount, Timestamp b_createdDate,
			Timestamp b_modifiedDate, int b_up, int b_down, int b_checkedDel) {
		super();
		this.b_serialno = b_serialno;
		this.b_no = b_no;
		this.b_addInfo = b_addInfo;
		this.b_detailInfo = b_detailInfo;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.u_id = u_id;
		this.b_content = b_content;
		this.b_readCount = b_readCount;
		this.b_createdDate = b_createdDate;
		this.b_modifiedDate = b_modifiedDate;
		this.b_up = b_up;
		this.b_down = b_down;
		this.b_checkedDel = b_checkedDel;
	}

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
		return "NoticeBoardVo [b_serialno=" + b_serialno + ", b_no=" + b_no + ", b_addInfo=" + b_addInfo
				+ ", b_detailInfo=" + b_detailInfo + ", b_title=" + b_title + ", b_writer=" + b_writer + ", u_id="
				+ u_id + ", b_content=" + b_content + ", b_readCount=" + b_readCount + ", b_createdDate="
				+ b_createdDate + ", b_modifiedDate=" + b_modifiedDate + ", b_up=" + b_up + ", b_down=" + b_down
				+ ", b_checkedDel=" + b_checkedDel + "]";
	}

}
