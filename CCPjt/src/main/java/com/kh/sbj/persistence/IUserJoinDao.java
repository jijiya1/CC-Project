package com.kh.sbj.persistence;

import com.kh.domain.LoginDto;
import com.kh.domain.UserInfoVo;

public interface IUserJoinDao {
	public void insertUser(UserInfoVo userInfoVo) throws Exception;
	public void updateUser(UserInfoVo userInfoVo) throws Exception;
	public void updatePw(LoginDto loginDto) throws Exception;
	public void deleteUser(LoginDto loginDto) throws Exception;
	public boolean duplicateCheck(String joinEmail) throws Exception;
	public UserInfoVo userLogin(LoginDto loginDto) throws Exception;
	public String searchPw(String u_email) throws Exception;
	public boolean checkEmailName(String u_email, String u_name) throws Exception;
	public void initWithdrawDate(String u_email) throws Exception;
}
