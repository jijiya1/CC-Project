package com.kh.shj.persistence;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.persistence.IAdminDao;
import com.kh.persistence.IMainDao;
import com.kh.service.IMainService;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class INoticeBoardDaoTest {
	
	@Inject
	private INoticeBoardDao boardDao;
	
	@Inject
	private IMainDao mainDao;
	
	@Inject
	private IAdminDao adminDao;
	
	@Test
	public void testSearchTest() throws Exception {
		NoSearchDto noSearchDto = new NoSearchDto();
		noSearchDto.setSearchType("b_title");
		noSearchDto.setKeyword("테스트");
		NoPagingDto noPagingDto = new NoPagingDto();
		noPagingDto.setStartRow(1);
		noPagingDto.setEndRow(10);
		
	}
	
	@Test
	public void testCount() throws Exception {
		NoSearchDto noSearchDto = new NoSearchDto();
		noSearchDto.setSearchType("b_title");
		noSearchDto.setKeyword("수정");
		boardDao.noticeBoardCount(noSearchDto);
	}
	
	@Test
	public void testMemberCount() throws Exception {
		String a_name = "울산";
		mainDao.getMemberCount(a_name);
	}
	
	@Test
	public void testUpdateUserGrade() throws Exception {
		int u_position = 0;
		String u_email = "ulsanuljugun@naver.com";
		adminDao.updateUserGrade(u_position, u_email);
	}
}
