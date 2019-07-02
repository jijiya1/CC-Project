package com.kh.jhj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.jhj.domain.DoSearchDto;
import com.kh.jhj.domain.PetitionVo;
import com.kh.jhj.persistence.IPeBoardDao;

@Service
public class PeBoardService implements IPeBoardService {

	@Inject
	private IPeBoardDao peBoardDao;
	
	@Override
	public List<PetitionVo> listAll(int a_no) throws Exception {
		List<PetitionVo> pList = peBoardDao.listAll(a_no);
		
		return pList;
	}

	@Override
	public int listCount(DoSearchDto searchDto) throws Exception {
		int count = peBoardDao.listCount(searchDto);
		return count;
	}

	@Override
	public List<PetitionVo> listMain(int a_no) throws Exception {
		List<PetitionVo> pMain = peBoardDao.listMain(a_no);
		return pMain;
	}

}
