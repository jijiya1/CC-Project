package com.kh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
