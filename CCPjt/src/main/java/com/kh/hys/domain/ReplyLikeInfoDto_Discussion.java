package com.kh.hys.domain;

public class ReplyLikeInfoDto_Discussion {
	private int r_no;
	private String u_id;
	private int r_up;
	private int r_down;

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

	public int getR_up() {
		return r_up;
	}

	public void setR_up(int r_up) {
		this.r_up = r_up;
	}

	public int getR_down() {
		return r_down;
	}

	public void setR_down(int r_down) {
		this.r_down = r_down;
	}

	@Override
	public String toString() {
		return "ReplyLikeInfoDto_Discussion [r_no=" + r_no + ", u_id=" + u_id + ", r_up=" + r_up + ", r_down=" + r_down
				+ "]";
	}

}
