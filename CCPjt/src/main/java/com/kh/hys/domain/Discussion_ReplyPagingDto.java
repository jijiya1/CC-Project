package com.kh.hys.domain;

public class Discussion_ReplyPagingDto {

	private int nowReplyPage = 1;
	private int perPage = 5;
	private int startRow;
	private int endRow = startRow + perPage - 1;

	public int getNowReplyPage() {
		return nowReplyPage;
	}

	public void setNowReplyPage(int nowReplyPage) {
		this.nowReplyPage = nowReplyPage;
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
		return "Discussion_ReplyPagingDto [nowReplyPage=" + nowReplyPage + ", perPage=" + perPage + ", startRow="
				+ startRow + ", endRow=" + endRow + "]";
	}

}
