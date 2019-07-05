package com.kh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.PagingDto;
import com.kh.domain.UserInfoVo;

@Repository
public class AdminDaoImpl implements IAdminDao {
	
	private static final String NAMESPACE = "admin.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<UserInfoVo> getUserList(PagingDto pagingDto) throws Exception {
		List<UserInfoVo> getUserList = sqlSession.selectList(NAMESPACE + "getUserList", pagingDto);
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

}
