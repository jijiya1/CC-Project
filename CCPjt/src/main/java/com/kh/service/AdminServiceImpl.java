package com.kh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.domain.UserInfoVo;
import com.kh.persistence.IAdminDao;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;

@Service
public class AdminServiceImpl implements IAdminService {
	
	@Inject
	IAdminDao adminDao;

	@Override
	public List<UserInfoVo> getUserList(NoPagingDto noPagingDto, NoSearchDto noSearchDto) throws Exception {
		List<UserInfoVo> getUserList = adminDao.getUserList(noPagingDto, noSearchDto);
		return getUserList;
	}

	@Override
	public int getUserCount() throws Exception {
		int getUserCount = adminDao.getUserCount();
//		System.out.println("Service / getUserCount : " + getUserCount);
		return getUserCount;
	}

	@Override
	public void userDelete(String u_email) throws Exception {
		adminDao.userDelete(u_email);
		
	}

	@Override
	public UserInfoVo loadUserInfo(String u_email) throws Exception {
		UserInfoVo userInfoVo = adminDao.loadUserInfo(u_email);
		return userInfoVo;
	}

	@Override
	public int userContentCount(NoSearchDto noSearchDto, NoPagingDto noPagingDto) throws Exception {
		int userContentCount = adminDao.userContentCount(noSearchDto, noPagingDto);
		return userContentCount;
	}

}
