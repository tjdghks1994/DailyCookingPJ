package com.dailycooking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dailycooking.domain.MemberVO;
import com.dailycooking.domain.ScrapVO;
import com.dailycooking.service.MemberRelationService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myPage/*")
public class MyPageController {

	@Setter(onMethod_ = @Autowired)
	private MemberRelationService service;
	
	@GetMapping("/info")
	@PostAuthorize("isAutenticated()")
	public String info(String userid, Model model) { 
		log.info("마이페이지 info 페이지");
		MemberVO mvo = service.readInfo(userid);
		
		model.addAttribute("memberInfo", mvo);
		return "/myPage/myPageInfo";
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/infoChange", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> infoChange(MemberVO mvo) {
		log.info("회원 정보 변경 컨트롤러 : " + mvo);
		int infoResult = service.infoChange(mvo);
		
		return infoResult == 1 ? new ResponseEntity<>("infoOk", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/pwChange", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> changePw(MemberVO mvo){
		log.info("회원 비밀번호 변경하기 컨트롤러 : " + mvo.getUserid());
		
		int changeResult = service.pwChange(mvo);
		
		return changeResult == 1 ? new ResponseEntity<>("changeOk", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/removeMember", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> removeMember(String userid){
		log.info("회원 탈퇴 컨트롤러 : " + userid);
		
		int removeResult = service.removeMember(userid);
		
		return removeResult == 1 ? new ResponseEntity<>("removeOk", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/board")
	@PostAuthorize("isAutenticated()")
	public String board(String userid, Model model) { 
		log.info("마이페이지 board 페이지");
		
		return "/myPage/myPageBoard";
	}
}
