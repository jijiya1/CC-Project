package com.kh.jhj.domain;

public class DoFileDto {
	private String b_serialno;
	private String f_name;
	private String f_path;
	public String getB_serialno() {
		return b_serialno;
	}
	public void setB_serialno(String b_serialno) {
		this.b_serialno = b_serialno;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_path() {
		return f_path;
	}
	public void setF_path(String f_path) {
		this.f_path = f_path;
	}
	@Override
	public String toString() {
		return "DoFileDto [b_serialno=" + b_serialno + ", f_name=" + f_name + ", f_path=" + f_path + "]";
	}
	
	

}
