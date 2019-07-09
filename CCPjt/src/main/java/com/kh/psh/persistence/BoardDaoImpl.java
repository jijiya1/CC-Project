package com.kh.psh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.psh.domain.Complaint_PagingDto;

@Repository
public class BoardDaoImpl implements IBoardDao {

	private static final String NAMESPACE = "suggest_board";
	
	@Inject
	private SqlSession sqlSession;
	
	//글쓰기
	@Override
	public void suggest_insert(Complaint_BoardVo vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", vo);

	}
	//글목록	
	@Override
	public List<Complaint_BoardVo> suggest_list(Complaint_PagingDto pagingDto, int a_no) throws Exception {
		HashMap<String, Object> data = new HashMap<>();
		data.put("Complaint_PagingDto", pagingDto);
		data.put("a_no", a_no);
		List<Complaint_BoardVo> suggest_list = sqlSession.selectList(NAMESPACE + ".suggest_list", data);
		return suggest_list;
	}
	//글읽기
	@Override
	public Complaint_BoardVo suggest_read(int b_no, int a_no) throws Exception {
		HashMap<String, Object> data = new HashMap<>();
		data.put("b_no", b_no);
		data.put("a_no", a_no);
		Complaint_BoardVo vo = sqlSession.selectOne(NAMESPACE + ".suggest_read", data);
		return vo;
	}
	//글수정
	@Override
	public void suggest_update(Complaint_BoardVo vo) throws Exception {
		sqlSession.update(NAMESPACE + ".suggest_update", vo);
		
	}
	//글삭제
	@Override
	public void suggest_delete(int b_no, int a_no) throws Exception {
		HashMap<String, Object> data = new HashMap<>();
		data.put("b_no", b_no);
		data.put("a_no", a_no);		
		sqlSession.delete(NAMESPACE + ".suggest_delete",data);
		
	}
	//글갯수
	@Override
	public int listCount(Complaint_PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + ".listCount", pagingDto);
		return count;
		
	}
	// 글 작성 시 해당 지역 번호 빼오기
	@Override
	public AreaDataVo getANo() throws Exception {
		AreaDataVo aOrderList = sqlSession.selectOne(NAMESPACE + ".getANo");
		return aOrderList;
	}
	// 글 작성 시 해당 지역 번호 하나만 빼오기
	@Override
	public AreaDataVo getAreaDataANo(int a_no) throws Exception {
		AreaDataVo getAreaDataANo = sqlSession.selectOne(NAMESPACE + ".getAreaDataANo", a_no);
		return getAreaDataANo;
	}
	@Override
	public AreaDataVo getAreaData(int a_no) throws Exception {
		AreaDataVo areaDataVo = sqlSession.selectOne(NAMESPACE + ".getAreaData", a_no);
		return areaDataVo;
	}
	@Override
	public List<AreaDataVo> getAreaDataList() throws Exception {
		List<AreaDataVo> areaDataList = sqlSession.selectList(NAMESPACE + ".getAreaDataList");
		return areaDataList;
	}
	@Override
	public List<DetailDataVo> getDetailAreaData(int a_no) throws Exception {
		List<DetailDataVo> getDetailAreaData = sqlSession.selectList(NAMESPACE + ".getDetailAreaData", a_no);
		return getDetailAreaData;
	}
	@Override
	public void suggest_ReadCountUpdate(int b_no) throws Exception {
		sqlSession.selectOne(NAMESPACE + ".suggest_ReadCountUpdate", b_no);
		
	}
}