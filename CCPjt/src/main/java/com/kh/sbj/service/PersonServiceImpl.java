package com.kh.sbj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.domain.AreaDataVo;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.domain.AssemblyVo;
import com.kh.sbj.persistence.IPersonDao;

@Service
public class PersonServiceImpl implements IPersonService {

	@Inject
	private IPersonDao personDao;
	
	@Override
	public List<UserInfoVo> selectAll(String a_name) throws Exception {
		List<UserInfoVo> list = personDao.selectAll(a_name);
		return list;
	}

	@Override
	public UserInfoVo selectPerson(String u_id) throws Exception {
		UserInfoVo userInfoVo = personDao.selectPerson(u_id);
		return userInfoVo;
	}

	@Override
	public AreaDataVo selectArea(int a_no) throws Exception {
		AreaDataVo areaDataVo = personDao.selectArea(a_no);
		return areaDataVo;
	}

	@Override
	public List<AssemblyVo> selectAssemList(String u_email) throws Exception {
		List<AssemblyVo> list = personDao.selectAssemList(u_email);
		return list;
	}

	@Override
	public String selectElection(int electionCnt) throws Exception {
		String election_name = personDao.selectElection(electionCnt);
		return election_name;
	}

}
