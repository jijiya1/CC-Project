package com.kh.service;

import java.util.List;

import com.kh.domain.UserInfoVo;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;

public interface IAdminService {
	
	// 회원 목록 불러오기
	public List<UserInfoVo> getUserList(NoPagingDto noPagingDto, NoSearchDto noSearchDto) throws Exception;
	
	// 회원 수 불러오기
	public int getUserCount() throws Exception;
	
	// 회원 강제 탈퇴
	public void userDelete(String u_email) throws Exception;
	
	// 회원 상세정보 불러오기
	public UserInfoVo loadUserInfo(String u_email) throws Exception;
	
	// 페이지네이션에 필요한 회원 수
	public int userContentCount(NoSearchDto noSearchDto, NoPagingDto noPagingDto) throws Exception;
}
