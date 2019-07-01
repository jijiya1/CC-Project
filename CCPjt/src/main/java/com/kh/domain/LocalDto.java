package com.kh.domain;

public class LocalDto {
	
	private String b_addInfo; 		// 지역정보(ex. 울산, 서울, 대전)
	private String b_detailInfo;	// 지역상세정보 (ex. 북구 중구 남구)

	public String getB_addInfo() {
		return b_addInfo;
	}

	public void setB_addInfo(String b_addInfo) {
		this.b_addInfo = b_addInfo;
	}

	public String getB_detailInfo() {
		return b_detailInfo;
	}

	public void setB_detailInfo(String b_detailInfo) {
		this.b_detailInfo = b_detailInfo;
	}

	@Override
	public String toString() {
		return "LocalDto [b_addInfo=" + b_addInfo + ", b_detailInfo=" + b_detailInfo + "]";
	}

}
