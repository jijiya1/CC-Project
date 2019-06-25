package com.kh.sbj.persistence;

import java.util.List;

import com.kh.sbj.domain.PersonPromiseVo;

public interface IPersonMinipageDao {
	public List<PersonPromiseVo> selectAllPromise(String u_id) throws Exception;
	public void insertPromise(PersonPromiseVo personPromiseVo) throws Exception;
}
