package com.kh.sbj.domain;

public class PersonPromiseDeleteDto {
	private int p_no;
	private String u_id;
	
	public PersonPromiseDeleteDto() {
		super();
	}

	public PersonPromiseDeleteDto(int p_no, String u_id) {
		super();
		this.p_no = p_no;
		this.u_id = u_id;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
}
