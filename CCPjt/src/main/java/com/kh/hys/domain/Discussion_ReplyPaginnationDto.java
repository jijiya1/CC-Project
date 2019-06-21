package com.kh.hys.domain;

public class Discussion_ReplyPaginnationDto {

	private int replyTotalCount; // 리플 총 갯수
	private int startPage = 1;
	private int endPage = 10;
	private boolean prev = false;
	private boolean next = true;
	private int paginationCount = 5;
	private int nowReplyPage = 1; // 현재 보고 있는 페이지

	private Discussion_ReplyPagingDto replyPagingDto;

	public int getReplyTotalCount() {
		return replyTotalCount;
	}

	public void setReplyTotalCount(int replyTotalCount) {
		this.replyTotalCount = replyTotalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPaginationCount() {
		return paginationCount;
	}

	public void setPaginationCount(int paginationCount) {
		this.paginationCount = paginationCount;
	}

	public int getNowReplyPage() {
		return nowReplyPage;
	}

	public void setNowReplyPage(int nowReplyPage) {
		this.nowReplyPage = nowReplyPage;
	}

	public Discussion_ReplyPagingDto getReplyPagingDto() {
		return replyPagingDto;
	}

	public void setReplyPagingDto(Discussion_ReplyPagingDto replyPagingDto) {
		this.replyPagingDto = replyPagingDto;
	}

	@Override
	public String toString() {
		return "Discussion_ReplyPaginnationDto [replyTotalCount=" + replyTotalCount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", paginationCount=" + paginationCount
				+ ", nowReplyPage=" + nowReplyPage + ", replyPagingDto=" + replyPagingDto + "]";
	}

}
