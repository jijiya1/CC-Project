package com.kh.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.PagingDto;
import com.kh.domain.SearchMemberDto;
import com.kh.domain.UserInfoVo;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.jhj.domain.PetitionVo;
import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;

@Repository
public class MainDaoImpl implements IMainDao {
	
	private static final String NAMESPACE = "main.";

	@Inject
	SqlSession sqlSession;
	
	// 메인페이지 공지사항 목록 불러오기 - SHJ
	@Override
	public List<NoticeBoardVo> getNoticeBoardList(PagingDto pagingDto) throws Exception {

		List<NoticeBoardVo> getNoticeList = sqlSession.selectList(NAMESPACE + "getNoticeList", pagingDto);
		return getNoticeList;
	}

	// 서브페이지 공지사항 목록 불러오기 - SHJ
	@Override
	public List<NoticeBoardVo> getSubNoticeBoardList(PagingDto pagingDto, NoSearchDto noSearchDto, int a_no) throws Exception {
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("pagingDto", pagingDto);
		data.put("noSearchDto", noSearchDto);
		data.put("a_no", a_no);
		
		List<NoticeBoardVo> getSubNoticeBoardList = sqlSession.selectList(NAMESPACE + "getSubnoticeBoardList", data);
		return getSubNoticeBoardList;
	}

	@Override
	public List<SelectDiscussion_BoardVo> getSubSelectDiscussionBoardList(PagingDto pagingDto, int a_no)
			throws Exception {
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("pagingDto", pagingDto);
		data.put("a_no", a_no);
		
		List<SelectDiscussion_BoardVo> getSubSelectDiscussionBoardList = sqlSession.selectList(NAMESPACE + "getSeletDiscussionList", data);
		return getSubSelectDiscussionBoardList;
	}

	@Override
	public List<PetitionVo> getPetitionRankingList(int a_no) throws Exception {
		List<PetitionVo> getPetitionRankingList = sqlSession.selectList(NAMESPACE + "getPetitionRankingList", a_no);
		return getPetitionRankingList;
	}

	@Override
	public List<Complaint_BoardVo> getComplaintBoardList(PagingDto pagingDto, int a_no) throws Exception {
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("pagingDto", pagingDto);
		data.put("a_no", a_no);
		
		List<Complaint_BoardVo> getComplaintBoardList = sqlSession.selectList(NAMESPACE + "suggest_list", data);
		return getComplaintBoardList;
	}
	
	@Override
	public List<UserInfoVo> getMemberList(String a_name) throws Exception {
		List<UserInfoVo> getMemberList = sqlSession.selectList(NAMESPACE + "selectAll", a_name);
		return getMemberList;
	}

	@Override
	public int getMemberCount(String a_name) throws Exception {
		int getMemberCount = sqlSession.selectOne(NAMESPACE + "getMemberCount", a_name);
//		System.out.println("Dao / getMemberCount : " + getMemberCount);
		return getMemberCount;
	}
	
	@Override
	public List<UserInfoVo> getSearchMemberList(NoSearchDto noSearchDto) throws Exception {
		List<UserInfoVo> getSearchMemberList = sqlSession.selectList(NAMESPACE + "getSearchMemberList", noSearchDto);
		return getSearchMemberList;
	}

	@Override
	public UserInfoVo searchMember(SearchMemberDto searchMemberDto) throws Exception {
		UserInfoVo userInfoVo = sqlSession.selectOne(NAMESPACE +"searchMember", searchMemberDto);
		return userInfoVo;
	}
	
	@Override
	public int getSearchMemberCount(NoSearchDto noSearchDto) throws Exception {
		int getSearchMemberCount = sqlSession.selectOne(NAMESPACE + "getSearchMemberCount", noSearchDto);
		return getSearchMemberCount;
	}

	@Override
	public List<NoticeBoardVo> getLocalNoticeList(PagingDto pagingDto) throws Exception {
		List<NoticeBoardVo> getLocalNoticeList = sqlSession.selectList(NAMESPACE + "getLocalNoticeList", pagingDto);
		return getLocalNoticeList;
	}

}
