package com.kh.jhj.domain;

public class Pe_AgreeVo {
	private String b_serialno;
	private String u_email;
	private int agreeNum;
	
	
	public String getB_serialno() {
		return b_serialno;
	}
	public void setB_serialno(String b_serialno) {
		this.b_serialno = b_serialno;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getAgreeNum() {
		return agreeNum;
	}
	public void setAgreeNum(int agreeNum) {
		this.agreeNum = agreeNum;
	}
	@Override
	public String toString() {
		return "Pe_AgreeVo [b_serialno=" + b_serialno + ", u_email=" + u_email + ", agreeNum=" + agreeNum + "]";
	}
	
	
	
}
