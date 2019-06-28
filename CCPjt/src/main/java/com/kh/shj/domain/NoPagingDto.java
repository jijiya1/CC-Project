package com.kh.shj.domain;

public class NoPagingDto {
	private int nowPage = 1;
	private int perPage = 10;
	private int startRow = 1;
	private int endRow = startRow + perPage - 1;
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		setRow();
	}
	
	private void setRow() {
		startRow = nowPage * perPage - perPage + 1;
		endRow = startRow + perPage - 1;
	}
	
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
		setRow();
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
		return "NoPagingDto [nowPage=" + nowPage + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow="
				+ endRow + "]";
	}
	
}
