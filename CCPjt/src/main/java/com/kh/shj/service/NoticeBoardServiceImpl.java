package com.kh.shj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.shj.domain.NoticeBoardVo;
import com.kh.shj.persistence.NoticeBoardDaoImpl;

@Service
public class NoticeBoardServiceImpl implements INoticeBoardService {
	
	@Inject
	NoticeBoardDaoImpl noticeBoardDao;

	@Override
	public List<NoticeBoardVo> noticeBoardList() throws Exception {
		
		return null;
	}

	@Override
	public NoticeBoardVo noticeBoardRead(int b_no) throws Exception {
		
		return null;
	}

	@Override
	public void noticeBoardWrite(NoticeBoardVo noticeBoardVo) throws Exception {
		

	}

	@Override
	public void noticeBoardUpdate(NoticeBoardVo noticeBoardVo) throws Exception {
		

	}

	@Override
	public void noticeBoardDelete(int b_no) throws Exception {
		

	}

}
