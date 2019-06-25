package com.kh.sbj.service;

import java.util.List;


import com.kh.sbj.domain.PersonPromiseVo;

public interface IPersonMinipageService {
	public List<PersonPromiseVo> selectAllPromise(String u_id) throws Exception;
	public void insertPromise(PersonPromiseVo personPromiseVo) throws Exception;
}
