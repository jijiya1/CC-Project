package com.kh.hys.domain;

public class ReplyLikeInfoDto_Discussion {
	private int r_no;
	private String u_id;
	private int r_likenum;
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getR_likenum() {
		return r_likenum;
	}
	public void setR_likenum(int r_likenum) {
		this.r_likenum = r_likenum;
	}
	@Override
	public String toString() {
		return "ReplyLikeInfoDto_Discussion [r_no=" + r_no + ", u_id=" + u_id + ", r_likenum=" + r_likenum + "]";
	}

}
