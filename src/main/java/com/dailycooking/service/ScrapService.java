package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.ScrapVO;

public interface ScrapService {
	public int insertScrap(ScrapVO svo); // 스크랩한 게시물 db테이블에 저장
	public List<ScrapVO> getScrapList(Long recipenum, String userid); // 해당 유저가 해당게시물을 스크랩했는지 여부를 알기위해
	public int removeScrap(Long recipenum, String userid); // 스크랩 취소
	public List<ScrapVO> getMemberScrapList(String userid, Criteria cri); // 해당 유저의 스크랩 한 게시물 목록 가져오기
	public int getTotalScrap(String userid); // 해당 유저의 스크랩 게시물 전체 갯수
}
