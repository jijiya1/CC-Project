package com.kh.service;

import java.util.List;

import com.kh.domain.UserInfoVo;

public interface IAdminService {
	
	// 회원 목록 불러오기
	public List<UserInfoVo> getUserList() throws Exception;
	
	// 회원 수 불러오기
	public int getUserCount() throws Exception;
	
	// 회원 강제 탈퇴
	public void userDelete(String u_email) throws Exception;
}