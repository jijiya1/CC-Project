package com.kh.sbj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.sbj.domain.PersonVo;
import com.kh.sbj.persistence.IPersonDao;

@Service
public class PersonServiceImpl implements IPersonService {

	@Inject
	private IPersonDao personDao;
	
	@Override
	public List<PersonVo> selectAll() throws Exception {
		List<PersonVo> list = personDao.selectAll();
		return list;
	}

}
