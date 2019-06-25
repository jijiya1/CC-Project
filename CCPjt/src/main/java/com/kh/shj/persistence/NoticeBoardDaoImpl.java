package com.kh.shj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;

@Repository
public class NoticeBoardDaoImpl implements INoticeBoardDao {
	
	private static final String NAMESPACE = "notice_board.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<NoticeBoardVo> noticeBoardList(NoSearchDto noSearchDto) throws Exception {
//		System.out.println("NoticeBoardDaoImpl / noticeBoardList 실행됨");
		List<NoticeBoardVo> list = sqlSession.selectList(NAMESPACE + "noticeBoardList", noSearchDto);
//		System.out.println("list : " + list);
		return list;
	}

	@Override
	public NoticeBoardVo noticeBoardRead(int b_no) throws Exception {
//		System.out.println("dao / b_no : " + b_no);
		NoticeBoardVo noticeBoardVo = sqlSession.selectOne(NAMESPACE + "noticeBoardRead", b_no);
		return noticeBoardVo;
	}

	@Override
	public void noticeBoardWrite(NoticeBoardVo noticeBoardVo) throws Exception {
		sqlSession.selectOne(NAMESPACE + "noticeBoardWrite", noticeBoardVo);

	}

	@Override
	public void noticeBoardUpdate(NoticeBoardVo noticeBoardVo) throws Exception {
		sqlSession.selectOne(NAMESPACE + "noticeBoardUpdate", noticeBoardVo);

	}

	@Override
	public void noticeBoardDelete(int b_no) throws Exception {
		

	}

	@Override
	public int noticeBoardCount(NoSearchDto noSearchDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "noticeBoardCount", noSearchDto);
		return count;
	}

	@Override
	public void noticeBoardReadCountUpdate(int b_no) throws Exception {
		sqlSession.selectOne(NAMESPACE + "noticeBoardReadCountUpdate", b_no);
	}

}
