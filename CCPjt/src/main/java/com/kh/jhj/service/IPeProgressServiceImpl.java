package com.kh.jhj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.jhj.persistence.IPeProgressDao;

@Service
public class IPeProgressServiceImpl implements IPeProgressService {

	@Inject
	private IPeProgressDao peProgressDao;
	
	@Override
	public void prevAgree() throws Exception {
		peProgressDao.prevAgree();

	}

	@Override
	public void startAgree() throws Exception {
		peProgressDao.startAgree();
	}

	@Override
	public void ingAgree() throws Exception {
		peProgressDao.ingAgree();

	}

	@Override
	public void rouOutAgree() throws Exception {
		peProgressDao.rouOutAgree();

	}

}
