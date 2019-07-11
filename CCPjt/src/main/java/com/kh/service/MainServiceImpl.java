package com.kh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.domain.PagingDto;
import com.kh.domain.SearchMemberDto;
import com.kh.domain.UserInfoVo;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.jhj.domain.PetitionVo;
import com.kh.persistence.IMainDao;
import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.shj.domain.NoSearchDto;
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
	
	// 서브페이지 공지사항 목록 불러오기 - SHJ
	@Override
	public List<NoticeBoardVo> getSubNoticeBoardList(PagingDto pagingDto, NoSearchDto noSearchDto, int a_no) throws Exception {
		List<NoticeBoardVo> getSubNoticeBoardList = mainDao.getSubNoticeBoardList(pagingDto, noSearchDto, a_no);
		return getSubNoticeBoardList;
	}

	@Override
	public List<SelectDiscussion_BoardVo> getSubSelectDiscussionBoardList(PagingDto pagingDto, int a_no)
			throws Exception {
		List<SelectDiscussion_BoardVo> getSubSelectDiscussionBoardList = mainDao.getSubSelectDiscussionBoardList(pagingDto, a_no);
		return getSubSelectDiscussionBoardList;
	}

	@Override
	public List<PetitionVo> getPetitionRankingList(int a_no) throws Exception {
		List<PetitionVo> getPetitionRankingList = mainDao.getPetitionRankingList(a_no);
		return getPetitionRankingList;
	}

	@Override
	public List<Complaint_BoardVo> getComplaintBoardList(PagingDto pagingDto, int a_no) throws Exception {
		List<Complaint_BoardVo> getComplaintBoardList = mainDao.getComplaintBoardList(pagingDto, a_no);
		return getComplaintBoardList;
	}

	@Override
	public List<UserInfoVo> getMemberList(String a_name) throws Exception {
		List<UserInfoVo> getMemberList = mainDao.getMemberList(a_name);
		return getMemberList;
	}

	@Override
	public int getMemberCount(String a_name) throws Exception {
		int getMemberCount = mainDao.getMemberCount(a_name);
//		System.out.println("Service / getMemberCount : " + getMemberCount);
		return getMemberCount;
	}

	@Override
	public List<UserInfoVo> getSearchMemberList(NoSearchDto noSearchDto) throws Exception {
		List<UserInfoVo> getSearchMemberList = mainDao.getSearchMemberList(noSearchDto);
		return getSearchMemberList;
	}

	@Override
	public UserInfoVo searchMember(SearchMemberDto searchMemberDto) throws Exception {
		UserInfoVo userInfoVo = mainDao.searchMember(searchMemberDto);
		return userInfoVo;
	}
	
	@Override
	public int getSearchMemberCount(NoSearchDto noSearchDto) throws Exception {
		int getSearchMemberCount = mainDao.getSearchMemberCount(noSearchDto);
		return getSearchMemberCount;
	}

	@Override
	public List<NoticeBoardVo> getLocalNoticeList(PagingDto pagingDto) throws Exception {
		List<NoticeBoardVo> getLocalNoticeList = mainDao.getLocalNoticeList(pagingDto);
		return getLocalNoticeList;
	}

}
