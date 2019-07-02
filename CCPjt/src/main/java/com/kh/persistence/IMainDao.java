package com.kh.persistence;

import java.util.List;

import com.kh.domain.PagingDto;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;

public interface IMainDao {
	
	// 메인페이지 공지사항 목록 불러오기 - SHJ
	public List<NoticeBoardVo> getNoticeBoardList(PagingDto pagingDto) throws Exception;
	
	// 서브페이지 공지사항 목록 불러오기 - SHJ
	public List<NoticeBoardVo> getSubNoticeBoardList(PagingDto pagingDto, NoSearchDto noSearchDto, int a_no) throws Exception;
	
}
