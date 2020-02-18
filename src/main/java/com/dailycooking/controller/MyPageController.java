package com.dailycooking.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myPage/*")
public class MyPageController {

	@GetMapping("/info")
	public String info() { // 관리자 페이지에 사용자가 접근할때 접근 거부 페이지로 이동
		log.info("마이페이지 info 페이지");
		
		return "/myPage/myPageInfo";
	}
}
