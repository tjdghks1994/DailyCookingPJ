package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.ScrapVO;

public interface ScrapService {
	public int insertScrap(ScrapVO svo); // 스크랩한 게시물 db테이블에 저장
	public List<ScrapVO> getScrapList(Long recipenum, String userid); // 해당 유저가 해당게시물을 스크랩했는지 여부를 알기위해
	public int removeScrap(Long recipenum, String userid); // 스크랩 취소
}
