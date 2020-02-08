package com.dailycooking.mapper;

import java.util.List;

import com.dailycooking.domain.RecipeBoardVO;

public interface RecipeMapper {
	
	public List<RecipeBoardVO> getList(); // 레시피 게시판 전체 게시물 목록
	public void insertSelectKey(RecipeBoardVO recipe); // 게시물 등록
	public RecipeBoardVO read(Long recipenum); // 게시물 조회
	public int delete(Long recipenum); // 게시물 삭제
	public int update(RecipeBoardVO recipe); // 게시물 수정
}
