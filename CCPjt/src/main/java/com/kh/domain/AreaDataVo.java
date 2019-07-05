package com.kh.domain;

public class AreaDataVo {
	
	private int a_no;
	private String a_name;
	private int a_order;
	private String a_engname;
	
	public String getA_engname() {
		return a_engname;
	}

	public void setA_engname(String a_engname) {
		this.a_engname = a_engname;
	}

	public int getA_order() {
		return a_order;
	}

	public void setA_order(int a_order) {
		this.a_order = a_order;
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

	@Override
	public String toString() {
		return "AreaDataVo [a_no=" + a_no + ", a_name=" + a_name + ", a_order=" + a_order + ", a_engname=" + a_engname
				+ "]";
	}

}
