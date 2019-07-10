package com.kh.sbj.domain;

public class AccountVo {
	private String u_email;
    private String bank;
    private String acc_num;
    private String acc_name;
    private String acc_page;
    
	public AccountVo() {
		super();
	}

	public AccountVo(String u_email, String bank, String acc_num, String acc_name, String acc_page) {
		super();
		this.u_email = u_email;
		this.bank = bank;
		this.acc_num = acc_num;
		this.acc_name = acc_name;
		this.acc_page = acc_page;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAcc_num() {
		return acc_num;
	}

	public void setAcc_num(String acc_num) {
		this.acc_num = acc_num;
	}

	public String getAcc_name() {
		return acc_name;
	}

	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}

	public String getAcc_page() {
		return acc_page;
	}

	public void setAcc_page(String acc_page) {
		this.acc_page = acc_page;
	}

	@Override
	public String toString() {
		return "AccountVo [u_email=" + u_email + ", bank=" + bank + ", acc_num=" + acc_num + ", acc_name=" + acc_name
				+ ", acc_page=" + acc_page + "]";
	}
    
	
    
}
