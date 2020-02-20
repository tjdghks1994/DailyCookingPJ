package com.dailycooking.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailycooking.domain.BlackListVO;
import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinRecipeVO;
import com.dailycooking.domain.MemberVO;
import com.dailycooking.domain.QuestionVO;
import com.dailycooking.domain.RecipeBoardVO;
import com.dailycooking.domain.RecipeRepresentativeVO;
import com.dailycooking.service.BlackListService;
import com.dailycooking.service.MemberRelationService;
import com.dailycooking.service.RecipeService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberRelationController { // 회원 관련된 컨트롤러 사용 예정
	
	@Setter(onMethod_ = @Autowired)
	private MemberRelationService service;

	@Setter(onMethod_ = @Autowired)
	private RecipeService rService;
	
	@Setter(onMethod_ = @Autowired)
	private BlackListService bService;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) { // 관리자 페이지에 사용자가 접근할때 접근 거부 페이지로 이동
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "접근이 거부되었습니다 - 관리자만 접근 가능합니다");
	}
	
	@GetMapping("/join")
	public void join() { // 회원가입 페이지로 이동
		log.info("join getMapping");
	}
	
	@PostMapping("/join")
	public String join(MemberVO mvo, RedirectAttributes rttr) { // 회원가입
		
		log.info("join postMapping");
		
		if(service.join(mvo) == 1) { // 회원 가입에 성공하면
			rttr.addFlashAttribute("joinResult","회원가입에 성공하였습니다");
		} else {
			rttr.addFlashAttribute("joinResult", "회원가입에 실패하였습니다");
		}
		
		return "redirect:/customLogin";
	}
	
	@GetMapping("/customLogin")
	public void login(String error, String logout, Model model) { // 로그인 페이지 커스터마이징
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
	
	@GetMapping("/customLogout")
	public void logoutGet(Model model) { // 로그아웃시 메인 페이지로 이동
		
		log.info("로그아웃 하였음");
		model.addAttribute("logout","로그아웃 하였습니다");
		
	}
	
	@GetMapping("/index")
	public void loginGet(Model model, Criteria cri) { // 로그인 완료시 index페이지로 이동하기위한 
		log.info("로그인 시 index페이지로 이동");
		log.info("메인 페이지 컨트롤러 ");
		List<RecipeBoardVO> topList = rService.getTopList();
		log.info("top List : " + topList);
		List<RecipeBoardVO> list = rService.getNewList();
		log.info("new List : " + list);
		
		List<String> encodeList = encodeProcLike();
		cri = new Criteria();
		List<String> encodeNew = encodeProc(cri);
		
		model.addAttribute("encodeNew", encodeNew);
		model.addAttribute("encode", encodeList);
		model.addAttribute("topList", topList);
		model.addAttribute("list", list);
	}
	
	@GetMapping(value = "/userid", produces = {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	@ResponseBody
	public String idCheck(String userid){ // 회원가입시 중복확인 처리 - ajax

		MemberVO vo = service.idCheck(userid);
		log.info("아이디 중복확인 컨트롤러 ...." + userid);
		
		if(vo != null) {
			return "no";
		} else {
			return "yes";
		}
	}
	
	@GetMapping("/idSearch")
	public void idSearch() { // 아이디 찾기 페이지로 이동
		log.info("아이디찾기 페이지로이동");
	}
	
	@PostMapping("/idSearch")
	public String idSearchMember(MemberVO mvo, Model model) { // 아이디 찾기
		
		String idSearchResult = service.idSearch(mvo);
		model.addAttribute("searchResult", idSearchResult);
		
		if(idSearchResult == "존재하는 아이디가 없습니다") { // 존재하는 아이디가 없는경우 아이디찾기 페이지 그대로
			return "/idSearch";
		} else {
			return "/customLogin"; // 존재하는 아이디가 있는경우 로그인 페이지로 이동
		}
		
	}
	
	@GetMapping("/pwSearch")
	public void pwSearch() { // 비밀번호찾기 페이지 이동
		log.info("패스워드찾기 페이지로 이동");
	}
	
	@PostMapping("/pwSearch")
	public void pwSearchMember(MemberVO mvo, Model model) { // 비밀번호 찾기
		MemberVO memberVo = service.pwSearch(mvo);
		log.info(memberVo);
		
		if(memberVo != null) { // 비밀번호 찾기 시 입력한 정보와 일치하는 계정이 존재하면
			String pwSearchResult = "match"; 
			model.addAttribute("memId", memberVo.getUserid()); // view페이지로 회원 아이디 값 전송
			model.addAttribute("pwSearchResult", pwSearchResult); // view페이지로 결과값 - match 전송
		} else { // 비밀번호 찾기 시 입력한 정보와 일치하는 계정이 존재하지않으면 memberVo = null값
			String pwSearchResult = "notMatch";
			model.addAttribute("pwSearchResult", pwSearchResult); // view페이지로 결과값 - notMatch 전송
		}
	}
	
	@PostMapping("/pwChange")
	public String pwChangeMember(MemberVO mvo, Model model) { // 비밀번호 변경
		int pwChangeResult = service.pwChange(mvo); // 비밀번호 변경에 성공하면 1 반환
		
		if(pwChangeResult == 1) {
			model.addAttribute("pwChangeResult", "changeOk"); // view 페이지로 비밀번호 성공 결과 값 - changeOk 전송
			return "/customLogin";
		} else {
			model.addAttribute("pwChangeResult", "notChange"); // view 페이지로 비밀번호 실패 결과 값 - notChange 전송
			return "/pwChange";
		}
	}
	
	@PostMapping(value = "/questionInsert", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertQuestion(QuestionVO qvo){
		
		int insertResult = service.questionReg(qvo);	
		log.info("건의 문의사항 등록 결과 - 컨트롤러 : " + insertResult);
		
		return insertResult == 1 ? new ResponseEntity<>("questionOk", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	public List<String> encodeProc(Criteria cri) { // 각 게시물의 대표사진 인코딩 된 값을 리스트에 담아 반환
		List<RecipeRepresentativeVO> rList = rService.getRepresentList(cri);
		List<String> encodeList = new ArrayList<>();
		
		log.info("첫번째 : "+rList.get(0).getUploadpath());
		
		for(int i=0; i<rList.size(); i++) {
			try {
				String encodedPath = URLEncoder.encode(rList.get(i).getUploadpath(), "UTF-8");
				encodeList.add(encodedPath);
				log.info(i+" 번째 : " + encodeList.get(i));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				log.info(e.getMessage());
			}
		}
		log.info("리스트 : " + encodeList);
		
		return encodeList;
	}
	
	public List<String> encodeProcLike() { // 각 게시물의 대표사진 인코딩 된 값을 리스트에 담아 반환
		List<JoinRecipeVO> rList = rService.getRepresentTop4();
		List<String> encodeList = new ArrayList<>();
		
		log.info("첫번째 : "+rList.get(0).getUploadpath());
		
		for(int i=0; i<rList.size(); i++) {
			try {
				String encodedPath = URLEncoder.encode(rList.get(i).getUploadpath(), "UTF-8");
				encodeList.add(encodedPath);
				log.info(i+" 번째 : " + encodeList.get(i));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				log.info(e.getMessage());
			}
		}
		log.info("리스트 : " + encodeList);
		
		return encodeList;
	}
	
	@PostMapping(value = "/susCheck", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> memberSuspension(String userid, Model model ){
		log.info("회원 정지 여부 컨트롤러 : " + userid);
		
		MemberVO mvo = service.readInfo(userid);
		int suspension = mvo.getSuspension();
		
		log.info("정지여부 : " + suspension);
		
		return suspension == 0 || suspension == 1 ? new ResponseEntity<>(Integer.toString(suspension), HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping(value = "/valueCheck", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public ResponseEntity<BlackListVO> memberData(String userid, Model model ){
		log.info("정지 회원 이유, 날짜 가져오기 컨트롤러 : " + userid);
		
		BlackListVO bvo = bService.readMember(userid);
		
		
		return bvo != null ? new ResponseEntity<>(bvo, HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
