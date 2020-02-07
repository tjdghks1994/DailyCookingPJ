package com.dailycooking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RecipeController {

	@GetMapping("/recipeList")
	public String recipeMenu() {
		return "/recipeBoard/recipeList";
	}
}
