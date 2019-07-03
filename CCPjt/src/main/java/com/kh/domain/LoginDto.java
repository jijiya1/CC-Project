package com.kh.domain;

public class LoginDto {
	private String u_email;
	private String u_pw;
	
	public LoginDto() {
		super();
	}

	public LoginDto(String u_email, String u_pw) {
		super();
		this.u_email = u_email;
		this.u_pw = u_pw;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	@Override
	public String toString() {
		return "LoginDto [u_email=" + u_email + ", u_pw=" + u_pw + "]";
	}
	
	
	
	
}
