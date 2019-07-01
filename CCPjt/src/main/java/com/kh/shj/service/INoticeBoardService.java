package com.kh.shj.service;

import java.util.List;

import com.kh.domain.AreaDataVo;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;

public interface INoticeBoardService {

	// 글 목록
	public List<NoticeBoardVo> noticeBoardList(NoSearchDto noSearchDto, NoPagingDto noPagingDto, int a_no) throws Exception;
	
	// 해당 글 읽기
	public NoticeBoardVo noticeBoardRead(int b_no, int a_no) throws Exception;
	
	// 글 갯수
	public int noticeBoardCount(NoSearchDto noSearchDto) throws Exception;
	
	// 페이지네이션에 필요한 글 갯수
	public int noticeBoardContentCount(NoSearchDto noSearchDto, NoPagingDto noPagingDto) throws Exception;
	
	// 글 작성
	public void noticeBoardWrite(NoticeBoardVo noticeBoardVo) throws Exception;
	
	// 글 작성 시 해당 지역 번호 빼오기
	public AreaDataVo getANo() throws Exception;
	
	// 글 수정
	public void noticeBoardUpdate(NoticeBoardVo noticeBoardVo) throws Exception;
	
	// 글 삭제
	public void noticeBoardDelete(int b_no) throws Exception;
	
	// 지역 카테고리 불러오기
	public AreaDataVo getAreaData(int a_no) throws Exception;
	
	// 글 작성시 지역 카테고리 불러오기
	public List<AreaDataVo> getAreaDataList() throws Exception;
	
}
