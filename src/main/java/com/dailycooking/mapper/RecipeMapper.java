package com.dailycooking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeBoardVO;
import com.dailycooking.domain.RecipeLikeVO;

public interface RecipeMapper {
	
	public List<RecipeBoardVO> getList(); // 레시피 게시판 전체 게시물 목록
	public void insertSelectKey(RecipeBoardVO recipe); // 게시물 등록
	public RecipeBoardVO read(Long recipenum); // 게시물 조회
	public int delete(Long recipenum); // 게시물 삭제
	public int update(RecipeBoardVO recipe); // 게시물 수정
	public List<RecipeBoardVO> getListWithPaging(Criteria cri); // 게시물 전체목록 페이징 처리
	public int getTotalCount(Criteria cri); // 전체 게시물의 갯수
	public int recipeLookCntUp(Long recipenum); // 게시물 조회 시 게시물 조회수 증가
	// 게시물 댓글의 수 증가하거나 감소할 때 replyCnt 값을 변동
	public void updateReplyCnt(@Param("recipenum") Long recipenum, @Param("amount") int amount);
	public List<RecipeBoardVO> getViewBy(Criteria cri); // 조회가 높은 순으로 전체 게시물 목록 페이징 처리
	public List<RecipeLikeVO> getLikeList(@Param("recipenum")Long recipenum, @Param("userid")String userid); // 해당 게시물의 해당 유저 추천 여부 확인을 위한 리스트 가져오기
	public int likeInsert(@Param("recipenum")Long recipenum, @Param("userid")String userid); // 추천 처리
	public int likeCntUpDown(@Param("recipenum")Long recipenum, @Param("userid")String userid, @Param("amount")int amount); // 추천 증감 처리
	public int likeDelete(@Param("recipenum")Long recipenum, @Param("userid")String userid); // 추천 취소 처리
	public List<RecipeBoardVO> getLikeBy(Criteria cri);
	public List<RecipeBoardVO> getTopList(); // 레시피 게시판 Top4 목록 가져오기
	public List<RecipeBoardVO> getNewList(); // 레시피 게시물 최근 8개 목록 가져오기
	public List<RecipeBoardVO> getUserList(@Param("userid")String userid,@Param("pageNum") int pageNum,@Param("amount") int amount); // 해당 유저의 레시피 게시물 전체 목록
	public int getTotalCountBoard(String userid); // 해당 유저의 게시물 전체 갯수  
}
