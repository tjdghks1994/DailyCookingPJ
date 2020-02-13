package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeAttachVO;
import com.dailycooking.domain.RecipeBoardVO;

public interface RecipeService {

	public void register(RecipeBoardVO rvo); // 레시피 게시글 등록
	
	public RecipeBoardVO get(Long recipenum); // 레시피 게시글 조회
	
	public boolean modify(RecipeBoardVO rvo); // 레시피 게시글 수정
	
	public boolean remove(Long recipenum); // 레시피 게시글 삭제
	
	public List<RecipeBoardVO> getList(Criteria cri); // 레시피 전체 목록 
	
	public int getTotal(Criteria cri); // 게시물 전체 갯수
	
	public boolean recipeLookCntUp(Long recipenum); // 레시피 조회시 조회수 증가
	
	public List<RecipeAttachVO> getAttachList(Long recipenum); // 게시물의 첨부파일 목록
	
	/*
	 * public List<RecipeAttachVO> allAttachList(); // 모든 첨부파일 목록
	 * 
	 * public List<RecipeBoardVO> getAllList(); // 페이징 처리 안한 게시물 전체목록
	 */}
