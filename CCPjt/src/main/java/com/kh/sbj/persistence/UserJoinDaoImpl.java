package com.kh.sbj.persistence;

import java.util.HashMap;
import java.util.Map;

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
		sqlSession.insert("user_join.insertUser", userInfoVo);
	}

	@Override
	public void updateUser(UserInfoVo userInfoVo) throws Exception {
		sqlSession.update("user_join.updateUser", userInfoVo);

	}
	
	@Override
	public void updatePw(LoginDto loginDto) throws Exception {
		sqlSession.update("user_join.updatePw", loginDto);
		
	}

	@Override
	public void deleteUser(LoginDto loginDto) throws Exception {
		sqlSession.update("user_join.deleteUser", loginDto);

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

	@Override
	public String searchPw(String u_email) throws Exception {
		String u_pw = sqlSession.selectOne("user_join.searchPw", u_email);
		return u_pw;
	}

	@Override
	public boolean checkEmailName(String u_email, String u_name) throws Exception {
		boolean result = true;
		u_email = u_email.replace("\"", "");
		u_name = u_name.replace("\"", "");
		HashMap<String, String> map = new HashMap<>();
		map.put("u_email", u_email);
		map.put("u_name", u_name);
		int checkResult = sqlSession.selectOne("user_join.checkEmailName", map);
		if(checkResult == 1) {
			result = true;
		}else if(checkResult == 0) {
			result = false;
		}
		return result;
	}

	@Override
	public void initWithdrawDate(String u_email) throws Exception {
		sqlSession.update("user_join.initWithdrawDate", u_email);
	}


}
