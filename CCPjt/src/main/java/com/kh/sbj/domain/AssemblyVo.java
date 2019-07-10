package com.kh.sbj.domain;

public class AssemblyVo {
	private int assem_no;
	private String assem_name;
	
	public AssemblyVo() {
		super();
	}

	public AssemblyVo(int assem_no, String assem_name) {
		super();
		this.assem_no = assem_no;
		this.assem_name = assem_name;
	}

	public int getAssem_no() {
		return assem_no;
	}

	public void setAssem_no(int assem_no) {
		this.assem_no = assem_no;
	}

	public String getAssem_name() {
		return assem_name;
	}

	public void setAssem_name(String assem_name) {
		this.assem_name = assem_name;
	}

	@Override
	public String toString() {
		return "AssemblyVo [assem_no=" + assem_no + ", assem_name=" + assem_name + "]";
	}
	
	
	
}
