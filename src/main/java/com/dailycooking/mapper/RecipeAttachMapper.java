package com.dailycooking.mapper;

import java.util.List;

import com.dailycooking.domain.RecipeAttachVO;

public interface RecipeAttachMapper {

	public void insert(RecipeAttachVO vo); // 첨부파일 등록
	
	public void delete(String uuid); // 첨부파일 1개 삭제
	
	public List<RecipeAttachVO> findByRecipenum(Long recipenum); //레시피 게시판 해당 게시물의 첨부파일 목록
	
	public void deleteAll(Long recipenum); // 해당 게시물의 모든 첨부파일 삭제 처리
}
