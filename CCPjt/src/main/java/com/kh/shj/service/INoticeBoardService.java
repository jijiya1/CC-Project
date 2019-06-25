package com.kh.shj.service;

import java.util.List;

import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;

public interface INoticeBoardService {

	// 글 목록
	public List<NoticeBoardVo> noticeBoardList(NoSearchDto noSearchDto) throws Exception;
	
	// 해당 글 읽기
	public NoticeBoardVo noticeBoardRead(int b_no) throws Exception;
	
	// 글 갯수
	public int noticeBoardCount(NoSearchDto noSearchDto) throws Exception;
	
	// 글 작성
	public void noticeBoardWrite(NoticeBoardVo noticeBoardVo) throws Exception;
	
	// 글 수정
	public void noticeBoardUpdate(NoticeBoardVo noticeBoardVo) throws Exception;
	
	// 글 삭제
	public void noticeBoardDelete(int b_no) throws Exception;
	
}
