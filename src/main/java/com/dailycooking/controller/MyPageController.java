package com.dailycooking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dailycooking.domain.MemberVO;
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
	public String info(String userid, Model model) { // 관리자 페이지에 사용자가 접근할때 접근 거부 페이지로 이동
		log.info("마이페이지 info 페이지");
		MemberVO mvo = service.readInfo(userid);
		
		model.addAttribute("memberInfo", mvo);
		return "/myPage/myPageInfo";
	}
}
