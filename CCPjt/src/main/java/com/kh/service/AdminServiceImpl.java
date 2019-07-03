package com.kh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.domain.UserInfoVo;
import com.kh.persistence.IAdminDao;

@Service
public class AdminServiceImpl implements IAdminService {
	
	@Inject
	IAdminDao adminDao;

	@Override
	public List<UserInfoVo> getUserList() throws Exception {
		List<UserInfoVo> getUserList = adminDao.getUserList();
		return getUserList;
	}

}
