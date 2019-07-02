package com.kh.hys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.hys.domain.ReplyLikeInfoDto_Discussion;
import com.kh.hys.domain.ReplyPagingDto_Discussion;
import com.kh.hys.domain.ReplyVo_Discussion;
import com.kh.hys.service.IReplyService_Discussion;

@RestController
@RequestMapping("/discussion_reply/*")
public class ReplyController_Discussion {
	
	@Inject
	IReplyService_Discussion replyService_Discussion;
	
	// 토론 메인 게시판 댓글 리스트 가져오기
	@RequestMapping(value="/list/{nowDiscussion_b_serialno}/{nowReplyPage}/{u_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getDiscussionReplyList(@PathVariable("nowDiscussion_b_serialno") String nowDiscussion_b_serialno,
															@PathVariable("nowReplyPage") int nowReplyPage,
															@PathVariable("u_id") String u_id,
															ReplyPagingDto_Discussion replyPagingDto) throws Exception {
//		System.out.println("getDiscussionReplyList 실행");
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			// 현재 불러오려는 글의 시리얼 넘버 담기
			replyPagingDto.setB_serialno(nowDiscussion_b_serialno);
			
			// 페이징 하려는 번호 담기
			replyPagingDto.setNowReplyPage(nowReplyPage);
//			System.out.println("ReplyController_Discussion, getDiscussionReplyList nowDiscussion_b_serialno : " + nowDiscussion_b_serialno);
			
			List<ReplyVo_Discussion> discussionReplyList = replyService_Discussion.getDiscussionReply(replyPagingDto);
			List<ReplyLikeInfoDto_Discussion> replyLikeInfoList = replyService_Discussion.replyLikeInfoById(u_id);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("discussionReplyList", discussionReplyList);
			map.put("replyLikeInfoList", replyLikeInfoList);
			
//			System.out.println("replyLikeInfoList" + replyLikeInfoList);
			
//			System.out.println("ReplyController_Discussion, map : " + map);
//			System.out.println("ReplyController_Discussion, getDiscussionReplyList discussionReplyList : " + discussionReplyList);
			entity = new ResponseEntity<>(map , HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}// try
		
		return entity;
	}
	
	
	// 토론 메인 게시판 댓글 쓰기
	@RequestMapping(value="/writeReply/{YorNSelect}", method = RequestMethod.POST)
	public ResponseEntity<String> writeReply(@RequestBody ReplyVo_Discussion replyVo_Discussion, @PathVariable("YorNSelect") String YorNSelect ) throws Exception {
//		System.out.println("replyWrite 실행");
//		System.out.println("ReplyController_Discussion, replyWrite, replyVo_Discussion : " + replyVo_Discussion);
		
		ResponseEntity<String> entity = null;
		try {
			if(YorNSelect.equals("Y")) {
				replyVo_Discussion.setR_yesOrNo(0);
			} else if (YorNSelect.equals("N")) {
				replyVo_Discussion.setR_yesOrNo(1);
			}//if
			
//			System.out.println("ReplyController_Discussion, replyWrite, replyVo_Discussion : " + replyVo_Discussion);
			replyService_Discussion.writeReply(replyVo_Discussion);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("success", HttpStatus.BAD_REQUEST);
		}//try
		
		return entity;
	}
	
	// 토론 게시판 댓글 좋아요, 싫어요 갱신
	@RequestMapping(value="/likeOrDislikeSelect",method=RequestMethod.POST)
	public ResponseEntity<String> likeOrDislikeSelect(@RequestBody ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) {
//		System.out.println("ReplyController_Discussion, replyLikeInfoDto_Discussion : " + replyLikeInfoDto_Discussion);
		
		ResponseEntity<String> entity = null;
		
		try {
			replyService_Discussion.replylikeInfoAdd(replyLikeInfoDto_Discussion);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 토론 게시판 댓글에 답글 달기
	@RequestMapping(value="/replyComentWrite", method=RequestMethod.POST)
	public ResponseEntity<String> replyComentWrite(@RequestBody ReplyVo_Discussion replyVo_Discussion) {
		ResponseEntity<String> entity = null;
		
//		System.out.println("ReplyController_Discussion, replyComentWrite, replyVo_Discussion : " + replyVo_Discussion);
		
		try {
			replyService_Discussion.replyComentWrite(replyVo_Discussion);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 토론 게신판 댓글에 달린 답글 리스트 가져오기
	@RequestMapping(value="/replyComentList/{r_no}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVo_Discussion>> replyComentList(@PathVariable("r_no") int r_no) {
		
		ResponseEntity<List<ReplyVo_Discussion>> entity = null;
		
		try {
			List<ReplyVo_Discussion> comentList = replyService_Discussion.replyComentList(r_no);
//			System.out.println("ReplyController_Discussion, replyComentList, comentList :" + comentList);
			entity = new ResponseEntity<>(comentList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
