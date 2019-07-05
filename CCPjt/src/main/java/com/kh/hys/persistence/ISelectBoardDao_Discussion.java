package com.kh.hys.persistence;

import java.util.List;

import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.hys.domain.SelectResInfoDto_Discussion;

public interface ISelectBoardDao_Discussion {
	
	// 토론 주제 추천 게시판 글 리스트 가져오기
	public List<SelectDiscussion_BoardVo> getSelectBoardList(PagingDto pagingDto,int b_addInfo) throws Exception;
	
	// 토론 주제 추천 게시판 글갯수 가져오기
	public int totalSelectBoardCount(PagingDto pagingDto,int b_addInfo) throws Exception;
	
	// 글 상세보기
	public SelectDiscussion_BoardVo readSelectBoard(int b_no) throws Exception;
	
	// 조회수 증가
	public void addReadCount(int b_no) throws Exception;
	
	// 글 쓰기 
	public void writeSelectBoard(SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception;
	
	// 글 수정 하기 
	public void modifySelectBoard(SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception;
	
	// 글 삭제 하기 (b_checkeddel = 0 -> 1 로 업데이트)
	public void deleteSelectBoard(int b_no) throws Exception;
	
	//해당 토론 추천글에 대한 추천 정보 가져오기
	public List<SelectResInfoDto_Discussion> selectBoardResList(SelectResInfoDto_Discussion selectResInfoDto_Discussion) throws Exception;
	
	//토론 추천글 추천하기 (유저 정보랑 글번호 insert)
	public void insertBoardRes(SelectResInfoDto_Discussion selectResInfoDto_Discussion) throws Exception;
	
	//해당 글에 유저가 선택했었는지 확인
	public int selectBoardResCountById(SelectResInfoDto_Discussion selectResInfoDto_Discussion) throws Exception;
	
	//토론 추천글 취소 하기
	public void deleteBoardRes(SelectResInfoDto_Discussion selectResInfoDto_Discussion) throws Exception;
	
	//해당글 갯수 업데이트
	public void selectBoardUpCountModify(int b_no) throws Exception;
	
	// 해당 게시글  추천 갯수 가져오기
	public int getSelectBoardUpCount(int b_no) throws Exception;
	
	// 추천수가 많은 게시판 3개 (추천수가 같으면 최신순으로)
	public List<SelectDiscussion_BoardVo> getBest3SelectBoard(int a_no) throws Exception;
	
}
