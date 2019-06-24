package com.kh.shj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.shj.domain.NoticeBoardVo;
import com.kh.shj.persistence.INoticeBoardDao;
import com.kh.shj.persistence.NoticeBoardDaoImpl;

@Service
public class NoticeBoardServiceImpl implements INoticeBoardService {
	
	@Inject
	INoticeBoardDao noticeBoardDao;

	@Override
	public List<NoticeBoardVo> noticeBoardList() throws Exception {
		List<NoticeBoardVo> list = noticeBoardDao.noticeBoardList();
		return list;
	}

	@Override
	public NoticeBoardVo noticeBoardRead(int b_no) throws Exception {
//		System.out.println("service / b_no : " + b_no);
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
	public int noticeBoardCount() throws Exception {
		int count = noticeBoardDao.noticeBoardCount();
		return count;
	}

}
