package com.kh.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.domain.DetailDataVo;
import com.kh.domain.LoginDto;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.service.IUserJoinService;
import com.kh.sbj.util.EmailCertifiedKey;
import com.kh.sbj.util.FileUploadUtil;
import com.kh.sbj.util.MailHandler;
import com.kh.service.IAdminService;
import com.kh.shj.domain.NoPaginationDto;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	IAdminService adminService;
	
	@Inject
	IUserJoinService userJoinService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/user_list", method=RequestMethod.GET)
	public void getUserList(NoPagingDto noPagingDto, NoSearchDto noSearchDto, Model model) throws Exception {
		
		List<UserInfoVo> getUserList = adminService.getUserList(noPagingDto, noSearchDto);
		model.addAttribute("userinfoVo", getUserList);
		
		NoPaginationDto noPaginationDto = new NoPaginationDto();
		noPaginationDto.setNoSearchDto(noSearchDto);
		noPaginationDto.setNoPagingDto(noPagingDto);
		
		int contentCount = adminService.userContentCount(noSearchDto, noPagingDto);
		noPaginationDto.setContentCount(contentCount);
//		System.out.println("contentCount : " + contentCount);
		
		model.addAttribute("noPaginationDto", noPaginationDto);
		
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
	
	// 의원 선거구 찾기
	@RequestMapping(value="/member_selectArea", method=RequestMethod.GET)
	public void memberSelectArea() throws Exception {
	}
	
	// 의원 등록 폼
	@RequestMapping(value="/member_insert_form", method=RequestMethod.GET)
	public void memberInsertForm(@RequestParam("d_no") int d_no, @RequestParam("a_no") int a_no, Model model) throws Exception {
		DetailDataVo detailDataVo = adminService.selectDetailData(a_no, d_no);
		String a_name = adminService.selectAname(a_no);
		model.addAttribute("a_name", a_name);
		model.addAttribute("detailDataVo" , detailDataVo);
	}
	
	//의원 등록 하기
	@RequestMapping(value="/member_insert_run", method=RequestMethod.POST)
	public String memberInsertRun(UserInfoVo userInfoVo, MultipartFile file, String u_address, String u_detail, Model model) throws Exception {
		
		String originalName = file.getOriginalFilename();
		String u_email = userInfoVo.getU_email();
		String dirPath = FileUploadUtil.uploadFile(uploadPath, originalName, file.getBytes());
		String path = dirPath.replace("\\", "/");
		String resultPath = "//192.168.0.127/upload_team3/"+path;
	    MailHandler sendMail = new MailHandler(mailSender);
	    sendMail.setSubject("['지역구를 부탁해' 초대합니다.]");
	    sendMail.setText(new StringBuffer().append("<h1>국회의원 당선을 축하드립니다.</h1>")
	        	.append("<span style='font-size:2em;  color: green;'>")
	        	.append("<a>아래 링크를 누르시면 사이트로 바로 이동합니다.</a><br>")
	        	.append("<a href='http://localhost/user_join/update_member_form?u_email="+u_email+"&u_name="+userInfoVo.getU_name()+""
	        			+ "&u_photo="+resultPath+"&u_address="+u_address+"&u_detail="+u_detail+""
	        			+ "'>'지역구를 부탁해' 바로가기.</a><br>")
	       		.append("</span><br>")
	            .toString());
	    sendMail.setFrom("bernardSon91@gmail.com","son");
	    sendMail.setTo(u_email);
	    sendMail.send();
		return "redirect:/";
	}
	
	//선거구 리스트
	@RequestMapping(value = "/select_detail/{a_no}", method = RequestMethod.GET)
	public ResponseEntity<List<DetailDataVo>> selectDetailList(@PathVariable("a_no") int a_no) throws Exception {
		ResponseEntity<List<DetailDataVo>> entity = null;
		try {
			List<DetailDataVo> list = adminService.selectDetailList(a_no);
			entity = new ResponseEntity<List<DetailDataVo>>(list, HttpStatus.OK);
		}catch(Exception e)	{
			e.printStackTrace();
			entity = new ResponseEntity<List<DetailDataVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}	
		
	// 변경된 비밀번호 이메일로 보내기
	@RequestMapping(value = "/send_member", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> spendMember(@RequestBody String u_email) throws Exception {
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
	
	// 테스트 게시판
	@RequestMapping(value="/test_board", method=RequestMethod.GET)
	public void testBoard() throws Exception {
		
	}
	
}
