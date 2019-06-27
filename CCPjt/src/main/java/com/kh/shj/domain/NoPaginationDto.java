package com.kh.shj.domain;

public class NoPaginationDto {
	private int contentCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private boolean prevTen;
	private boolean nextTen;
	private int paginationButtonCount = 10;
	private NoPagingDto noPagingDto;
	private NoSearchDto noSearchDto;
	
	private void calcData() {
		int perPage = noPagingDto.getPerPage();
		
		int paginationCount = contentCount / perPage;
		if (contentCount % perPage > 0) {
			paginationCount += 1;
		}
		
		int page = noPagingDto.getNowPage();
//		startPage = ((page - 1) / paginationButtonCount) * paginationButtonCount + 1;
//		endPage = startPage + paginationButtonCount - 1;
//		System.out.println("endPage : " + endPage);
//		if (endPage > paginationCount) {
//			endPage = paginationCount;
//		}
//		
//		if (startPage == 1) {
//			prev = true;
//		}
//		
//		if (endPage == paginationCount) {
//			next = true;
//		}
		
		startPage = page - 4;
		if (startPage <= 1) {
			startPage = 1;
		}
		
		endPage = page + 4;
		if (endPage > paginationCount) {
			endPage = paginationCount;
			next = true;
			nextTen = true;// 마지막 페이지일 시 다음 버튼 출력 여부 설정하기
		}
		
		if (noPagingDto.getNowPage() == 1) {
			prev = true;
			prevTen = true;
		}
		
		if (noPagingDto.getNowPage() <= 10 ) {
			prevTen = true;
		}
		
		int paginationCountSubNine = paginationCount - 9;
//		System.out.println("test : " + paginationCountSubTen);
		if (page >= paginationCountSubNine) {
			nextTen = true;
		}
		
//		System.out.println("endPage : " + endPage);
//		System.out.println("paginationCount : " + paginationCount);
//		System.out.println("paginationButtonCount : " + paginationButtonCount);
		
	}

	public int getContentCount() {
		return contentCount;
	}

	public void setContentCount(int contentCount) {
		this.contentCount = contentCount;
		calcData();
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
	
	public boolean isPrevTen() {
		return prevTen;
	}

	public void setPrevTen(boolean prevTen) {
		this.prevTen = prevTen;
	}

	public boolean isNextTen() {
		return nextTen;
	}

	public void setNextTen(boolean nextTen) {
		this.nextTen = nextTen;
	}

	public int getPaginationButtonCount() {
		return paginationButtonCount;
	}

	public void setPaginationButtonCount(int paginationButtonCount) {
		this.paginationButtonCount = paginationButtonCount;
	}

	public NoPagingDto getNoPagingDto() {
		return noPagingDto;
	}

	public void setNoPagingDto(NoPagingDto noPagingDto) {
		this.noPagingDto = noPagingDto;
	}

	public NoSearchDto getNoSearchDto() {
		return noSearchDto;
	}

	public void setNoSearchDto(NoSearchDto noSearchDto) {
		this.noSearchDto = noSearchDto;
	}

	@Override
	public String toString() {
		return "NoPaginationDto [contentCount=" + contentCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", prevTen=" + prevTen + ", nextTen=" + nextTen
				+ ", paginationButtonCount=" + paginationButtonCount + ", noPagingDto=" + noPagingDto + ", noSearchDto="
				+ noSearchDto + "]";
	}
	
}
