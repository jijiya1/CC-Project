package com.kh.psh.domain;

import java.security.Timestamp;

public class Complaint_ReplyVo {
	private String b_serialno;//게시글 시리얼 넘버
	private int r_no;// 리플 번호
	private String r_writer;//리플 작성자
	private String r_content;//리플 내용
	private Timestamp r_createddate;//리플 작성일
	private Timestamp r_modifieddate;//리플 수정일
	private int b_upcount;//리플 좋아요
	private int b_downcount;//리플 싫어요
	private int r_step;//리플 삭제여부
	private int r_level;
	private int r_checkeddel;
	
	public String getB_serialno() {
		return b_serialno;
	}
	public void setB_serialno(String b_serialno) {
		this.b_serialno = b_serialno;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Timestamp getR_createddate() {
		return r_createddate;
	}
	public void setR_createddate(Timestamp r_createddate) {
		this.r_createddate = r_createddate;
	}
	public Timestamp getR_modifieddate() {
		return r_modifieddate;
	}
	public void setR_modifieddate(Timestamp r_modifieddate) {
		this.r_modifieddate = r_modifieddate;
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
	public int getR_step() {
		return r_step;
	}
	public void setR_step(int r_step) {
		this.r_step = r_step;
	}
	public int getR_level() {
		return r_level;
	}
	public void setR_level(int r_level) {
		this.r_level = r_level;
	}
	public int getR_checkeddel() {
		return r_checkeddel;
	}
	public void setR_checkeddel(int r_checkeddel) {
		this.r_checkeddel = r_checkeddel;
	}
	@Override
	public String toString() {
		return "Complaint_ReplyVo [b_serialno=" + b_serialno + ", r_no=" + r_no + ", r_writer=" + r_writer
				+ ", r_content=" + r_content + ", r_createddate=" + r_createddate + ", r_modifieddate=" + r_modifieddate
				+ ", b_upcount=" + b_upcount + ", b_downcount=" + b_downcount + ", r_step=" + r_step + ", r_level="
				+ r_level + ", r_checkeddel=" + r_checkeddel + "]";
	}
}