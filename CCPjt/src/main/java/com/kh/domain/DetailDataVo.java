package com.kh.domain;

public class DetailDataVo {
	private int a_no;
	private int d_no;
	private String d_name;
	private String local;
	
	public int getA_no() {
		return a_no;
	}
	
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	
	public int getD_no() {
		return d_no;
	}
	
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	
	public String getD_name() {
		return d_name;
	}
	
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	
	public String getLocal() {
		return local;
	}
	
	public void setLocal(String local) {
		this.local = local;
	}

	@Override
	public String toString() {
		return "DetailDataVo [a_no=" + a_no + ", d_no=" + d_no + ", d_name=" + d_name + ", local=" + local + "]";
	}
	
}
