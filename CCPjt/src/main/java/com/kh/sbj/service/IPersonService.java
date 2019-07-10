package com.kh.sbj.service;

import java.util.List;

import com.kh.domain.AreaDataVo;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.domain.AssemblyVo;

public interface IPersonService {
	public List<UserInfoVo> selectAll(String a_name) throws Exception ;
	public UserInfoVo selectPerson(String u_id) throws Exception;
	public AreaDataVo selectArea(int a_no) throws Exception;
	public List<AssemblyVo> selectAssemList(String u_email) throws Exception;
	public String selectElection(int electionCnt) throws Exception;
}
