package com.kh.sbj.domain;

public class PersonPromiseDeleteDto {
	private int p_no;
	private String u_email;
	
	public PersonPromiseDeleteDto() {
		super();
	}

	public PersonPromiseDeleteDto(int p_no, String u_email) {
		super();
		this.p_no = p_no;
		this.u_email = u_email;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	
}
