package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.RecipeBoardVO;

public interface RecipeService {

	public void register(RecipeBoardVO rvo); // 레시피 게시글 등록
	
	public RecipeBoardVO get(Long recipenum); // 레시피 게시글 조회
	
	public boolean modify(RecipeBoardVO rvo); // 레시피 게시글 수정
	
	public boolean remove(Long recipenum); // 레시피 게시글 삭제
	
	public List<RecipeBoardVO> getList(); // 레시피 전체 목록 
}
