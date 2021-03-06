//package com.kh.sbj.controller;
//
//import javax.inject.Inject;
//import javax.mail.Session;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.kh.domain.LoginDto;
//import com.kh.domain.UserInfoVo;
//import com.kh.sbj.service.IUserJoinService;
//import com.kh.sbj.util.EmailCertifiedKey;
//import com.kh.sbj.util.MailHandler;
//
//
//@Controller
////@RequestMapping("/user_join/*")
//public class UserMessageController {
//	String checkCertified;
//	
//	@Inject
//	private JavaMailSender mailSender;
//	
//	@Inject
//	private IUserJoinService userJoinService;
//	
//	@RequestMapping(value = "/join_form", method = RequestMethod.GET)
//	public void joinForm() throws Exception{
//	}
//	
//	@RequestMapping(value = "/join_run", method = RequestMethod.POST)
//	public String joinRun(@RequestParam("joinEmail") String joinEmail, @RequestParam("joinPw") String joinPw, @RequestParam("joinName") String joinName,
//			@RequestParam("joinAddress") String joinAddress, @RequestParam("joinDetailAddress") String joinDetailAddress) throws Exception{
//		String[] add = joinAddress.split(" ");
//		String detailAdd = "";
//		for(int i=2 ; i<add.length; i++) {
//			detailAdd += add[i];
//		}
//		
//		UserInfoVo userInfoVo = new UserInfoVo();
//		userInfoVo.setU_email(joinEmail);
//		userInfoVo.setU_pw(joinPw);
//		userInfoVo.setU_name(joinName);
//		userInfoVo.setU_address(add[0]);
//		userInfoVo.setU_detail(add[1]);
//		userInfoVo.setU_local(detailAdd + " " + joinDetailAddress);
//		
//		userJoinService.insertUser(userInfoVo);
//		
//		return "redirect:/login/";
//	}
//	
//	@RequestMapping(value = "/update_form", method = RequestMethod.GET)
//	public void updateForm() throws Exception{
//	}
//	
//	@RequestMapping(value = "/update_run", method = RequestMethod.POST)
//	public String updateRun(HttpSession session, @RequestParam("joinPw") String joinPw, @RequestParam("joinName") String joinName,
//			@RequestParam("joinAddress") String joinAddress, @RequestParam("joinDetailAddress") String joinDetailAddress) throws Exception{
//		UserInfoVo userVo = (UserInfoVo) session.getAttribute("userVo");
//		String joinEmail = userVo.getU_email();
//		String[] add = joinAddress.split(" ");
//		String detailAdd = "";
//		for(int i=2 ; i<add.length; i++) {
//			detailAdd += add[i];
//		}
//		
//		
//		UserInfoVo userInfoVo = new UserInfoVo();
//		userInfoVo.setU_email(joinEmail);
//		userInfoVo.setU_pw(joinPw);
//		userInfoVo.setU_name(joinName);
//		userInfoVo.setU_address(add[0]);
//		userInfoVo.setU_detail(add[1]);
//		userInfoVo.setU_local(detailAdd + " " + joinDetailAddress);
//		
//		userJoinService.updateUser(userInfoVo);
//		session.setAttribute("userVo", userInfoVo);
//		return "redirect:/user_join/update_form";
//	}
//
//	@RequestMapping(value = "/update_pw", method = RequestMethod.GET)
//	public String updatePassword(HttpSession session, @RequestParam("hiddenPw") String hiddenPw) throws Exception{
//		UserInfoVo userVo = (UserInfoVo) session.getAttribute("userVo");
//		String u_email = userVo.getU_email();
//		String u_pw = hiddenPw;
//		LoginDto loginDto = new LoginDto(u_email, u_pw);
//		userJoinService.updatePw(loginDto);
//		userVo.setU_pw(u_pw);
//		session.setAttribute("userVo", userVo);
//		return "redirect:/user_join/update_form";
//	}
//	
//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
//	public String updateRun(@RequestParam("joinEmail") String joinEmail, @RequestParam("joinPw") String joinPw) throws Exception{
//		LoginDto loginDto = new LoginDto();
//		
//		loginDto.setU_email(joinEmail);
//		loginDto.setU_pw(joinPw);
//		
//		userJoinService.deleteUser(loginDto);
//		
//		return "redirect:/";
//	}
//	@RequestMapping(value = "/send_email", method = RequestMethod.POST)
//	@ResponseBody
//	public ResponseEntity<String> sendEmail(@RequestBody String joinEmail) throws Exception {
//		ResponseEntity<String> entity = null;
//		boolean duplicateResult = userJoinService.duplicateCheck(joinEmail);
//		
//		try {
//			if(duplicateResult==true) {
//				entity = new ResponseEntity<String>("duplicate", HttpStatus.OK);
//			}else {
//				String key = new EmailCertifiedKey().getKey(5, false);
//				checkCertified = key;
//		        MailHandler sendMail = new MailHandler(mailSender);
//		        sendMail.setSubject("[이메일 인증]");
//		        sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
//		        		.append("<a>이메일 인증 번호입니다.</a><br>")
//		        		.append("<span style='font-size:1.5em;  color: green;'>")
//		        		.append(key)
//		        		.append("</span><br>")
//		                .toString());
//		        sendMail.setFrom("bernardSon91@gmail.com","son");
//		        sendMail.setTo(joinEmail);
//		        sendMail.send();
//				entity = new ResponseEntity<String>("true", HttpStatus.OK);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
//	
//	@RequestMapping(value = "/certified_email", method = RequestMethod.POST)
//	@ResponseBody
//	public ResponseEntity<String> certifiedEmail(@RequestBody String certifiedNum) throws Exception {
//		ResponseEntity<String> entity = null;
//		String checkResult = "false";
//		if(checkCertified.equals(certifiedNum)) {
//			checkResult= "true";
//		}else{
//			checkResult = "false";
//		}
//		try {
//			entity = new ResponseEntity<String>(checkResult, HttpStatus.OK);
//		}catch(Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
//}
