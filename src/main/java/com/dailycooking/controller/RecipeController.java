package com.dailycooking.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinRecipeVO;
import com.dailycooking.domain.PageDTO;
import com.dailycooking.domain.RecipeAttachVO;
import com.dailycooking.domain.RecipeBoardVO;
import com.dailycooking.domain.RecipeLikeVO;
import com.dailycooking.domain.RecipeRepresentativeVO;
import com.dailycooking.domain.ScrapVO;
import com.dailycooking.service.RecipeService;
import com.dailycooking.service.ReportService;
import com.dailycooking.service.ScrapService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recipe/*")
public class RecipeController {

	@Setter(onMethod_ = @Autowired)
	private RecipeService service;
	
	@Setter(onMethod_ = @Autowired)
	private ReportService reportService;
	
	@Setter(onMethod_ = @Autowired)
	private ScrapService scrapService;
	
	@GetMapping("/list")
	public String recipeMenu(Criteria cri, Model model) { // 레시피 전체 목록 페이징처리
		log.info("레시피 게시판 리스트 페이지" + cri);
		List<RecipeBoardVO> list = service.getList(cri);
		
		int total = service.getTotal(cri);
		log.info("전체 게시물의 수 : " + total);
		
		List<String> encodeList = encodeProc(cri);
		
		model.addAttribute("fullPath", encodeList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info(list.size());
		model.addAttribute("list", list);
		model.addAttribute("Newest", "bold");
		model.addAttribute("pagingBtn", "/recipe/list");
		return "/recipeBoard/recipeList";
	}
	
	@GetMapping("/viewBy")
	public String viewByHigh(Criteria cri, Model model) { // 레시피 조회 높은 순 전체 목록 페이징처리
		log.info("레시피 게시판 리스트 페이지" + cri);
		List<RecipeBoardVO> list = service.getViewBy(cri);
		
		int total = service.getTotal(cri);
		log.info("전체 게시물의 수 : " + total);
		
		List<String> encodeList = encodeProcLook(cri);
		
		model.addAttribute("fullPath", encodeList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info(list.size());
		model.addAttribute("list", list);
		model.addAttribute("viewBy", "bold");
		model.addAttribute("pagingBtn", "/recipe/viewBy");
		return "/recipeBoard/recipeList";
	}
	
	@GetMapping("/likeBy")
	public String likeByHigh(Criteria cri, Model model) { // 레시피 추천 높은 순 전체 목록 페이징처리
		log.info("레시피 게시판 리스트 페이지" + cri);
		List<RecipeBoardVO> list = service.getLikeBy(cri);
		
		int total = service.getTotal(cri);
		log.info("전체 게시물의 수 : " + total);
		
		List<String> encodeList = encodeProcLike(cri);
		
		model.addAttribute("fullPath", encodeList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info(list.size());
		model.addAttribute("list", list);
		model.addAttribute("likeBy", "bold");
		model.addAttribute("pagingBtn", "/recipe/likeBy");
		return "/recipeBoard/recipeList";
	}
	
	@GetMapping(value = "/likeList", produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<RecipeLikeVO>> getLikeList(Long recipenum, String userid, Model model){
		log.info("get like list...");
		List<RecipeLikeVO> likeList = service.getLikeList(recipenum, userid);
		
		model.addAttribute("likeOrNot", likeList);
		
		return new ResponseEntity<>(likeList,HttpStatus.OK);
	}
	
	@PostMapping(value = "/likeInsert", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> likeProc(Long recipenum, String userid){
		
		boolean insertResult = service.recipeLikeProc(recipenum, userid);		
		log.info("Reply 등록 결과 - 컨트롤러 : " + insertResult);
		
		return insertResult ? new ResponseEntity<>("likeOk", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "/likeDelete", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> likeCancle(Long recipenum, String userid){
		boolean deleteResult = service.recipeLikeCancle(recipenum, userid);
		
		return deleteResult ? new ResponseEntity<>("likeDelete", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register() {
		log.info("레시피 등록 페이지로");
		return "/recipeBoard/recipeInsert";
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(RecipeBoardVO rvo, RedirectAttributes rttr) { // 레시피 등록
		log.info("컨트롤러 register..." + rvo);
		
		if(rvo.getAttachList() != null) {
			rvo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		 service.register(rvo); // 레시피 등록진행
		  
		 rttr.addFlashAttribute("registerResult", rvo.getTitle()); // 게시글의 제목을 view페이지로 전달
		 
		return "redirect:/recipe/list";
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("recipenum") Long recipenum, @ModelAttribute("cri") Criteria cri,
						Model model) {
		log.info("컨트롤러 get...." + recipenum);
		service.recipeLookCntUp(recipenum);
		model.addAttribute("recipe", service.get(recipenum));
		
		return "/recipeBoard/recipeGet";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("recipenum") Long recipenum, @ModelAttribute("cri") Criteria cri,
						Model model) {
		log.info("수정 view 페이지로 이동" + recipenum);
		model.addAttribute("recipe", service.get(recipenum));
		return "/recipeBoard/recipeModify";
	}

	@PostMapping("/modify")
	public String modifyPost(RecipeBoardVO rvo, @ModelAttribute("cri") Criteria cri,
							RedirectAttributes rttr) {
		log.info("컨트롤러 modifyPost.." + rvo);
		if(service.modify(rvo)) {
			rttr.addFlashAttribute("modifyResult", "게시물을 수정하였습니다");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/recipe/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("recipenum") Long recipenum, @ModelAttribute("cri") Criteria cri,
							RedirectAttributes rttr) {
		log.info("컨트롤러 remove....." + recipenum);
		List<RecipeAttachVO> attachList = service.getAttachList(recipenum);
		
		if(service.remove(recipenum)) {
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("removeResult", "게시물을 삭제하였습니다");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/recipe/list" + cri.getLinkList();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<RecipeAttachVO>> getAttachList(Long recipenum){
		log.info("get AttachList 컨트롤러 : " + recipenum);
		
		return new ResponseEntity<>(service.getAttachList(recipenum), HttpStatus.OK);
	}
	
	/*
	 * @GetMapping(value = "/getRepresentList", produces =
	 * MediaType.APPLICATION_JSON_UTF8_VALUE) public
	 * ResponseEntity<List<RecipeRepresentativeVO>> getRepresentList(Criteria cri){
	 * log.info("getRepresentList 컨트롤러 : " + cri);
	 * 
	 * return new ResponseEntity<>(service.getRepresentList(cri),HttpStatus.OK); }
	 */
	
	@PostMapping("/report")
	public String report(@RequestParam("recipenum") Long recipenum,@RequestParam("reporter") String reporter,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("게시글 신고하기 컨트롤러 : " + recipenum + " - 신고자 : " + reporter);
		int reportResult = reportService.report(recipenum, reporter);
		
		rttr.addFlashAttribute("reportResult", reportResult);
		return "redirect:/recipe/list";
	}
	
	@PostMapping(value = "/insertScrap", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> scrap(ScrapVO svo, Model model) {
		log.info("스크랩(즐겨찾기) 처리 컨트롤러 : " + svo);
		int scrapResult = scrapService.insertScrap(svo);
		log.info("스크랩 결과 : " + scrapResult);
		
		return scrapResult == 1 ? new ResponseEntity<>("scrapOk", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/scrapList", produces = {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ScrapVO>> getScrapList(Long recipenum, String userid, Model model){
		log.info("게시물 스크랩 여부 컨트롤러 : " + recipenum + " - " + userid);
		List<ScrapVO> list = scrapService.getScrapList(recipenum, userid);
		
		model.addAttribute("scrapOrNot", list);
		
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	@PostMapping(value = "/scrapDelete", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> scrapCancle(Long recipenum, String userid){
		int scrapResult = scrapService.removeScrap(recipenum, userid);
		
		return scrapResult == 1 ? new ResponseEntity<>("scrapDelete", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	/*
	 * @GetMapping(value = "/getAllRecipe", produces =
	 * MediaType.APPLICATION_JSON_UTF8_VALUE)
	 * 
	 * @ResponseBody public ResponseEntity<List<RecipeBoardVO>> getRecipeList(){
	 * log.info("get All Recipe 컨트롤러...");
	 * 
	 * return new ResponseEntity<>(service.getAllList(),HttpStatus.OK); }
	 * 
	 * @GetMapping(value = "/allAttach", produces =
	 * MediaType.APPLICATION_JSON_UTF8_VALUE)
	 * 
	 * @ResponseBody public ResponseEntity<List<RecipeAttachVO>> getAllAttach(){
	 * log.info("모든 첨부파일 목록 가져오기 컨트롤러 ....... ");
	 * 
	 * return new ResponseEntity<>(service.allAttachList(),HttpStatus.OK); }
	 */

	public List<String> encodeProc(Criteria cri) { // 각 게시물의 대표사진 인코딩 된 값을 리스트에 담아 반환
		List<RecipeRepresentativeVO> rList = service.getRepresentList(cri);
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
	
	public List<String> encodeProcLook(Criteria cri) { // 각 게시물의 대표사진 인코딩 된 값을 리스트에 담아 반환
		List<JoinRecipeVO> rList = service.getRepresentLook(cri);
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
	
	public List<String> encodeProcLike(Criteria cri) { // 각 게시물의 대표사진 인코딩 된 값을 리스트에 담아 반환
		List<JoinRecipeVO> rList = service.getRepresentLike(cri);
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
	
	private void deleteFiles(List<RecipeAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete Attach Files...");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\uploadP\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\uploadP\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch (IOException e) {
				log.error("delete file error : " + e.getMessage());
			}
		});
	}
}
