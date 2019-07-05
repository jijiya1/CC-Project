package com.kh.psh.persistence;

import java.util.List;


import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.psh.domain.Complaint_PagingDto;

public interface IBoardDao {
	
	//글쓰기
	public void suggest_insert(Complaint_BoardVo vo) throws Exception;
	//글목록
	public List<Complaint_BoardVo> suggest_list(Complaint_PagingDto pagingDto, int a_no) throws Exception;
	//글읽기
	public Complaint_BoardVo suggest_read(int b_no, int a_no) throws Exception;
	//글수정
	public void suggest_update(Complaint_BoardVo vo) throws Exception;
	//글삭제
	public void suggest_delete(int b_no, int a_no) throws Exception;
	//글갯수
	public int listCount(Complaint_PagingDto pagingDto)throws Exception;
	// 글 읽을 시 조회수 업데이트
	public void suggest_ReadCountUpdate(int b_no) throws Exception;
	// 글 작성 시 해당 지역 번호 빼오기
	public AreaDataVo getANo() throws Exception;	
	// 글 작성 시 해당 지역 번호 하나만 빼오기
	public AreaDataVo getAreaDataANo(int a_no) throws Exception;
	// 지역 카테고리 불러오기
	public AreaDataVo getAreaData(int a_no) throws Exception;	
	// 글 작성시 지역 카테고리 불러오기
	public List<AreaDataVo> getAreaDataList() throws Exception;	
	// 해당지역 세부정보 불러오기
	public List<DetailDataVo> getDetailAreaData(int a_no) throws Exception;
}
