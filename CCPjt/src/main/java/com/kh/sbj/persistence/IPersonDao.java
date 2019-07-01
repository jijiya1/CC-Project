package com.kh.sbj.persistence;

import java.util.List;

import com.kh.domain.AreaDataVo;
import com.kh.sbj.domain.PersonVo;

public interface IPersonDao {
	public List<PersonVo> selectAll() throws Exception ;
	public PersonVo selectPerson(String u_id) throws Exception;
	public AreaDataVo selectArea(int a_no) throws Exception;
}
