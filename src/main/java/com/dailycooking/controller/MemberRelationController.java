package com.dailycooking.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailycooking.domain.MemberVO;
import com.dailycooking.service.MemberRelationService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MemberRelationController { // 회원 관련된 컨트롤러 사용 예정
	
	private MemberRelationService service;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) { // 관리자 페이지에 사용자가 접근할때 접근 거부 페이지로 이동
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "접근이 거부되었습니다 - 관리자만 접근 가능합니다");
	}
	
	@GetMapping("/join")
	public void join() {
		log.info("join getMapping");
	}
	
	@PostMapping("/join")
	public String join(MemberVO mvo, RedirectAttributes rttr) {
		
		log.info("join postMapping");
		
		if(service.join(mvo) == 1) { // 회원 가입에 성공하면
			rttr.addFlashAttribute("joinResult","회원가입에 성공하였습니다");
		} else {
			rttr.addFlashAttribute("joinResult", "회원가입에 실패하였습니다");
		}
		
		return "redirect:/customLogin";
	}
	
	@GetMapping("/customLogin")
	public void login(String error, String logout, Model model) {
		log.info("login getMapping");
		log.info("error : " + error);
		log.info("logout : " + logout);
		if(error != null) {
			model.addAttribute("error","로그인에 실패하였습니다. 다시 확인 바랍니다");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 처리 되었습니다");
		}
	}
}
