package com.kh.shj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.shj.domain.NoticeBoardVo;

@Repository
public class NoticeBoardDaoImpl implements INoticeBoardDao {
	
	private static final String NAMESPACE = "notice_board.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<NoticeBoardVo> noticeBoardList() throws Exception {
		List<NoticeBoardVo> list = sqlSession.selectOne(NAMESPACE + "noticeBoardList");
		return list;
	}

	@Override
	public NoticeBoardVo noticeBoardRead(int b_no) throws Exception {
		
		return null;
	}

	@Override
	public void noticeBoardWrite(NoticeBoardVo noticeBoardVo) throws Exception {
		

	}

	@Override
	public void noticeBoardUpdate(NoticeBoardVo noticeBoardVo) throws Exception {
		

	}

	@Override
	public void noticeBoardDelete(int b_no) throws Exception {
		

	}

}
