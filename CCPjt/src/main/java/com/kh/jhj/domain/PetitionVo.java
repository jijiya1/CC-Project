package com.kh.jhj.domain;

import java.sql.Timestamp;

public class PetitionVo {
/*
 * 청원게시판에 글 작성시 5명 이상 동의해야 글이 올라가고,
 * 		->b_no에 의한 url부여해서 개인이 사람들에게 홍보해서 동의하도록 유도
 * 		->게시판 번호는 rowNumber를 사용해서 달 예정
 * 10명 이상 동의해야 답변하기가 뜸
 * 		->해동 구역의 의원들에게 메세지가 전송되도록 할것
 * */
	
	
	private String b_serialno;		//전체게시판 seirialNo
	private int b_no;				//청원 글 번호 게시판 번호와는 상이
	private String b_addinfo;		//지역번호
	private String b_detailinfo;	//구역번호
	private String b_title;
	private String b_writer;		//작성자 이름(user**)
	private String b_replyer;		//답변자 이름(소속당)
	private String u_id;			//아이디
	private String b_content;		
	private int b_readcount;		//조회수
	private Timestamp b_startdate;	//글작성시간
	private Timestamp b_enddate;
	private int b_agree;			//글동의인원
	private int b_progress;			//진행상황(시작-진행-종료-답변완료)
	private char b_delno;
	private String a_name;
	private String d_name;
	private int rnum;
	private int ranking;
	
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
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
	public String getB_replyer() {
		return b_replyer;
	}
	public void setB_replyer(String b_replyer) {
		this.b_replyer = b_replyer;
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
	public Timestamp getB_startdate() {
		return b_startdate;
	}
	public void setB_startdate(Timestamp b_startdate) {
		this.b_startdate = b_startdate;
	}
	public Timestamp getB_enddate() {
		return b_enddate;
	}
	public void setB_enddate(Timestamp b_enddate) {
		this.b_enddate = b_enddate;
	}
	public int getB_agree() {
		return b_agree;
	}
	public void setB_agree(int b_agree) {
		this.b_agree = b_agree;
	}
	public int getB_progress() {
		return b_progress;
	}
	public void setB_progress(int b_progress) {
		this.b_progress = b_progress;
	}
	public char getB_delno() {
		return b_delno;
	}
	public void setB_delno(char b_delno) {
		this.b_delno = b_delno;
	}
	
	@Override
	public String toString() {
		return "PetitionVo [b_serialno=" + b_serialno + ", b_no=" + b_no + ", b_addinfo=" + b_addinfo
				+ ", b_detailinfo=" + b_detailinfo + ", b_title=" + b_title + ", b_writer=" + b_writer + ", b_replyer="
				+ b_replyer + ", u_id=" + u_id + ", b_content=" + b_content + ", b_readcount=" + b_readcount
				+ ", b_startdate=" + b_startdate + ", b_enddate=" + b_enddate + ", b_agree=" + b_agree + ", b_progress="
				+ b_progress + ", b_delno=" + b_delno + "]";
	}
	
	

}
