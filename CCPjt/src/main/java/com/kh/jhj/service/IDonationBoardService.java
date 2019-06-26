package com.kh.jhj.service;

import java.util.List;

import com.kh.jhj.domain.DoFileDto;
import com.kh.jhj.domain.DonationVo;

public interface IDonationBoardService {
	public List<DonationVo> list() throws Exception;
	public DonationVo read(int serialNo) throws Exception;
	public void insert(DonationVo doVo, DoFileDto doFileDto) throws Exception;

}
