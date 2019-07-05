package com.kh.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.domain.LoginDto;
import com.kh.domain.PagingDto;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.service.IUserJoinService;
import com.kh.sbj.util.EmailCertifiedKey;
import com.kh.sbj.util.MailHandler;
import com.kh.service.IAdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	IAdminService adminService;
	
	@Inject
	IUserJoinService userJoinService;
	
	@RequestMapping(value="/user_list", method=RequestMethod.GET)
	public void getUserList(PagingDto pagingDto, Model model) throws Exception {
		List<UserInfoVo> getUserList = adminService.getUserList(pagingDto);
		model.addAttribute("userinfoVo", getUserList);
		
		int getUserCount = adminService.getUserCount();
		model.addAttribute("getUserCount", getUserCount);
	}
	
	// 회원 관리 버튼 중 탈퇴 기능
	@ResponseBody
	@RequestMapping(value="/user_delete", method=RequestMethod.GET)
	public ResponseEntity<String> userDelete(String u_email) throws Exception {
		ResponseEntity<String> entity = null;
//		System.out.println("u_email : " + u_email);
		try {
			adminService.userDelete(u_email);
//			System.out.println("실행됨");
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_GATEWAY);
		}
		
		return entity;
	}
	
	// 회원 상세정보 조회
	@RequestMapping(value="/user_detail", method=RequestMethod.GET)
	public void userUpdate(String u_email, Model model) throws Exception {
		UserInfoVo userDetailVo = adminService.loadUserInfo(u_email);
		model.addAttribute("userDetailVo", userDetailVo);
	}
	
	// 변경된 비밀번호 이메일로 보내기
	@RequestMapping(value = "/send_newPw", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> spendNewPw(@RequestBody String u_email) throws Exception {
		ResponseEntity<String> entity = null;
		System.out.println("u_email = "+ u_email);
		try {
			String key = new EmailCertifiedKey().getKey(12, false);
			LoginDto loginDto = new LoginDto(u_email, key);
			userJoinService.updatePw(loginDto);
	        MailHandler sendMail = new MailHandler(mailSender);
	        sendMail.setSubject("[비밀번호 찾기]");
	        sendMail.setText(new StringBuffer().append("<h1>비밀번호찾기</h1>")
	        		.append("<a>새 비밀번호입니다.</a><br>")
	        		.append("<a>로그인 후 변경해주세요.</a><br>")
	        		.append("<span style='font-size:2em;  color: green;'>")
	        		.append(key)
	        		.append("</span><br>")
	                .toString());
	        sendMail.setFrom("bernardSon91@gmail.com","son");
	        sendMail.setTo(u_email);
	        sendMail.send();
	        entity = new ResponseEntity<String>("true", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
