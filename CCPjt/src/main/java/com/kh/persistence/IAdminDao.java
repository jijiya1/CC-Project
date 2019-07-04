package com.kh.persistence;

import java.util.List;

import com.kh.domain.UserInfoVo;

public interface IAdminDao {

	// 회원 목록 불러오기
	public List<UserInfoVo> getUserList() throws Exception;
	
	// 회원 수 불러오기
	public int getUserCount() throws Exception;
}
