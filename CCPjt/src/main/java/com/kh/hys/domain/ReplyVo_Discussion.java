package com.kh.hys.domain;

import java.sql.Timestamp;

public class ReplyVo_Discussion {

	private String b_serialno; 			// 게시글 시리얼넘버
	private int r_no; 					// 토론 리플번호
	private String r_writer; 			// 토론 리플 작성자 닉네임
	private String u_email; 			// 유저 아이디(email)
	private String r_content; 			// 토론 리플 내용
	private Timestamp r_createdDate;	 // 토론 리플 작성일
	private Timestamp r_modifiedDate; 	// 토론 리플 수정일
	private int r_yesOrNo; 				// 토론 리플 찬반여부 0 = Yes(찬성), 1 = NO(반대)
	private int r_upcount; 				// 토론 리플 좋아요 카운트
	private int r_downcount; 			// 토론 리플 싫어요 카운트
	private int r_coment_no; 			// 토론 리플에 달리는 답글 번호
	private int r_level; 				// 토론 리플 = 0 , 리플에 다는 답글 = 1
	private int r_checkedDel; 			// 리플삭제여부
	private int totalreplycount; 		// 해당 토론게시글에 달린 댓글수
	private int r_coment_count; 		// 해당 댓글에 달린 답글 갯수

	public String getB_serialno() {
		return b_serialno;
	}

	public void setB_serialno(String b_serialno) {
		this.b_serialno = b_serialno;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Timestamp getR_createdDate() {
		return r_createdDate;
	}

	public void setR_createdDate(Timestamp r_createdDate) {
		this.r_createdDate = r_createdDate;
	}

	public Timestamp getR_modifiedDate() {
		return r_modifiedDate;
	}

	public void setR_modifiedDate(Timestamp r_modifiedDate) {
		this.r_modifiedDate = r_modifiedDate;
	}

	public int getR_yesOrNo() {
		return r_yesOrNo;
	}

	public void setR_yesOrNo(int r_yesOrNo) {
		this.r_yesOrNo = r_yesOrNo;
	}

	public int getR_upcount() {
		return r_upcount;
	}

	public void setR_upcount(int r_upcount) {
		this.r_upcount = r_upcount;
	}

	public int getR_downcount() {
		return r_downcount;
	}

	public void setR_downcount(int r_downcount) {
		this.r_downcount = r_downcount;
	}

	public int getR_coment_no() {
		return r_coment_no;
	}

	public void setR_coment_no(int r_coment_no) {
		this.r_coment_no = r_coment_no;
	}

	public int getR_level() {
		return r_level;
	}

	public void setR_level(int r_level) {
		this.r_level = r_level;
	}

	public int getR_checkedDel() {
		return r_checkedDel;
	}

	public void setR_checkedDel(int r_checkedDel) {
		this.r_checkedDel = r_checkedDel;
	}

	public int getTotalreplycount() {
		return totalreplycount;
	}

	public void setTotalreplycount(int totalreplycount) {
		this.totalreplycount = totalreplycount;
	}

	public int getR_coment_count() {
		return r_coment_count;
	}

	public void setR_coment_count(int r_coment_count) {
		this.r_coment_count = r_coment_count;
	}

	@Override
	public String toString() {
		return "ReplyVo_Discussion [b_serialno=" + b_serialno + ", r_no=" + r_no + ", r_writer=" + r_writer
				+ ", u_email=" + u_email + ", r_content=" + r_content + ", r_createdDate=" + r_createdDate
				+ ", r_modifiedDate=" + r_modifiedDate + ", r_yesOrNo=" + r_yesOrNo + ", r_upcount=" + r_upcount
				+ ", r_downcount=" + r_downcount + ", r_coment_no=" + r_coment_no + ", r_level=" + r_level
				+ ", r_checkedDel=" + r_checkedDel + ", totalreplycount=" + totalreplycount + ", r_coment_count="
				+ r_coment_count + "]";
	}

}
