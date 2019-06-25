import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDaoTest {
	
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
}
