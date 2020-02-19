package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinRecipeVO;
import com.dailycooking.domain.RecipeAttachVO;
import com.dailycooking.domain.RecipeBoardVO;
import com.dailycooking.domain.RecipeLikeVO;
import com.dailycooking.domain.RecipeRepresentativeVO;

public interface RecipeService {

	public void register(RecipeBoardVO rvo); // 레시피 게시글 등록
	
	public RecipeBoardVO get(Long recipenum); // 레시피 게시글 조회
	
	public boolean modify(RecipeBoardVO rvo); // 레시피 게시글 수정
	
	public boolean remove(Long recipenum); // 레시피 게시글 삭제
	
	public List<RecipeBoardVO> getList(Criteria cri); // 레시피 전체 목록 
	
	public int getTotal(Criteria cri); // 게시물 전체 갯수
	
	public boolean recipeLookCntUp(Long recipenum); // 레시피 조회시 조회수 증가
	
	public List<RecipeAttachVO> getAttachList(Long recipenum); // 게시물의 첨부파일 목록
	
	public List<RecipeBoardVO> getViewBy(Criteria cri); // 레시피 조회 높은 순으로 전체 목록
	
	public List<RecipeLikeVO> getLikeList(Long recipenum, String userid); // 좋아요 해당 유저가 해당 게시물을 좋아요 눌렀는지 목록 가져오기
	
	public boolean recipeLikeProc(Long recipenum, String userid); // 추천 처리
	
	public boolean recipeLikeCancle(Long recipenum, String userid); // 추천 취소 처리
	
	public List<RecipeBoardVO> getLikeBy(Criteria cri); // 레시피 추천 높은 순으로 전체 목록
	
	public List<RecipeBoardVO> getTopList(); // 레시피 Top4 목록
	
	public List<RecipeBoardVO> getNewList(); // 레시피 게시물 최근 8개 목록
	
	public List<RecipeRepresentativeVO> getRepresentList(Criteria cri); // 대표이미지 목록 가져오기
	
	public List<JoinRecipeVO> getRepresentLook(Criteria cri); // 대표이미지 목록 조회 높은 순 가져오기
	
	public List<JoinRecipeVO> getRepresentLike(Criteria cri); // 대표이미지 목록 추천 높은 순 가져오기
	
	public List<JoinRecipeVO> getRepresentTop4(); // 대표이미지 목록 top4 가져오기
	
	public List<RecipeBoardVO> getUserRecipeList(String userid, Criteria cri); // 유저의 전체 레시피 게시물 목록
	
	public int getUserRecipeConut(String userid); // 유저의 전체 레시피 게시물 갯수
}
