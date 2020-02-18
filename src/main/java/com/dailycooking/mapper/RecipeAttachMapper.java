package com.dailycooking.mapper;

import java.util.List;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinRecipeVO;
import com.dailycooking.domain.RecipeAttachVO;
import com.dailycooking.domain.RecipeRepresentativeVO;

public interface RecipeAttachMapper {

	public void insert(RecipeAttachVO vo); // 첨부파일 등록
	
	public void delete(String uuid); // 첨부파일 1개 삭제
	
	public List<RecipeAttachVO> findByRecipenum(Long recipenum); //레시피 게시판 해당 게시물의 첨부파일 목록
	
	public void deleteAll(Long recipenum); // 해당 게시물의 모든 첨부파일 삭제 처리
	
	public List<RecipeAttachVO> getOldFiles(); // 데이터 베이스에 존재하지 않는 첨부파일 목록은 삭제하기 
	
	public List<RecipeAttachVO> allAttachList(); // 모든 첨부파일 목록
	
	public int insertRepresentativeImg(RecipeRepresentativeVO rvo); // 첨부파일 대표 이미지 저장
	
	public List<RecipeRepresentativeVO> getRepresentativeImg(Criteria cri); // 대표 이미지 목록 가져오기 최신순 레시피
	
	public List<JoinRecipeVO> getRepresentLook(Criteria cri); // 대표 이미지 목록 가져오기 조회 높은 순 레시피
	
	public List<JoinRecipeVO> getRepresentLike(Criteria cri); // 대표 이미지 목록 가져오기 추천 높은 순 레시피
	
	public List<JoinRecipeVO> getRepresentTop4(); // 대표 이미지 목록 가져오기 top4 레시피
}
