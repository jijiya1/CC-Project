package com.kh.sbj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public void updatePw(LoginDto loginDto) throws Exception {
		userJoinDao.updatePw(loginDto);
		
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
	
	@Transactional
	@Override
	public UserInfoVo userLogin(LoginDto loginDto) throws Exception {
		UserInfoVo userInfoVo = userJoinDao.userLogin(loginDto);
		String u_email = loginDto.getU_email();
		userJoinDao.initWithdrawDate(u_email);
		return userInfoVo;
	}

	@Override
	public String searchPw(String u_email) throws Exception {
		String u_pw = userJoinDao.searchPw(u_email);
		return u_pw;
	}

	@Override
	public boolean checkEmailName(String u_email, String u_name) throws Exception {
		boolean result = userJoinDao.checkEmailName(u_email, u_name);
		return result;
	}


}
