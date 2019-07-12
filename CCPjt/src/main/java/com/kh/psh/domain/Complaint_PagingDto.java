package com.kh.psh.domain;

public class Complaint_PagingDto {
	private int page = 1;
	private int perPage = 10;
	private int startRow = 1;
	private int endRow = startRow + perPage - 1;
	private String searchType;
	private String keyword;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		setRow();
	}
	private void setRow() {
		startRow = page * perPage - perPage + 1;
		endRow = startRow + perPage - 1;
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
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
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "Complaint_PagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow="
				+ endRow + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}