package com.kh.service;

import java.util.List;

import com.kh.domain.PagingDto;
import com.kh.shj.domain.NoticeBoardVo;

public interface IMainService {

	// 메인페이지 공지사항 목록 불러오기 - SHJ
	public List<NoticeBoardVo> getNoticeBoardList(PagingDto pagingDto) throws Exception;
}
