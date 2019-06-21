package com.kh.jhj.persistence;

import java.util.List;

import com.kh.jhj.domain.DonationVo;

public interface IDonationBoardDao {
	public List<DonationVo> list() throws Exception;
	public DonationVo read(int serialNo) throws Exception;
	

}
