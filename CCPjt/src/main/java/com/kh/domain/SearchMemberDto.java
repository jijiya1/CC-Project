package com.kh.domain;

public class SearchMemberDto {
	private int a_no;
	private int d_no;
	public SearchMemberDto() {
		super();
	}
	public SearchMemberDto(int a_no, int d_no) {
		super();
		this.a_no = a_no;
		this.d_no = d_no;
	}
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
	@Override
	public String toString() {
		return "SearchMemberDto [a_no=" + a_no + ", d_no=" + d_no + "]";
	}
	
	
	
	
}
