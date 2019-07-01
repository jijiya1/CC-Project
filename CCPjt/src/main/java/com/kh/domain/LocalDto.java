package com.kh.domain;

public class LocalDto {
	
	private int b_addInfo; 		// 지역정보(ex. 울산, 서울, 대전)
	private int b_detailInfo;	// 지역상세정보 (ex. 북구 중구 남구)

	public int getB_addInfo() {
		return b_addInfo;
	}


	public void setB_addInfo(int b_addInfo) {
		this.b_addInfo = b_addInfo;
	}


	public int getB_detailInfo() {
		return b_detailInfo;
	}


	public void setB_detailInfo(int b_detailInfo) {
		this.b_detailInfo = b_detailInfo;
	}


	@Override
	public String toString() {
		return "LocalDto [b_addInfo=" + b_addInfo + ", b_detailInfo=" + b_detailInfo + "]";
	}

}
