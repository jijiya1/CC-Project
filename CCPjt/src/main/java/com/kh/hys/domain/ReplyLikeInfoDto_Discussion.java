package com.kh.hys.domain;

public class ReplyLikeInfoDto_Discussion {
	private int r_no;
	private String u_email; 	// 유저 아이디(email)
	private int r_likenum;

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public int getR_likenum() {
		return r_likenum;
	}

	public void setR_likenum(int r_likenum) {
		this.r_likenum = r_likenum;
	}

	@Override
	public String toString() {
		return "ReplyLikeInfoDto_Discussion [r_no=" + r_no + ", u_email=" + u_email + ", r_likenum=" + r_likenum + "]";
	}

}
