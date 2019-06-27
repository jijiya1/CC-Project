package com.kh.jhj.persistence;

import java.util.List;

import com.kh.jhj.domain.DoFileDto;
import com.kh.jhj.domain.DonationVo;

public interface IDonationBoardDao {
	public List<DonationVo> list() throws Exception;
	public DonationVo read(int serialNo) throws Exception;
	public void insert(DonationVo doVo) throws Exception;
	public void insertFile(DoFileDto doFileDto) throws Exception;

}
