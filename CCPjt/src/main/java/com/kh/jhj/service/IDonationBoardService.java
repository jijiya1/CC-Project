package com.kh.jhj.service;

import java.util.List;

import com.kh.jhj.domain.DonationVo;

public interface IDonationBoardService {
	public List<DonationVo> list() throws Exception;
	public DonationVo read(int serialNo) throws Exception;

}
