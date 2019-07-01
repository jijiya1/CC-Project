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
	public List<PetitionVo> listAll(int b_agree) throws Exception {
		List<PetitionVo> pList = peBoardDao.listAll(b_agree);
		
		return pList;
	}

	@Override
	public int listCount(DoSearchDto searchDto) throws Exception {
		int count = peBoardDao.listCount(searchDto);
		return count;
	}

	@Override
	public List<PetitionVo> listMain() throws Exception {
		List<PetitionVo> pMain = peBoardDao.listMain();
		return pMain;
	}

}
