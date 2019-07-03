package com.kh.psh.persistence;

import java.util.List;

import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.psh.domain.Complaint_PagingDto;

public interface IBoardDao {
	
	//글쓰기
	public void suggest_insert(Complaint_BoardVo vo) throws Exception;
	//글목록
	public List<Complaint_BoardVo> suggest_list(Complaint_PagingDto pagingDto) throws Exception;
	//글읽기
	public Complaint_BoardVo suggest_read(int b_no) throws Exception;
	//글수정
	public void suggest_update(Complaint_BoardVo vo) throws Exception;
	//글삭제
	public void suggest_delete(int b_no) throws Exception;
	//글갯수
	public int listCount(Complaint_PagingDto pagingDto)throws Exception;
}
