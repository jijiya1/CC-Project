package com.kh.shj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;
import com.kh.shj.persistence.INoticeBoardDao;
import com.kh.shj.persistence.NoticeBoardDaoImpl;

@Service
public class NoticeBoardServiceImpl implements INoticeBoardService {
	
	@Inject
	INoticeBoardDao noticeBoardDao;

	@Override
	public List<NoticeBoardVo> noticeBoardList(NoSearchDto noSearchDto) throws Exception {
		List<NoticeBoardVo> list = noticeBoardDao.noticeBoardList(noSearchDto);
		return list;
	}

	@Transactional
	@Override
	public NoticeBoardVo noticeBoardRead(int b_no) throws Exception {
//		System.out.println("service / b_no : " + b_no);
		noticeBoardDao.noticeBoardReadCountUpdate(b_no);
		NoticeBoardVo noticeBoardVo = noticeBoardDao.noticeBoardRead(b_no);
		return noticeBoardVo;
	}

	@Override
	public void noticeBoardWrite(NoticeBoardVo noticeBoardVo) throws Exception {
		noticeBoardDao.noticeBoardWrite(noticeBoardVo);

	}

	@Override
	public void noticeBoardUpdate(NoticeBoardVo noticeBoardVo) throws Exception {
		noticeBoardDao.noticeBoardUpdate(noticeBoardVo);

	}

	@Override
	public void noticeBoardDelete(int b_no) throws Exception {
		

	}

	@Override
	public int noticeBoardCount(NoSearchDto noSearchDto) throws Exception {
		int count = noticeBoardDao.noticeBoardCount(noSearchDto);
		return count;
	}

}