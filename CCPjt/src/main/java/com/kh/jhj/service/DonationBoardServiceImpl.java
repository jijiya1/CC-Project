package com.kh.jhj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.jhj.domain.DoFileDto;
import com.kh.jhj.domain.DonationVo;
import com.kh.jhj.persistence.IDonationBoardDao;

@Service
public class DonationBoardServiceImpl implements IDonationBoardService {

	@Inject
	private IDonationBoardDao doDao;
	
	@Override
	public List<DonationVo> list() throws Exception {
		List<DonationVo> doVo = doDao.list();
		return doVo;
	}

	@Override
	public DonationVo read(int serialNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(DonationVo doVo, DoFileDto doFileDto) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
