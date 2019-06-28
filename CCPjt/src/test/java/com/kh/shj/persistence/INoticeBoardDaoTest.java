package com.kh.shj.persistence;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class INoticeBoardDaoTest {
	
	@Inject
	private INoticeBoardDao boardDao;
	
	@Test
	public void testSearchTest() throws Exception {
		NoSearchDto noSearchDto = new NoSearchDto();
		noSearchDto.setSearchType("b_title");
		noSearchDto.setKeyword("수정");
		NoPagingDto noPagingDto = new NoPagingDto();
		noPagingDto.setStartRow(1);
		noPagingDto.setEndRow(10);
		boardDao.noticeBoardList(noSearchDto, noPagingDto);
	}
	
	@Test
	public void testCount() throws Exception {
		NoSearchDto noSearchDto = new NoSearchDto();
		noSearchDto.setSearchType("b_title");
		noSearchDto.setKeyword("수정");
		boardDao.noticeBoardCount(noSearchDto);
	}
}
