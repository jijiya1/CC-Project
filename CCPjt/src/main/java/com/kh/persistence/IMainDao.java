package com.kh.persistence;

import java.util.List;

import com.kh.domain.PagingDto;
import com.kh.domain.UserInfoVo;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.jhj.domain.PetitionVo;
import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;

public interface IMainDao {
	
	// 메인페이지 공지사항 목록 불러오기 - SHJ
	public List<NoticeBoardVo> getNoticeBoardList(PagingDto pagingDto) throws Exception;
	
	// 의원 검색시 의원 목록 불러오기 - SHJ
	public List<UserInfoVo> getSearchMemberList(NoSearchDto noSearchDto) throws Exception;
	
	// 의원 검색시 수 구하기 - SHJ
	public int getSearchMemberCount(NoSearchDto noSearchDto) throws Exception;
	
	// 서브페이지 공지사항 목록 불러오기 - SHJ
	public List<NoticeBoardVo> getSubNoticeBoardList(PagingDto pagingDto, NoSearchDto noSearchDto, int a_no) throws Exception;

	// 서브페이지 토론추천 게시판 목록 불러오기 - SHJ
	public List<SelectDiscussion_BoardVo> getSubSelectDiscussionBoardList(PagingDto pagingDto, int a_no) throws Exception;
	
	// 서브페이지 청원 랭킹 5위까지 보이기 - SHJ
	public List<PetitionVo> getPetitionRankingList(int a_no) throws Exception;
	
	// 서브페이지 자유게시판 목록 불러오기 - SHJ
	public List<Complaint_BoardVo> getComplaintBoardList(PagingDto pagingDto, int a_no) throws Exception;
	
	// 서브페이지 의원 정보 불러오기 - SHJ
	public List<UserInfoVo> getMemberList(String a_name) throws Exception;
	
	// 서브페이지 의원 수 구하기 - SHJ
	public int getMemberCount(String a_name) throws Exception;
	
}
