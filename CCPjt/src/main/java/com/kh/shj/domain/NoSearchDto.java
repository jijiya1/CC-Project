package com.kh.shj.domain;

public class NoSearchDto {
	
	private String searchType;
	private String searchTypeAll;
	private String keyword;
	private String keywordAll;
	
	public String getSearchTypeAll() {
		return searchTypeAll;
	}

	public void setSearchTypeAll(String searchTypeAll) {
		this.searchTypeAll = searchTypeAll;
	}

	public String getKeywordAll() {
		return keywordAll;
	}

	public void setKeywordAll(String keywordAll) {
		this.keywordAll = keywordAll;
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
		return "NoSearchDto [searchType=" + searchType + ", searchTypeAll=" + searchTypeAll + ", keyword=" + keyword
				+ ", keywordAll=" + keywordAll + "]";
	}
	
}
