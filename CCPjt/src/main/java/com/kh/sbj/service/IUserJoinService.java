package com.kh.sbj.service;

import com.kh.domain.LoginDto;
import com.kh.domain.UserInfoVo;

public interface IUserJoinService {
	public void insertUser(UserInfoVo userInfoVo) throws Exception;
	public void updateUser(UserInfoVo userInfoVo) throws Exception;
	public void deleteUser(UserInfoVo userInfoVo) throws Exception;
	public boolean duplicateCheck(String joinEmail) throws Exception;
	public UserInfoVo userLogin(LoginDto loginDto) throws Exception;

}
