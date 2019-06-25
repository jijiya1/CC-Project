package com.kh.sbj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.sbj.domain.PersonPromiseVo;
import com.kh.sbj.persistence.IPersonMinipageDao;

@Service
public class PersonMinipageServiceImpl implements IPersonMinipageService {

	@Inject
	private IPersonMinipageDao personMinipageDao;
	
	@Override
	public List<PersonPromiseVo> selectAllPromise(String u_id) throws Exception {
		List<PersonPromiseVo> list = personMinipageDao.selectAllPromise(u_id);
		System.out.println("SERVICE LIST = " + list);
		return list;
	}

	@Override
	public void insertPromise(PersonPromiseVo personPromiseVo) throws Exception {
		personMinipageDao.insertPromise(personPromiseVo);
	}

}
