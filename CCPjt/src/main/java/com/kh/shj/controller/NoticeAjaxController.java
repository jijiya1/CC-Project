package com.kh.shj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.domain.AreaDataVo;
import com.kh.shj.service.INoticeBoardService;

@RestController
@RequestMapping("notice_ajax/*")
public class NoticeAjaxController {

	@Inject
	INoticeBoardService noticeBoardService;
	
	@RequestMapping(value="/getList", method=RequestMethod.GET)
	public ResponseEntity<List<AreaDataVo>> getList() throws Exception {
		ResponseEntity<List<AreaDataVo>> entity = null;
		
		
		return null;
	}
}
