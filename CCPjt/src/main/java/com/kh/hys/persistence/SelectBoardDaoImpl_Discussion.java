package com.kh.hys.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.LocalDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;

@Repository
public class SelectBoardDaoImpl_Discussion implements ISelectBoardDao_Discussion {
	
	private final String NAMESPACE = "Select_Discussion.";
	
	@Inject
	SqlSession sqlSession;
	
	// 토론 주제 추천 게시판 글 리스트 가져오기
	@Override
	public List<SelectDiscussion_BoardVo> getSelectBoardList(LocalDto localDto) throws Exception {
		List<SelectDiscussion_BoardVo> selectBoardList = sqlSession.selectList(NAMESPACE+"getSeletDiscussionList", localDto);
		return selectBoardList;
	}
	
	// 토론 주제 추천 게시판 글갯수 가져오기
	@Override
	public int totalSelectBoardCount(LocalDto localDto) throws Exception {
		int totalCount = sqlSession.selectOne(NAMESPACE+"totalSelectBoardCount", localDto);
		return totalCount;
	}

}
