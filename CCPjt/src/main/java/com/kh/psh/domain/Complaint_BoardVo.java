package com.kh.psh.domain;

import java.sql.Timestamp;
import java.util.Arrays;

public class Complaint_BoardVo {

	private String b_serialno; //고유번호 각자 테이블에 bno의 차이를 보여주기 위한 값
	private int b_no;//글번호 
	private String b_addinfo;//지역주소
	private String b_detailinfo;//지역상세주소
	private String b_title;//글제목
	private String b_writer;//작성자
	private String u_id;//작성자id
	private String b_content;//글내용
	private int b_readcount;//조회수
	private Timestamp b_createddate;//글쓴날짜
	private Timestamp b_modifieddate;//수정날짜
	private int b_upcount;//좋아요갯수
	private int b_downcount;//싫어요 갯수
	private int b_checkeddel;//삭제체크
	private int a_no;
	private String a_name;
	private int a_order;
	
	private String[] files;

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

	public int getA_order() {
		return a_order;
	}

	public void setA_order(int a_order) {
		this.a_order = a_order;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "Complaint_BoardVo [b_serialno=" + b_serialno + ", b_no=" + b_no + ", b_addinfo=" + b_addinfo
				+ ", b_detailinfo=" + b_detailinfo + ", b_title=" + b_title + ", b_writer=" + b_writer + ", u_id="
				+ u_id + ", b_content=" + b_content + ", b_readcount=" + b_readcount + ", b_createddate="
				+ b_createddate + ", b_modifieddate=" + b_modifieddate + ", b_upcount=" + b_upcount + ", b_downcount="
				+ b_downcount + ", b_checkeddel=" + b_checkeddel + ", a_no=" + a_no + ", a_name=" + a_name
				+ ", a_order=" + a_order + ", files=" + Arrays.toString(files);
	}
	
	
	
}