package com.kh.psh.domain;

public class Complaint_PaginationDto {
	private int totalCount; 
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next; 
	private int paginationCount = 10;
	private int pageCount;
	private Complaint_PagingDto pagingDto;
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		clacData();
	}
	
	private void clacData() {
		int perPage = pagingDto.getPerPage();
		
		pageCount = totalCount / perPage;
		if(totalCount % perPage > 0) {
			pageCount += 1;
		}
		
		int page = pagingDto.getPage();
		startPage = ((page - 1)/ paginationCount) * paginationCount + 1;
		endPage = startPage + paginationCount - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		if(startPage != 1) {
			prev = true;
		}
		if(endPage != pageCount) {
			next = true;
		}
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
	
	public int getPageCount() {
		return pageCount;
	}
	
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	public Complaint_PagingDto getPagingDto() {
		return pagingDto;
	}
	
	public void setPagingDto(Complaint_PagingDto pagingDto) {
		this.pagingDto = pagingDto;
	}
	
	@Override
	public String toString() {
		return "Complaint_PaginationDto [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", paginationCount=" + paginationCount + ", pageCount="
				+ pageCount + ", pagingDto=" + pagingDto + "]";
	}
}