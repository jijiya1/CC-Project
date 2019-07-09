package com.kh.psh.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
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
	public List<Complaint_BoardVo> suggest_list(Complaint_PagingDto pagingDto, int a_no) throws Exception {
		
		List<Complaint_BoardVo> suggest_list = boardDao.suggest_list(pagingDto, a_no);
		return suggest_list;
	}
	//글보기
	@Transactional
	@Override
	public Complaint_BoardVo suggest_read(int b_no, int a_no) throws Exception {
		Complaint_BoardVo vo = boardDao.suggest_read(b_no, a_no);
		boardDao.suggest_ReadCountUpdate(b_no);
		return vo;
	}
	//글수정
	@Override
	public void suggest_update(Complaint_BoardVo vo) throws Exception {
		boardDao.suggest_update(vo);		
	}
	//글 삭제
	@Transactional
	@Override
	public void suggest_delete(int b_no, int a_no) throws Exception {
		boardDao.suggest_delete(b_no, a_no);
	}
	//글 갯수
	@Override
	public int listCount(Complaint_PagingDto pagingDto) throws Exception {
		int count = boardDao.listCount(pagingDto);
		return count;
	}
		
	@Override
	public AreaDataVo getANo() throws Exception {
		AreaDataVo aOrderList = boardDao.getANo();
		return aOrderList;
	}
	@Override
	public AreaDataVo getAreaDataANo(int a_no) throws Exception {
		AreaDataVo getAreaDataANo = boardDao.getAreaDataANo(a_no);
		return getAreaDataANo;
	}
	@Override
	public AreaDataVo getAreaData(int a_no) throws Exception {
		AreaDataVo areaDataVo = boardDao.getAreaData(a_no);
		return areaDataVo;
	}
	@Override
	public List<AreaDataVo> getAreaDataList() throws Exception {
		List<AreaDataVo> areaDataList = boardDao.getAreaDataList();
		return areaDataList;
	}
	@Override
	public List<DetailDataVo> getDetailAreaData(int a_no) throws Exception {
		List<DetailDataVo> getDetailAreaData = boardDao.getDetailAreaData(a_no);
		return getDetailAreaData;
	}

}