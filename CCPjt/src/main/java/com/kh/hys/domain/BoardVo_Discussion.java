package com.kh.hys.domain;

import java.sql.Timestamp;

public class BoardVo_Discussion {
	private String b_serialno; 		// 게시글 시리얼 넘버
	private int b_no; 				// 토론 게시글 번호
	private int b_addinfo; 			// 토론 게시글 정보 (지역 번호)
	private String a_name;			// 토론 게시글 지역 이름
	private int b_detailinfo; 		// 토론 게시글 상세 지역 이름
	private String b_title;
	private String b_writer;
	private String u_email;			// 유저 아이디(email)
	private String b_content;
	private int b_readcount;
	private Timestamp b_createddate;
	private int b_agreementcount;	// 찬성 수
	private int b_oppositioncount;	// 반대 수
	private int b_upcount;
	private int b_downcount;
	private int b_checkeddel;
	
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
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public int getB_detailinfo() {
		return b_detailinfo;
	}
	public void setB_detailinfo(int b_detailinfo) {
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
	public int getB_agreementcount() {
		return b_agreementcount;
	}
	public void setB_agreementcount(int b_agreementcount) {
		this.b_agreementcount = b_agreementcount;
	}
	public int getB_oppositioncount() {
		return b_oppositioncount;
	}
	public void setB_oppositioncount(int b_oppositioncount) {
		this.b_oppositioncount = b_oppositioncount;
	}
	public int getB_upcount() {
		return b_upcount;
	}
	public void setB_upcount(int b_upcount) {
		this.b_upcount = b_upcount;
	}
	public int getB_downcount() {
		return b_downcount;
	}
	public void setB_downcount(int b_downcount) {
		this.b_downcount = b_downcount;
	}
	public int getB_checkeddel() {
		return b_checkeddel;
	}
	public void setB_checkeddel(int b_checkeddel) {
		this.b_checkeddel = b_checkeddel;
	}
	
	@Override
	public String toString() {
		return "BoardVo_Discussion [b_serialno=" + b_serialno + ", b_no=" + b_no + ", b_addinfo=" + b_addinfo
				+ ", a_name=" + a_name + ", b_detailinfo=" + b_detailinfo + ", b_title=" + b_title + ", b_writer="
				+ b_writer + ", u_email=" + u_email + ", b_content=" + b_content + ", b_readcount=" + b_readcount
				+ ", b_createddate=" + b_createddate + ", b_agreementcount=" + b_agreementcount + ", b_oppositioncount="
				+ b_oppositioncount + ", b_upcount=" + b_upcount + ", b_downcount=" + b_downcount + ", b_checkeddel="
				+ b_checkeddel + "]";
	}

}
