package com.kh.hys.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.AreaDataVo;
import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.hys.domain.SelectResInfoDto_Discussion;

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
	
	// 글 쓰기
	@Override
	public void writeSelectBoard(SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception {
		sqlSession.insert(NAMESPACE+"selectBoardWrite", selectDiscussion_BoardVo);
	}

	// 글 수정하기
	@Override
	public void modifySelectBoard(SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception {
		sqlSession.update(NAMESPACE+"selectBoardModify", selectDiscussion_BoardVo);
	}
	
	// 글 삭제 하기 (b_checkeddel = 0 -> 1 로 업데이트)
	@Override
	public void deleteSelectBoard(int b_no) throws Exception {
		sqlSession.update(NAMESPACE+"deleteSelectBoard", b_no);
		
	}
	
	//해당 토론 추천글에 대한 추천 정보 가져오기
	@Override
	public List<SelectResInfoDto_Discussion> selectBoardResList(SelectResInfoDto_Discussion selectResInfoDto_Discussion) throws Exception {
		List<SelectResInfoDto_Discussion> selectResList = sqlSession.selectList(NAMESPACE+"selectBoardResList", selectResInfoDto_Discussion);
		return selectResList;
	}
	
	//토론 추천글 추천하기 (유저 정보랑 글번호 insert)
	@Override
	public void insertBoardRes(SelectResInfoDto_Discussion selectResInfoDto_Discussion) throws Exception {
		sqlSession.insert(NAMESPACE+"insertBoardRes", selectResInfoDto_Discussion);
	}
	
	//해당 글에 유저가 선택했었는지 확인
	@Override
	public int selectBoardResCountById(SelectResInfoDto_Discussion selectResInfoDto_Discussion) throws Exception {
		int selectedCount = sqlSession.selectOne(NAMESPACE+"selectBoardResCountById", selectResInfoDto_Discussion);
		return selectedCount;
	}
	
	//토론 추천글 취소 하기
	@Override
	public void deleteBoardRes(SelectResInfoDto_Discussion selectResInfoDto_Discussion) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteBoardRes", selectResInfoDto_Discussion);
	}
	
	//해당글 갯수 업데이트
	@Override
	public void selectBoardUpCountModify(int b_no) throws Exception {
		sqlSession.update(NAMESPACE+"selectBoardUpCountModify", b_no);
	}
	
	// 해당 게시글  추천 갯수 가져오기
	@Override
	public int getSelectBoardUpCount(int b_no) throws Exception {
		int selectBoardUpCount = sqlSession.selectOne(NAMESPACE+"getSelectBoardUpCount", b_no);
		return selectBoardUpCount;
	}
	
	// 추천수가 많은 게시판 3개 (추천수가 같으면 최신순으로)
	@Override
	public List<SelectDiscussion_BoardVo> getBest3SelectBoard(int a_no) throws Exception {
		List<SelectDiscussion_BoardVo> best3List = sqlSession.selectList(NAMESPACE+"getBest3SelectBoard", a_no);
		return best3List;
	}
	
	// 토론 주제로 선정(관리자 권한 userVo.u_grade)
	@Override
	public void insertSelectDiscussion(SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception {
		sqlSession.insert(NAMESPACE+"insertSelectDiscussion", selectDiscussion_BoardVo);
	}

}
