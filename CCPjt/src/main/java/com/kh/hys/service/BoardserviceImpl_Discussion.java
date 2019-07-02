package com.kh.hys.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.hys.domain.BoardAgreeInfoVo_Discussion;
import com.kh.hys.domain.BoardVo_Discussion;
import com.kh.hys.persistence.IBoardDao_Discussion;

@Service
public class BoardserviceImpl_Discussion implements IBoardService_Discussion {
	
	@Inject
	IBoardDao_Discussion discussionBoardDao;
	
	// 토론 주제 리스트 가져오기
	@Override
	public List<BoardVo_Discussion> getDiscussionList(int a_no) throws Exception {
		List<BoardVo_Discussion> discussionList = discussionBoardDao.getDiscussionList(a_no);
		
//		System.out.println("Discussion_serviceImpl, getDiscussionList, discussionList : " + discussionList);
		
		return discussionList;
	}
	
	// 특정유저가 토론 게시판 해당글 찬성 또는 반대 첫투표
	@Override
	public void insertAgreeInfo(BoardAgreeInfoVo_Discussion agreeInfoVo_Discussion) throws Exception {
		
		int count = discussionBoardDao.AgreeById(agreeInfoVo_Discussion);
		
		if(count == 0) {
			discussionBoardDao.insertAgreeInfo(agreeInfoVo_Discussion);
		} else {
			discussionBoardDao.ModifyAgreeInfo(agreeInfoVo_Discussion);
		}
		
		discussionBoardDao.BoardAgreeCountModify(agreeInfoVo_Discussion.getB_no());
	}
	
	// 해당 유저가 토론 게시판 해당 글에 찬성 또는 반대 투표 했었는지 판단
	@Override
	public int AgreeById(BoardAgreeInfoVo_Discussion agreeInfoVo_Discussion) throws Exception {
		int count = discussionBoardDao.AgreeById(agreeInfoVo_Discussion);
		return count;
	}
	
	// 찬성 또는 반대 투표 업데이트
	@Override
	public void ModifyAgreeInfo(BoardAgreeInfoVo_Discussion agreeInfoVo_Discussion) throws Exception {
		discussionBoardDao.ModifyAgreeInfo(agreeInfoVo_Discussion);
	}
	
	// 찬성 또는 반대 투표로 인한 메인 테이블 찬반 카운트 업데이트
	@Override
	public void BoardAgreeCountModify(int b_no) throws Exception {
		discussionBoardDao.BoardAgreeCountModify(b_no);
	}
	
	//특정 토론글 찬성 반대 갯수 가져오기
	@Override
	public BoardVo_Discussion getAgreeRatio(int b_no) throws Exception {
		BoardVo_Discussion boardVo_Discussion  =discussionBoardDao.getAgreeRatio(b_no);
		return boardVo_Discussion;
	}

}
