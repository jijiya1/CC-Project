package com.kh.jhj.domain;

public class DoPageDto {
		private int totalData;
		
		private int startRow;
		private int endRow;
		private int countRow=10;


		private int nowPage=1;
		private int startPage=1;
		private int endPage;
		private int countPage=10;
		private boolean prev;
		private boolean next;
		
		private void calcPage() {
			int totalPage = totalData/countRow;
			if(totalData%countRow >0) {
				totalPage +=1;
			}
			startPage = ((nowPage-1)/countPage)*countPage+1;
			endPage = startPage +countPage-1;
			if(endPage > totalPage) {
				endPage = totalPage;
				next=false;
			}
			
			if(startPage > countPage) {
				prev=true;
			}
			
			endRow = nowPage*countRow;
			startRow = endRow -countRow+1;
		}
		
		public int getTotalData() {
			return totalData;
		}

		public void setTotalData(int totalData) {
			this.totalData = totalData;
			calcPage();
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
		public int getCountRow() {
			return countRow;
		}
		public void setCountRow(int countRow) {
			this.countRow = countRow;
		}
		public int getNowPage() {
			return nowPage;
		}
		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
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
		public int getCountPage() {
			return countPage;
		}
		public void setCountPage(int countPage) {
			this.countPage = countPage;
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

		@Override
		public String toString() {
			return "PageDto [totalData=" + totalData + ", startRow=" + startRow + ", endRow=" + endRow + ", countRow="
					+ countRow + ", nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage
					+ ", countPage=" + countPage + ", prev=" + prev + ", next=" + next + "]";
		}
		

}
