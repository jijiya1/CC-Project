package com.kh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.PagingDto;
import com.kh.shj.domain.NoticeBoardVo;

@Repository
public class MainDaoImpl implements IMainDao {
	
	private static final String NAMESPACE = "main.";

	@Inject
	SqlSession sqlSession;
	
	// 메인페이지 공지사항 목록 불러오기 - SHJ
	@Override
	public List<NoticeBoardVo> getNoticeBoardList(PagingDto pagingDto) throws Exception {
		List<NoticeBoardVo> getNoticeList = sqlSession.selectList(NAMESPACE + "getNoticeList", pagingDto);
		return getNoticeList;
	}

}
