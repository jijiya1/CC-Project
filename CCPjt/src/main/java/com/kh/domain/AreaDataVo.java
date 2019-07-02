package com.kh.domain;

public class AreaDataVo {
	
	private int a_no;
	private String a_name;
	private int a_order;
	
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
		return "AreaData [a_no=" + a_no + ", a_name=" + a_name + ", a_order=" + a_order + "]";
	}

}
