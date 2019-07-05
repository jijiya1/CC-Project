package com.kh.persistence;

import java.util.List;

import com.kh.domain.PagingDto;
import com.kh.domain.UserInfoVo;

public interface IAdminDao {

	// 회원 목록 불러오기
	public List<UserInfoVo> getUserList(PagingDto pagingDto) throws Exception;
	
	// 회원 수 불러오기
	public int getUserCount() throws Exception;
	
	// 회원 강제 탈퇴
	public void userDelete(String u_email) throws Exception;

	// 회원 상세정보 불러오기
	public UserInfoVo loadUserInfo(String u_email) throws Exception;
}
