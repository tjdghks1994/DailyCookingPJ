package com.dailycooking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberRelationController { // 회원 관련된 컨트롤러 사용 예정
	
	@PostMapping("/join")
	public void join() {
		
	}
}
