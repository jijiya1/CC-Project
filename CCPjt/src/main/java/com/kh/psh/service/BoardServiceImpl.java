package com.kh.psh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.psh.domain.Complaint_PagingDto;
import com.kh.psh.persistence.IBoardDao;
@Service
public class BoardServiceImpl implements IBoardService {
	@Inject
	private IBoardDao boardDao;

	//글쓰기
	@Override
	public void suggest_insert(Complaint_BoardVo vo) throws Exception {
		boardDao.suggest_insert(vo);			
	}
	//글목록
	@Override
	public List<Complaint_BoardVo> suggest_list(Complaint_PagingDto pagingDto) throws Exception {
		List<Complaint_BoardVo> list = boardDao.suggest_list(pagingDto);
		return list;
	}
	//글보기
	@Override
	public Complaint_BoardVo suggest_read(int b_no) throws Exception {
		Complaint_BoardVo vo = boardDao.suggest_read(b_no);
		return vo;
	}
	//글수정
	@Override
	public void suggest_update(Complaint_BoardVo vo) throws Exception {
		boardDao.suggest_update(vo);		
	}
	@Override
	public void suggest_delete(int b_no) throws Exception {
		boardDao.suggest_delete(b_no);
		
	}
	@Override
	public int listCount(Complaint_PagingDto pagingDto) throws Exception {
		int count = boardDao.listCount(pagingDto);
		return count;
	}
}