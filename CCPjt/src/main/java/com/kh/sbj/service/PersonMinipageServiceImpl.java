package com.kh.sbj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.sbj.domain.AccountVo;
import com.kh.sbj.domain.PersonAccountDeleteDto;
import com.kh.sbj.domain.PersonPromiseDeleteDto;
import com.kh.sbj.domain.PersonPromiseVo;
import com.kh.sbj.persistence.IPersonMinipageDao;

@Service
public class PersonMinipageServiceImpl implements IPersonMinipageService {

	@Inject
	private IPersonMinipageDao personMinipageDao;
	
	@Override
	public List<PersonPromiseVo> selectAllPromise(String u_email) throws Exception {
		List<PersonPromiseVo> list = personMinipageDao.selectAllPromise(u_email);
		return list;
	}

	@Override
	public void insertPromise(PersonPromiseVo personPromiseVo) throws Exception {
		personMinipageDao.insertPromise(personPromiseVo);
	}

	@Override
	public void updatePromise(PersonPromiseVo personPromiseVo) throws Exception {
		personMinipageDao.updatePromise(personPromiseVo);
		
	}

	@Override
	public void deletePromise(PersonPromiseDeleteDto deleteDto) throws Exception {
		personMinipageDao.deletePromise(deleteDto);
		
	}

	@Override
	public List<AccountVo> selectAllAccount(String u_email) throws Exception {
		List<AccountVo> list = personMinipageDao.selectAllAccount(u_email);
		return list;
	}

	@Override
	public void insertAccount(AccountVo accountVo) throws Exception {
		personMinipageDao.insertAccount(accountVo);
		
	}

	@Override
	public void deleteAccount(PersonAccountDeleteDto deleteDto) throws Exception {
		personMinipageDao.deleteAccount(deleteDto);
		
	}

}
