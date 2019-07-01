package com.kh.sbj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.domain.AreaDataVo;
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

	@Override
	public PersonVo selectPerson(String u_id) throws Exception {
		PersonVo personVo = personDao.selectPerson(u_id);
		return personVo;
	}

	@Override
	public AreaDataVo selectArea(int a_no) throws Exception {
		AreaDataVo areaDataVo = personDao.selectArea(a_no);
		return areaDataVo;
	}

}
