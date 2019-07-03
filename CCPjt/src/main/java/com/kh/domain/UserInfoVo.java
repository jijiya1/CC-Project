package com.kh.domain;

public class UserInfoVo {
	
	private String u_email;
    private String u_pw;
    private String u_name;
    private String u_address;
    private String u_detail;
    private String u_local;
    private String u_grade;
    private String u_activity_rate;
    private String u_withdrawDate;
    
	public UserInfoVo() {
		super();
	}

	public UserInfoVo(String u_email, String u_pw, String u_name, String u_address, String u_detail, String u_local,
			String u_grade, String u_activity_rate, String u_withdrawDate) {
		super();
		this.u_email = u_email;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_address = u_address;
		this.u_detail = u_detail;
		this.u_local = u_local;
		this.u_grade = u_grade;
		this.u_activity_rate = u_activity_rate;
		this.u_withdrawDate = u_withdrawDate;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getU_detail() {
		return u_detail;
	}

	public void setU_detail(String u_detail) {
		this.u_detail = u_detail;
	}

	public String getU_local() {
		return u_local;
	}

	public void setU_local(String u_local) {
		this.u_local = u_local;
	}

	public String getU_grade() {
		return u_grade;
	}

	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}

	public String getU_activity_rate() {
		return u_activity_rate;
	}

	public void setU_activity_rate(String u_activity_rate) {
		this.u_activity_rate = u_activity_rate;
	}

	public String getU_withdrawDate() {
		return u_withdrawDate;
	}

	public void setU_withdrawDate(String u_withdrawDate) {
		this.u_withdrawDate = u_withdrawDate;
	}
    
	@Override
	public String toString() {
		return "UserInfoVo [u_email=" + u_email + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_address=" + u_address
				+ ", u_detail=" + u_detail + ", u_local=" + u_local + ", u_grade=" + u_grade + ", u_activity_rate="
				+ u_activity_rate + ", u_withdrawDate=" + u_withdrawDate + "]";
	}

    
}
