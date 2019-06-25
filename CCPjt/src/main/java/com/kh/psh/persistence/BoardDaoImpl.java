package com.kh.psh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public List<Complaint_BoardVo> suggest_list(Complaint_PagingDto pagingDto) throws Exception {
		List<Complaint_BoardVo> list = sqlSession.selectList(NAMESPACE + ".suggest_list", pagingDto);
		return list;
	}
	//글읽기
	@Override
	public Complaint_BoardVo suggest_read(int b_no) throws Exception {
		Complaint_BoardVo vo = sqlSession.selectOne(NAMESPACE + ".suggest_read", b_no);
		return vo;
	}
	//글수정
	@Override
	public void suggest_update(Complaint_BoardVo vo) throws Exception {
		sqlSession.update(NAMESPACE + ".suggest_update", vo);
		
	}
	@Override
	public void suggest_delete(int b_no) throws Exception {
		sqlSession.delete(NAMESPACE + ".suggest_delete", b_no);
		
	}
	
}