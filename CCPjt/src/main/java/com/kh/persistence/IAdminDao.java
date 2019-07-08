package com.kh.persistence;

import java.util.List;

import com.kh.domain.DetailDataVo;
import com.kh.domain.UserInfoVo;

public interface IAdminDao {

	// 회원 목록 불러오기
	public List<UserInfoVo> getUserList() throws Exception;
	
	// 회원 수 불러오기
	public int getUserCount() throws Exception;
	
	// 회원 강제 탈퇴
	public void userDelete(String u_email) throws Exception;

	// 회원 상세정보 불러오기
	public UserInfoVo loadUserInfo(String u_email) throws Exception;

	// 해당 지역 선거구 리스트 불러오기
	public List<DetailDataVo> selectDetailList(int a_no) throws Exception;

	//선거구 정보 불러오기
	public DetailDataVo selectDetailData(int a_no, int d_no) throws Exception;

	//지역 이름 불러오기
	public String selectAname(int a_no) throws Exception;
}
