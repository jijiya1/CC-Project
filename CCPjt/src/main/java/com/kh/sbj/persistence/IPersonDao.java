package com.kh.sbj.persistence;

import java.util.List;

import com.kh.domain.AreaDataVo;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.domain.PersonVo;

public interface IPersonDao {
	public List<UserInfoVo> selectAll(String a_name) throws Exception ;
	public UserInfoVo selectPerson(String u_id) throws Exception;
	public AreaDataVo selectArea(int a_no) throws Exception;
}
