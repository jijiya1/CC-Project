package com.kh.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
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

}
