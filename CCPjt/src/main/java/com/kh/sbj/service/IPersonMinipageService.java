package com.kh.sbj.service;

import java.util.List;

import com.kh.sbj.domain.AccountVo;
import com.kh.sbj.domain.PersonAccountDeleteDto;
import com.kh.sbj.domain.PersonPromiseDeleteDto;
import com.kh.sbj.domain.PersonPromiseVo;

public interface IPersonMinipageService {
	public List<PersonPromiseVo> selectAllPromise(String u_email) throws Exception;
	public void insertPromise(PersonPromiseVo personPromiseVo) throws Exception;
	public void updatePromise(PersonPromiseVo personPromiseVo) throws Exception;
	public void deletePromise(PersonPromiseDeleteDto deleteDto) throws Exception;
	public List<AccountVo> selectAllAccount(String u_email) throws Exception;
	public void insertAccount(AccountVo accountVo) throws Exception;
	public void deleteAccount(PersonAccountDeleteDto deleteDto) throws Exception;
}
