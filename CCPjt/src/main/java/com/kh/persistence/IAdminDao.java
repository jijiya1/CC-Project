package com.kh.persistence;

import java.util.List;

import com.kh.domain.UserInfoVo;

public interface IAdminDao {

	// 유저 목록 불러오기
	public List<UserInfoVo> getUserList() throws Exception;
	
}
