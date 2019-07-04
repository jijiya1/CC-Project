package com.kh.service;

import java.util.List;

import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.jhj.domain.PetitionVo;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;

public interface IMainService {

	// 메인페이지 공지사항 목록 불러오기 - SHJ
	public List<NoticeBoardVo> getNoticeBoardList(PagingDto pagingDto) throws Exception;
	
	// 서브페이지 공지사항 목록 불러오기 - SHJ
	public List<NoticeBoardVo> getSubNoticeBoardList(PagingDto pagingDto, NoSearchDto noSearchDto, int a_no) throws Exception;
	
	// 서브페이지 토론추천 게시판 목록 불러오기 - SHJ
	public List<SelectDiscussion_BoardVo> getSubSelectDiscussionBoardList(PagingDto pagingDto, int a_no) throws Exception;
	
	// 서브페이지 청원 랭킹 5위까지 보이기 - SHJ
	public List<PetitionVo> getPetitionRankingList(int a_no) throws Exception;
}
