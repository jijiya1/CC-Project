package com.kh.jhj.domain;

import java.sql.Timestamp;

public class Pe_ReplyVo {
	private String b_serialno;
	private int r_no;
	private String r_writer;
	private String r_content;
	private Timestamp r_createddate;
	private Timestamp r_modifieddate;
	private int b_upcount;
	private int b_downcount;
	private int r_step;
	private int r_level;
	private int r_checkeddel;
	private int rnum;
	private String u_email;
	
	
	
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
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
		return "Pe_ReplyVo [b_serialno=" + b_serialno + ", r_no=" + r_no + ", r_writer=" + r_writer + ", r_content="
				+ r_content + ", r_createddate=" + r_createddate + ", r_modifieddate=" + r_modifieddate + ", b_upcount="
				+ b_upcount + ", b_downcount=" + b_downcount + ", r_step=" + r_step + ", r_level=" + r_level
				+ ", r_checkeddel=" + r_checkeddel + ", rnum=" + rnum + ", u_email=" + u_email + "]";
	}
	
	
}
