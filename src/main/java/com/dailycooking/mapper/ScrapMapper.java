package com.dailycooking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dailycooking.domain.RecipeLikeVO;
import com.dailycooking.domain.ScrapVO;

public interface ScrapMapper {
	public int insertScrap(ScrapVO svo); // 스크랩 한 게시물 db테이블 저장
	public List<ScrapVO> getScrapList(@Param("recipenum")Long recipenum, @Param("userid")String userid); // 해당 게시물의  해당 유저 스크랩  여부 확인을 위한 리스트 가져오기 
	public int deleteScrap(@Param("recipenum") Long recipenum, @Param("userid")String userid); // 스크랩 취소
	public int scrapCntUpDown(@Param("recipenum")Long recipenum, @Param("amount")int amount); // 스크랩 수 증감 처리
}
