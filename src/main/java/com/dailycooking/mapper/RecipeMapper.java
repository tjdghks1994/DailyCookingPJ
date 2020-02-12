package com.dailycooking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeBoardVO;

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
}
