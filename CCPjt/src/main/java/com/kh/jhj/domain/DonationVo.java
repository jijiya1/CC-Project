package com.kh.jhj.domain;

import java.sql.Timestamp;

public class DonationVo {
	String b_serialno;
	int b_no;
	String b_addinfo;
	String b_detailinfo;
	String b_title;
	String b_subtitle;
	String b_writer;
	String u_id;
	String b_content;
	int b_readcount;
	Timestamp b_createddate;
	Timestamp b_modifieddate;
	int b_money;
	int b_persons;
	int b_upcount;
	int b_downcount;
	int b_checkeddel;
	
	
	public String getB_subtitle() {
		return b_subtitle;
	}
	public void setB_subtitle(String b_subtitle) {
		this.b_subtitle = b_subtitle;
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
	public String getB_addinfo() {
		return b_addinfo;
	}
	public void setB_addinfo(String b_addinfo) {
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
	public int getB_money() {
		return b_money;
	}
	public void setB_money(int b_money) {
		this.b_money = b_money;
	}
	public int getB_persons() {
		return b_persons;
	}
	public void setB_persons(int b_persons) {
		this.b_persons = b_persons;
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
		return "DonationVo [b_serialno=" + b_serialno + ", b_no=" + b_no + ", b_addinfo=" + b_addinfo
				+ ", b_detailinfo=" + b_detailinfo + ", b_title=" + b_title + ", b_writer=" + b_writer + ", u_id="
				+ u_id + ", b_content=" + b_content + ", b_readcount=" + b_readcount + ", b_createddate="
				+ b_createddate + ", b_modifieddate=" + b_modifieddate + ", b_money=" + b_money + ", b_persons="
				+ b_persons + ", b_upcount=" + b_upcount + ", b_downcount=" + b_downcount + ", b_checkeddel="
				+ b_checkeddel + "]";
	}

	
}
