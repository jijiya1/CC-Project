package com.kh.sbj.service;

import java.util.List;

import com.kh.sbj.domain.PersonVo;

public interface IPersonService {
	public List<PersonVo> selectAll() throws Exception ;
	public PersonVo selectPerson(String u_id) throws Exception;
}
