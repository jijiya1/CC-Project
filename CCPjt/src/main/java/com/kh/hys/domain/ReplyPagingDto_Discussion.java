package com.kh.hys.domain;

public class ReplyPagingDto_Discussion {

	private String b_serialno = "";
	private int nowReplyPage = 1;
	private int perPage = 5;
	private int startRow = nowReplyPage;
	private int endRow = startRow + perPage - 1;
	
	public String getB_serialno() {
		return b_serialno;
	}

	public void setB_serialno(String b_serialno) {
		this.b_serialno = b_serialno;
	}

	public int getNowReplyPage() {
		return nowReplyPage;
	}

	public void setNowReplyPage(int nowReplyPage) {
		this.nowReplyPage = nowReplyPage;
		
		// nowReplyPage startRow endRow
		//    1            1       5
		//    2            6       10
		
		startRow = perPage*(nowReplyPage-1) + 1;
		endRow = startRow + perPage - 1;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "ReplyPagingDto_Discussion [b_serialno=" + b_serialno + ", nowReplyPage=" + nowReplyPage + ", perPage="
				+ perPage + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}

}
