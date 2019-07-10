package com.kh.sbj.domain;

public class PersonPromiseVo {
	private String u_email;
	private int p_no;
	private String p_name;
	private int p_progress;
	private String p_filepath;
	private int assem_no;
	
	public PersonPromiseVo() {
		super();
	}

	@Override
	public String toString() {
		return "PersonPromiseVo [u_email=" + u_email + ", p_no=" + p_no + ", p_name=" + p_name + ", p_progress="
				+ p_progress + ", p_filepath=" + p_filepath + ", assem_no=" + assem_no + "]";
	}

	public PersonPromiseVo(String u_email, int p_no, String p_name, int p_progress, String p_filepath, int assem_no) {
		super();
		this.u_email = u_email;
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_progress = p_progress;
		this.p_filepath = p_filepath;
		this.assem_no = assem_no;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_progress() {
		return p_progress;
	}

	public void setP_progress(int p_progress) {
		this.p_progress = p_progress;
	}

	public String getP_filepath() {
		return p_filepath;
	}

	public void setP_filepath(String p_filepath) {
		this.p_filepath = p_filepath;
	}

	public int getAssem_no() {
		return assem_no;
	}

	public void setAssem_no(int assem_no) {
		this.assem_no = assem_no;
	}
	
	
	 
}
