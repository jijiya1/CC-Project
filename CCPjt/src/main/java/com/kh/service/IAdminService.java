package com.kh.service;

import java.util.List;

import com.kh.domain.UserInfoVo;

public interface IAdminService {
	
	// 유저 목록 불러오기
	public List<UserInfoVo> getUserList() throws Exception;
	
}
