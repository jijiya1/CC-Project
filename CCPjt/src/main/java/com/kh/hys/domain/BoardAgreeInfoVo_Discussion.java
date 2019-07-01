package com.kh.hys.domain;

public class BoardAgreeInfoVo_Discussion {
	
	private int b_no;		// 토론 게시글 번호
	private String u_id;	// 유저 아이디
	private int agreenum;	// 찬성 || 반대  1 =찬성, 2 =반대 

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getAgreenum() {
		return agreenum;
	}

	public void setAgreenum(int agreenum) {
		this.agreenum = agreenum;
	}

	@Override
	public String toString() {
		return "BoardAgreeInfoVo_Discussion [b_no=" + b_no + ", u_id=" + u_id + ", agreenum=" + agreenum + "]";
	}

}
