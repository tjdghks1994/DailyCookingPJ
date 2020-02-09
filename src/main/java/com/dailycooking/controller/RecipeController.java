package com.dailycooking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String recipeMenu(Model model) { // 레시피 전체 목록
		log.info("레시피 게시판 리스트 페이지");
		List<RecipeBoardVO> list = service.getList();
		
		model.addAttribute("list", service.getList());
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
	public String get(@RequestParam("recipenum") Long recipenum, Model model) {
		log.info("컨트롤러 get...." + recipenum);
		model.addAttribute("recipe", service.get(recipenum));
		
		return "/recipeBoard/recipeGet";
	}
}
