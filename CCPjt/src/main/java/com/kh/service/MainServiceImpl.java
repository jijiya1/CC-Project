package com.kh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.domain.PagingDto;
import com.kh.persistence.IMainDao;
import com.kh.shj.domain.NoticeBoardVo;

@Service
public class MainServiceImpl implements IMainService {
	
	@Inject
	IMainDao mainDao;

	// 메인페이지 공지사항 목록 불러오기 - SHJ
	@Override
	public List<NoticeBoardVo> getNoticeBoardList(PagingDto pagingDto) throws Exception {
		List<NoticeBoardVo> getNoticeList = mainDao.getNoticeBoardList(pagingDto);
		return getNoticeList;
	}

}
