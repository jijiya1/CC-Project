package com.kh.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.DetailDataVo;
import com.kh.domain.UserInfoVo;

@Repository
public class AdminDaoImpl implements IAdminDao {
	
	private static final String NAMESPACE = "admin.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<UserInfoVo> getUserList() throws Exception {
		List<UserInfoVo> getUserList = sqlSession.selectList(NAMESPACE + "getUserList");
		return getUserList;
	}

	@Override
	public int getUserCount() throws Exception {
		int getUserCount = sqlSession.selectOne(NAMESPACE + "getUserCount");
//		System.out.println("Dao / getUserCount : " + getUserCount);
		return getUserCount;
	}

	@Override
	public void userDelete(String u_email) throws Exception {
		sqlSession.selectOne(NAMESPACE + "userDelete", u_email);
		
	}

	@Override
	public UserInfoVo loadUserInfo(String u_email) throws Exception {
		UserInfoVo userInfoVo = sqlSession.selectOne(NAMESPACE + "userDetail", u_email);
		return userInfoVo;
	}

	@Override
	public List<DetailDataVo> selectDetailList(int a_no) throws Exception {
		List<DetailDataVo> list = sqlSession.selectList(NAMESPACE + "selectDetail", a_no);
		return list;
	}

	@Override
	public DetailDataVo selectDetailData(int a_no, int d_no) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("a_no", a_no);
		map.put("d_no", d_no);
		DetailDataVo detailDataVo = sqlSession.selectOne(NAMESPACE+ "selectDetailData", map);
		return detailDataVo;
	}

	@Override
	public String selectAname(int a_no) throws Exception {
		String a_name = sqlSession.selectOne(NAMESPACE + "selectAname", a_no);
		return a_name;
	}

}
