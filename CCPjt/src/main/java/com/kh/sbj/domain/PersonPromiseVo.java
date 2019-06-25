package com.kh.sbj.domain;

public class PersonPromiseVo {
	private String u_id;
	private int p_no;
	private String p_name;
	private int p_progress;
	private String p_filePath;
	
	public PersonPromiseVo() {
		super();
	}

	public PersonPromiseVo(String u_id, int p_no, String p_name, int p_progress, String p_filePath) {
		super();
		this.u_id = u_id;
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_progress = p_progress;
		this.p_filePath = p_filePath;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
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

	public String getP_filePath() {
		return p_filePath;
	}

	public void setP_filePath(String p_filePath) {
		this.p_filePath = p_filePath;
	}
	 
	
	 
}
