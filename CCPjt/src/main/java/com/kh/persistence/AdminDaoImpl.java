package com.kh.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.UserInfoVo;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;

@Repository
public class AdminDaoImpl implements IAdminDao {
	
	private static final String NAMESPACE = "admin.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<UserInfoVo> getUserList(NoPagingDto noPagingDto, NoSearchDto noSearchDto) throws Exception {
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("noPagingDto", noPagingDto);
		data.put("noSearchDto", noSearchDto);
		
		List<UserInfoVo> getUserList = sqlSession.selectList(NAMESPACE + "getUserList", data);
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
	public int userContentCount(NoSearchDto noSearchDto, NoPagingDto noPagingDto) throws Exception {
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("noSearchDto", noSearchDto);
		data.put("noPagingDto", noPagingDto);
		
		int userContentCount = sqlSession.selectOne(NAMESPACE + "userContentCount", data);
		return userContentCount;
	}

}
