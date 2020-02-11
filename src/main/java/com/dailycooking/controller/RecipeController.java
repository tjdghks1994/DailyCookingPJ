package com.dailycooking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.PageDTO;
import com.dailycooking.domain.RecipeBoardVO;
import com.dailycooking.service.RecipeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recipe/*")
public class RecipeController {

	@Setter(onMethod_ = @Autowired)
	private RecipeService service;
	
	@GetMapping("/list")
	public String recipeMenu(Criteria cri, Model model) { // 레시피 전체 목록 페이징처리
		log.info("레시피 게시판 리스트 페이지" + cri);
		List<RecipeBoardVO> list = service.getList(cri);
		
		int total = service.getTotal(cri);
		log.info("전체 게시물의 수 : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info(list.size());
		model.addAttribute("list", service.getList(cri));
		return "/recipeBoard/recipeList";
	}
	
	@GetMapping("/register")
	public String register() {
		log.info("레시피 등록 페이지로");
		return "/recipeBoard/recipeInsert";
	}
	
	@PostMapping("/register")
	public String register(RecipeBoardVO rvo, RedirectAttributes rttr) { // 레시피 등록
		log.info("컨트롤러 register..." + rvo);
		
		service.register(rvo); // 레시피 등록진행
		
		rttr.addFlashAttribute("registerResult", rvo.getTitle()); // 게시글의 제목을 view 페이지로 전달
		
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
		if(service.remove(recipenum)) {
			rttr.addFlashAttribute("removeResult", "게시물을 삭제하였습니다");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/recipe/list";
	}
}
