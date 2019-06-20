package com.kh.hys.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.hys.domain.Discussion_BoardVo;

@Repository
public class Discussion_BoardDaoImpl implements IDiscussion_BoardDao {
	
	private final String NAMESPACE = "Discussion_Boared."; 
	
	@Inject
	private SqlSession sqlSession;
	
	// 토론 게시판 리스트 가져오기
	@Override
	public List<Discussion_BoardVo> getDiscussionList() throws Exception {
		List<Discussion_BoardVo> discussionList = sqlSession.selectList(NAMESPACE+"getDiscussionList");
		
		return discussionList;
	}

}
