package com.kh.sbj.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.LoginDto;
import com.kh.domain.UserInfoVo;

@Repository
public class UserJoinDaoImpl implements IUserJoinDao {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertUser(UserInfoVo userInfoVo) throws Exception {
		System.out.println("다오 작동 전");
		System.out.println("다오 userInfoVo 조회 = "+ userInfoVo);
		sqlSession.insert("user_join.insertUser", userInfoVo);
		System.out.println("다오 작동 후");
	}

	@Override
	public void updateUser(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUser(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean duplicateCheck(String joinEmail) throws Exception {
		boolean result = true;
		joinEmail = joinEmail.replace("\"", "");
		int checkResult = sqlSession.selectOne("user_join.duplicateCheck", joinEmail);
		if(checkResult == 1) {
			result = true;
		}else if(checkResult == 0) {
			result = false;
		}
		return result;
	}

	@Override
	public UserInfoVo userLogin(LoginDto loginDto) throws Exception {
		UserInfoVo userInfoVo = sqlSession.selectOne("user_join.loginUser", loginDto);
		return userInfoVo;
	}

}
