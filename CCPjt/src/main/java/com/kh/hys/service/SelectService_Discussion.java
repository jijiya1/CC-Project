package com.kh.hys.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		List<SelectDiscussion_BoardVo> selectBoardList = selectBoardDao.getSelectBoardList(pagingDto ,b_addInfo);
		return selectBoardList;
	}
	
	// 토론 주제 추천 게시판 글갯수 가져오기
	@Override
	public int totalSelectBoardCount(PagingDto pagingDto, int b_addInfo) throws Exception {
		int totalCount = selectBoardDao.totalSelectBoardCount(pagingDto, b_addInfo);
		return totalCount;
	}
	
	// 글 상세보기
	@Transactional
	@Override
	public SelectDiscussion_BoardVo readSelectBoard(int b_no) throws Exception {
		selectBoardDao.addReadCount(b_no);
		SelectDiscussion_BoardVo selectDiscussion_BoardVo = selectBoardDao.readSelectBoard(b_no);
		return selectDiscussion_BoardVo;
	}
	
	// 조회수 증가
	@Override
	public void addReadCount(int b_no) throws Exception {
		selectBoardDao.addReadCount(b_no);
	}
	
	// 글 쓰기
	@Override
	public void writeSelectBoard(SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception {
		selectBoardDao.writeSelectBoard(selectDiscussion_BoardVo);
	}
	// 글 수정하기
	@Override
	public void modifySelectBoard(SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception {
		selectBoardDao.modifySelectBoard(selectDiscussion_BoardVo);
	}
	
	// 글 삭제 하기 (b_checkeddel = 0 -> 1 로 업데이트)
	@Override
	public void deleteSelectBoard(int b_no) throws Exception {
		selectBoardDao.deleteSelectBoard(b_no);
	}

}
