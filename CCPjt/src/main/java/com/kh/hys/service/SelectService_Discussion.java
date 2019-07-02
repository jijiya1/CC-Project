package com.kh.hys.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.hys.persistence.ISelectBoardDao_Discussion;

@Service
public class SelectService_Discussion implements ISelectService_Discussion {
	
	@Inject
	ISelectBoardDao_Discussion selectBoardDao;
	
	// 토론 주제 추천 게시판 글 리스트 가져오기
	@Override
	public List<SelectDiscussion_BoardVo> getSelectBoardList(PagingDto pagingDto, int b_addInfo) throws Exception {
		List<SelectDiscussion_BoardVo> selectBoardList = selectBoardDao.getSelectBoardList(pagingDto, b_addInfo);
		return selectBoardList;
	}
	
	// 토론 주제 추천 게시판 글갯수 가져오기
	@Override
	public int totalSelectBoardCount(int b_addInfo) throws Exception {
		int totalCount = selectBoardDao.totalSelectBoardCount(b_addInfo);
		return totalCount;
	}

}
