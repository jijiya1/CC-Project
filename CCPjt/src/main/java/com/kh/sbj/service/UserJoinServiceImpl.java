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
		System.out.println("서비스 작동 전");
		System.out.println("서비스 userInfoVo 조회 = "+ userInfoVo);
		userJoinDao.insertUser(userInfoVo);
		System.out.println("서비스 작동 후");
	}

	@Override
	public void updateUser(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUser(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub

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

}
