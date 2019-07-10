package com.kh.jhj.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
import com.kh.domain.PagingDto;
import com.kh.jhj.domain.PetitionVo;

@Repository
public class PeBoardDaoImpl implements IPeBoardDao {

	private static final String NAMESPACE = "petition_board.";
	
	@Inject
	private SqlSession sqlSession;

	
	@Override
	public List<PetitionVo> listAll(PagingDto pageDto, int a_no) throws Exception {
		AreaDataVo areaDataVo = new AreaDataVo();
			areaDataVo.setA_no(a_no);
		
		HashMap<String, Object> listMap = new HashMap<>();
			listMap.put("areaDataVo", areaDataVo);
			listMap.put("pagingDto", pageDto);
//		System.out.println("Dao pageDto:" + pageDto);
		List<PetitionVo> pList = sqlSession.selectList(NAMESPACE+"listAll", listMap);
		return pList;
	}

	@Override
	public int listCount(PagingDto pageDto, int a_no) throws Exception {
			AreaDataVo areaDataVo = new AreaDataVo();
				areaDataVo.setA_no(a_no);
			
			HashMap<String, Object> countMap = new HashMap<>();
				countMap.put("pagingDto", pageDto);
				countMap.put("areaDataVo", areaDataVo);
		int count = sqlSession.selectOne(NAMESPACE+"listCount", countMap);
		return count;
	}

	@Override
	public List<PetitionVo> listMain(int a_no) throws Exception {
		List<PetitionVo> pMain = sqlSession.selectList(NAMESPACE+"listMain", a_no);
		return pMain;
	}

	@Override
	public PetitionVo petitionRead(String b_serialno) throws Exception {
		PetitionVo peVo = sqlSession.selectOne(NAMESPACE + "petitionRead", b_serialno);
		return peVo;
	}

	@Override
	public void petitionDel(String b_serialno) throws Exception {
//		System.out.println("peDao : " +b_serialno);
		sqlSession.update(NAMESPACE + "petitionDel", b_serialno);
		
	}

	@Override
	public List<PetitionVo> listRunOut(int a_no) throws Exception {
		List<PetitionVo> peVo = sqlSession.selectList(NAMESPACE + "listRunOut", a_no);
//		System.out.println("peVo" + peVo);
		return peVo;
	}

	@Override
	public List<DetailDataVo> detailArea(int a_no) throws Exception {
		List<DetailDataVo> dArea = sqlSession.selectList(NAMESPACE+ "detialData", a_no);
		return dArea;
	}

	@Override
	public void write(PetitionVo peVo) throws Exception {
//		System.out.println("peVoDao :" + peVo);
		sqlSession.insert(NAMESPACE+"write", peVo);
		
	}

	@Override
	public void writeLink(String link) throws Exception {
		sqlSession.insert(NAMESPACE+"writeLink", link);
		
	}

	@Override
	public int runOutCount(PagingDto pageDto, int a_no) throws Exception {
			AreaDataVo areaDataVo = new AreaDataVo();
			areaDataVo.setA_no(a_no);
	
			HashMap<String, Object> countMap = new HashMap<>();
				countMap.put("pagingDto", pageDto);
				countMap.put("areaDataVo", areaDataVo);
		int count = sqlSession.selectOne(NAMESPACE+"runOutCount", countMap);
		return count;
	}

	@Override
	public List<String> readLink(String b_serialno) throws Exception {
		List<String> listLink = sqlSession.selectList(NAMESPACE+ "readLink", b_serialno);
		return listLink;
	}

	@Override
	public void readCount(String b_serialno) throws Exception {
		sqlSession.update(NAMESPACE + "readCount", b_serialno);
		
	}

	@Override
	public PetitionVo confirm() throws Exception {
		PetitionVo peVo = sqlSession.selectOne(NAMESPACE + "confirm");
		return peVo;
	}

	@Override
	public List<PetitionVo> myList(String u_email) throws Exception {
		List<PetitionVo> myList = sqlSession.selectList(NAMESPACE+"myPetition", u_email);
		return myList;
	}

}
