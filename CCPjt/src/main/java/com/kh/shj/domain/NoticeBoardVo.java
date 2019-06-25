package com.kh.shj.domain;

import java.sql.Timestamp;

public class NoticeBoardVo {
	private String b_serialno; // 게시글 시리얼넘버
	private int b_no; // 공지게시글 번호
	private int b_addinfo; // 공지게시글 정보(지역) 서울
	private String b_detailinfo; // 공지게시글 정보(세부정보) 송파구 
	private String b_title; // 공지게시글 제목
	private String b_writer; // 공지게시글 작성자
	private String u_id; // 게시글 작성자 id
	private String b_content; // 공지게시글 내용 
	private int b_readcount; // 공지게시글 조회수
	private Timestamp b_createddate; // 공지게시글 작성일
	private Timestamp b_modifieddate; // 공지게시글 수정일
	private int b_up; // 공지게시글 글 좋아요
	private int b_down; // 공지게시글 글 싫어요
	private int b_checkeddel; // 게시글 삭제 여부
	private int a_no;
	private String a_name;
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
	public int getB_addinfo() {
		return b_addinfo;
	}
	public void setB_addinfo(int b_addinfo) {
		this.b_addinfo = b_addinfo;
	}
	public String getB_detailinfo() {
		return b_detailinfo;
	}
	public void setB_detailinfo(String b_detailinfo) {
		this.b_detailinfo = b_detailinfo;
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
	public int getB_readcount() {
		return b_readcount;
	}
	public void setB_readcount(int b_readcount) {
		this.b_readcount = b_readcount;
	}
	public Timestamp getB_createddate() {
		return b_createddate;
	}
	public void setB_createddate(Timestamp b_createddate) {
		this.b_createddate = b_createddate;
	}
	public Timestamp getB_modifieddate() {
		return b_modifieddate;
	}
	public void setB_modifieddate(Timestamp b_modifieddate) {
		this.b_modifieddate = b_modifieddate;
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
	public int getB_checkeddel() {
		return b_checkeddel;
	}
	public void setB_checkeddel(int b_checkeddel) {
		this.b_checkeddel = b_checkeddel;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	@Override
	public String toString() {
		return "NoticeBoardVo [b_serialno=" + b_serialno + ", b_no=" + b_no + ", b_addinfo=" + b_addinfo
				+ ", b_detailinfo=" + b_detailinfo + ", b_title=" + b_title + ", b_writer=" + b_writer + ", u_id="
				+ u_id + ", b_content=" + b_content + ", b_readcount=" + b_readcount + ", b_createddate="
				+ b_createddate + ", b_modifieddate=" + b_modifieddate + ", b_up=" + b_up + ", b_down=" + b_down
				+ ", b_checkeddel=" + b_checkeddel + ", a_no=" + a_no + ", a_name=" + a_name + "]";
	}
	
}