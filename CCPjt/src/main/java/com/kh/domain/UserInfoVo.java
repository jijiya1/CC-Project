package com.kh.domain;

import java.sql.Timestamp;

public class UserInfoVo {
	
	private String u_email;
    private String u_pw;
    private String u_name;
    private String u_address;
    private String u_detail;
    private String u_local;
    private String u_localextra;
    private String u_grade;
    private int u_activity_rate;
    private Timestamp u_withdrawDate;
    private Timestamp u_createdDate;
    private String u_party;
    private int u_position;
    private int u_postcode;
    
	public UserInfoVo() {
		super();
	}

	public UserInfoVo(String u_email, String u_pw, String u_name, String u_address, String u_detail, String u_local,
			String u_localextra, String u_grade, int u_activity_rate, Timestamp u_withdrawDate, Timestamp u_createdDate,
			String u_party, int u_position, int u_postcode) {
		super();
		this.u_email = u_email;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_address = u_address;
		this.u_detail = u_detail;
		this.u_local = u_local;
		this.u_localextra = u_localextra;
		this.u_grade = u_grade;
		this.u_activity_rate = u_activity_rate;
		this.u_withdrawDate = u_withdrawDate;
		this.u_createdDate = u_createdDate;
		this.u_party = u_party;
		this.u_position = u_position;
		this.u_postcode = u_postcode;
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

	public String getU_localextra() {
		return u_localextra;
	}

	public void setU_localextra(String u_localextra) {
		this.u_localextra = u_localextra;
	}

	public String getU_grade() {
		return u_grade;
	}

	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}

	public int getU_activity_rate() {
		return u_activity_rate;
	}

	public void setU_activity_rate(int u_activity_rate) {
		this.u_activity_rate = u_activity_rate;
	}

	public Timestamp getU_withdrawDate() {
		return u_withdrawDate;
	}

	public void setU_withdrawDate(Timestamp u_withdrawDate) {
		this.u_withdrawDate = u_withdrawDate;
	}

	public Timestamp getU_createdDate() {
		return u_createdDate;
	}

	public void setU_createdDate(Timestamp u_createdDate) {
		this.u_createdDate = u_createdDate;
	}

	public String getU_party() {
		return u_party;
	}

	public void setU_party(String u_party) {
		this.u_party = u_party;
	}

	public int getU_position() {
		return u_position;
	}

	public void setU_position(int u_position) {
		this.u_position = u_position;
	}

	public int getU_postcode() {
		return u_postcode;
	}

	public void setU_postcode(int u_postcode) {
		this.u_postcode = u_postcode;
	}

	@Override
	public String toString() {
		return "UserInfoVo [u_email=" + u_email + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_address=" + u_address
				+ ", u_detail=" + u_detail + ", u_local=" + u_local + ", u_localextra=" + u_localextra + ", u_grade="
				+ u_grade + ", u_activity_rate=" + u_activity_rate + ", u_withdrawDate=" + u_withdrawDate
				+ ", u_createdDate=" + u_createdDate + ", u_party=" + u_party + ", u_position=" + u_position
				+ ", u_postcode=" + u_postcode + "]";
	}

	
}
