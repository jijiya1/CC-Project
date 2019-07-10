package com.kh.sbj.domain;

public class PersonAccountDeleteDto {
	private String acc_num;
	private String u_email;
	
	public PersonAccountDeleteDto() {
		super();
	}

	public PersonAccountDeleteDto(String acc_num, String u_email) {
		super();
		this.acc_num = acc_num;
		this.u_email = u_email;
	}

	public String getAcc_num() {
		return acc_num;
	}

	public void setAcc_num(String acc_num) {
		this.acc_num = acc_num;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	@Override
	public String toString() {
		return "PersonAccountDeleteDto [acc_num=" + acc_num + ", u_email=" + u_email + "]";
	}
	
	
	
	
}
