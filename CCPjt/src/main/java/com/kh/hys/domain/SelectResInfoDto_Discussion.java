package com.kh.hys.domain;

public class SelectResInfoDto_Discussion {
	
	private String u_email;
	private int b_no;

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	@Override
	public String toString() {
		return "SelectResInfoDto_Discussion [u_email=" + u_email + ", b_no=" + b_no + "]";
	}

}
