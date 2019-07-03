package com.kh.hys.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.AreaDataVo;
import com.kh.domain.PagingDto;
import com.kh.hys.domain.BoardVo_Discussion;
import com.kh.hys.domain.SelectDiscussion_BoardVo;

@Repository
public class SelectBoardDaoImpl_Discussion implements ISelectBoardDao_Discussion {
	
	private final String NAMESPACE = "Select_Discussion.";
	
	@Inject
	SqlSession sqlSession;
	
	// 토론 주제 추천 게시판 글 리스트 가져오기
	@Override
	public List<SelectDiscussion_BoardVo> getSelectBoardList(PagingDto pagingDto ,int b_addInfo) throws Exception {

		AreaDataVo areaDataVo = new AreaDataVo();
		areaDataVo.setA_no(b_addInfo);
		HashMap<String, Object> map = new HashMap<>();
		map.put("pagingDto", pagingDto);
		map.put("areaDataVo", areaDataVo);
		
		List<SelectDiscussion_BoardVo> selectBoardList = sqlSession.selectList(NAMESPACE+"getSeletDiscussionList", map);
		return selectBoardList;
	}
	
	// 토론 주제 추천 게시판 글갯수 가져오기
	@Override
	public int totalSelectBoardCount(PagingDto pagingDto,int b_addInfo) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		AreaDataVo areaDataVo = new AreaDataVo();
		areaDataVo.setA_no(b_addInfo);
		
		map.put("areaDataVo", areaDataVo);
		map.put("pagingDto", pagingDto);
		
		int totalCount = sqlSession.selectOne(NAMESPACE+"totalSelectBoardCount", map);
		return totalCount;
	}
	
	// 글 상세보기
	@Override
	public SelectDiscussion_BoardVo readSelectBoard(int b_no) throws Exception {
		SelectDiscussion_BoardVo selectDiscussion_BoardVo = sqlSession.selectOne(NAMESPACE+"readSelectBoard", b_no);
		return selectDiscussion_BoardVo;
	}
	
	// 조회수 증가
	@Override
	public void addReadCount(int b_no) throws Exception {
		sqlSession.update(NAMESPACE+"addReadCount", b_no);
	}
	
	// 글 삭제 하기 (b_checkeddel = 0 -> 1 로 업데이트)
	@Override
	public void deleteSelectBoard(int b_no) throws Exception {
		sqlSession.update(NAMESPACE+"deleteSelectBoard", b_no);
		
	}


}