package com.kh.sbj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.domain.LoginDto;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.persistence.IUserJoinDao;

@Service
public class UserJoinServiceImpl implements IUserJoinService {

	@Inject
	private IUserJoinDao userJoinDao;
	
	@Override
	public void insertUser(UserInfoVo userInfoVo) throws Exception {
		userJoinDao.insertUser(userInfoVo);
	}

	@Override
	public void updateUser(UserInfoVo userInfoVo) throws Exception {
		userJoinDao.updateUser(userInfoVo);
	}

	@Override
	public void deleteUser(LoginDto loginDto) throws Exception {
		userJoinDao.deleteUser(loginDto);

	}

	@Override
	public boolean duplicateCheck(String joinEmail) throws Exception {
		boolean result = userJoinDao.duplicateCheck(joinEmail);
		return result;
	}

	@Override
	public UserInfoVo userLogin(LoginDto loginDto) throws Exception {
		UserInfoVo userInfoVo = userJoinDao.userLogin(loginDto);
		return userInfoVo;
	}

	@Override
	public String searchPw(String u_email) throws Exception {
		String u_pw = userJoinDao.searchPw(u_email);
		return u_pw;
	}

}
