package com.kh.sbj.service;

import java.util.List;

import com.kh.domain.AreaDataVo;
import com.kh.sbj.domain.PersonVo;

public interface IPersonService {
	public List<PersonVo> selectAll() throws Exception ;
	public PersonVo selectPerson(String u_id) throws Exception;
	public AreaDataVo selectArea(int a_no) throws Exception;
}
