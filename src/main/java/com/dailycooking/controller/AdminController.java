package com.dailycooking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dailycooking.domain.BlackListVO;
import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.MemberVO;
import com.dailycooking.domain.PageDTO;
import com.dailycooking.domain.QuestionVO;
import com.dailycooking.service.AdminService;
import com.dailycooking.service.BlackListService;
import com.dailycooking.service.MemberRelationService;
import com.dailycooking.service.QuestionService;
import com.dailycooking.service.RecipeService;
import com.dailycooking.service.ReportService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {

	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	@Setter(onMethod_ = @Autowired)
	private MemberRelationService mService;
	
	@Setter(onMethod_ = @Autowired)
	private BlackListService bService;
	
	@Setter(onMethod_ = @Autowired)
	private RecipeService rService;
	
	@Setter(onMethod_ = @Autowired)
	private ReportService rpService;
	
	@Setter(onMethod_ = @Autowired)
	private QuestionService qService;
	
	@GetMapping("/recipeList")
	public String recipeList() {
		
		return "/admin/board/recipeList";
	}
	
	@GetMapping("/memberList")
	public String memberList(Criteria cri, Model model) {
		log.info("memberList 관리자 컨트롤러 : " + cri);
		int total = service.getTotalCount();
		
		model.addAttribute("mBold", "bold");
		model.addAttribute("count", total);
		model.addAttribute("mList", service.getMemberList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/admin/member/memberList";
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/removeMember", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> memberRemove(String userid,Criteria cri, Model model ){
		log.info("회원 탈퇴 컨트롤러 : " + userid);
		
		int removeResult = mService.removeMember(userid);
		
		return removeResult == 1 ? new ResponseEntity<>("removeOk", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/susList")
	public String suspensionList(Criteria cri, Model model) {
		log.info("suspesionList 관리자 컨트롤러 : " + cri);
		
		List<BlackListVO> bList = bService.readAll(cri);
		int total = bService.getTotal();
		
		model.addAttribute("mList", service.getMemberList(cri));
		model.addAttribute("bList", bList);
		model.addAttribute("sBold", "bold");
		model.addAttribute("count", total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/admin/member/SuspendedList";
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/susMember", produces = {MediaType.TEXT_PLAIN_VALUE})
	@Transactional
	@ResponseBody
	public ResponseEntity<String> memberSuspension(String userid, String reason, Criteria cri, Model model ){
		log.info("회원 탈퇴 컨트롤러 : " + userid);
		
		int insertResult = bService.insertSus(userid, reason);
		int updateResult = bService.updateSus(userid);
		
		return insertResult == 1 && updateResult == 1 ? new ResponseEntity<>("ok", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/susFreeze", produces = {MediaType.TEXT_PLAIN_VALUE})
	@Transactional
	@ResponseBody
	public ResponseEntity<String> memberFreeze(String userid, Model model ){
		log.info("회원 정지 해제 컨트롤러 : " + userid);
		
		int updateResult = bService.susFreeze(userid);
		int removeResult = bService.susRemove(userid);
		
		return removeResult == 1 && updateResult == 1 ? new ResponseEntity<>("ok", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/getRecipeList")
	public String recipeList(Criteria cri, Model model) {
		log.info("레시피 게시물 리스트 컨트롤러 : " + cri);
		int total = rService.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("total", total);
		model.addAttribute("rList", rService.getList(cri));
		model.addAttribute("rBold", "bold");
		return "/admin/board/recipeList";
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/removeRecipe", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> removeRecipe(Long recipenum, Model model ){
		log.info("게시물 삭제 컨트롤러 : " + recipenum);
		
		boolean removeResult = rService.remove(recipenum);
		
		return removeResult ? new ResponseEntity<>("ok", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/getReportList")
	public String reportList(Criteria cri, Model model) {
		log.info("신고 레시피 리스트 컨트롤러 : " + cri);
		int total = rpService.getReportCount();
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("total", total);
		model.addAttribute("rpList", rpService.getReportList(cri));
		model.addAttribute("rpBold", "bold");
		return "/admin/board/reportList";
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/removeReport", produces = {MediaType.TEXT_PLAIN_VALUE})
	@Transactional
	@ResponseBody
	public ResponseEntity<String> removeReport(Long recipenum, Model model ){
		log.info("신고 게시물 삭제 컨트롤러 : " + recipenum);
		
		boolean removeResult = rService.remove(recipenum);
		int removeReport = rpService.removeReport(recipenum);
		
		return removeResult ? new ResponseEntity<>("ok", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/getQuestionList")
	public String questionList(Criteria cri, Model model) {
		log.info("문의사항 목록 리스트 컨트롤러 : " + cri);
		int total = qService.getTotal();
		
		model.addAttribute("total", total);
		model.addAttribute("qList", qService.getList(cri));
		model.addAttribute("qBold", "bold");
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/admin/question/questionList";
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/answerQuestion", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> answerQuestion(QuestionVO qvo, Model model ){
		log.info("관리자 답변 완료 컨트롤러 : " + qvo);
	
		int answerResult = qService.answerComplete(qvo);
		
		return answerResult == 1 ? new ResponseEntity<>("ok", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/info")
	public String adminInfo(Model model) {
		log.info("관리자 정보 컨트롤러 ");
		
		model.addAttribute("aBold", "bold");
		model.addAttribute("adminInfo", mService.readInfo("admin"));
		
		return "/admin/adminInfo";
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/infoChangeAdmin", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> infoChange(MemberVO mvo, Model model ){
		log.info("관리자 정보 수정 컨트롤러 : " + mvo);
	
		int modifyResult = mService.infoAdminChange(mvo);
		
		return modifyResult == 1 ? new ResponseEntity<>("ok", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("isAutenticated()")
	@PostMapping(value = "/adminPwChange", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> changePw(MemberVO mvo){
		log.info("관리자 비밀번호 변경하기 컨트롤러 : " + mvo.getUserid());
		
		int changeResult = mService.pwChange(mvo);
		
		return changeResult == 1 ? new ResponseEntity<>("changeOk", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
