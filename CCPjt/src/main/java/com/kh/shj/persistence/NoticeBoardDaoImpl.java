package com.kh.shj.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.AreaData;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;

@Repository
public class NoticeBoardDaoImpl implements INoticeBoardDao {
	
	private static final String NAMESPACE = "notice_board.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<NoticeBoardVo> noticeBoardList(NoSearchDto noSearchDto, NoPagingDto noPagingDto) throws Exception {
//		System.out.println("NoticeBoardDaoImpl / noticeBoardList 실행됨");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("noSearchDto", noSearchDto);
		data.put("noPagingDto", noPagingDto);
//		System.out.println("noSearchDto" + noSearchDto);
//		data.put("dto", dto);
//		System.out.println("data : " + data);
		
		List<NoticeBoardVo> list = sqlSession.selectList(NAMESPACE + "noticeBoardList", data);
//		System.out.println("Dao list : " + list);
		return list;
	}

	@Override
	public NoticeBoardVo noticeBoardRead(int b_no, int a_no) throws Exception {
//		System.out.println("dao / b_no : " + b_no);
		
		HashMap<Object, Object> data = new HashMap<>();
		data.put("b_no", b_no);
		data.put("a_no", a_no);
		
		NoticeBoardVo noticeBoardVo = sqlSession.selectOne(NAMESPACE + "noticeBoardRead", data);
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
		sqlSession.selectOne(NAMESPACE + "noticeBoardDelete", b_no);

	}

	@Override
	public int noticeBoardCount(NoSearchDto noSearchDto) throws Exception {
		
//		HashMap<String, Object> data = new HashMap<>();
//		data.put("noSearchDto", noSearchDto);
//		data.put("noPagingDto", noPagingDto);
		
		int count = sqlSession.selectOne(NAMESPACE + "noticeBoardCount", noSearchDto);
		return count;
	}

	@Override
	public void noticeBoardReadCountUpdate(int b_no) throws Exception {
		sqlSession.selectOne(NAMESPACE + "noticeBoardReadCountUpdate", b_no);
	}

	@Override
	public AreaData getAreaData(int a_no) throws Exception {
		AreaData areaDataVo = sqlSession.selectOne(NAMESPACE + "getAreaData", a_no);
		return areaDataVo;
	}

	@Override
	public int noticeBoardContentCount(NoSearchDto noSearchDto, NoPagingDto noPagingDto) throws Exception {
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("noSearchDto", noSearchDto);
		data.put("noPagingDto", noPagingDto);
		
		int contentCount = sqlSession.selectOne(NAMESPACE + "noticeBoardContentCount", data);
		return contentCount;
	}

	@Override
	public AreaData getANo() throws Exception {
		AreaData aOrderList = sqlSession.selectOne(NAMESPACE + "getANo");
		return aOrderList;
	}

	@Override
	public List<AreaData> getAreaDataList() throws Exception {
		List<AreaData> areaDataList = sqlSession.selectList(NAMESPACE + "getAreaDataList");
		return areaDataList;
	}

}
