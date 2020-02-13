package com.dailycooking.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class RecipeBoardVO {

	private Long recipenum; // 게시물 번호
	private String title; // 게시물 제목
	private String material; // 게시물 재료
	private int personnel; // 음식 몇 인분
	private int cookingTime; // 음식 완성되는데 걸리는 시간
	private int cookingLevel; // 음식 요리 난이도
	private String cookingOrder; // 음식 조리 순서
	private String cookingTip; // 음식 조리 팁
	private String cookingTag; // 음식 태그
	private Date regdate; // 게시물 작성 날짜
	private Date updateDate; // 게시물 수정 날짜
	private int replyCnt; // 댓글 수
	private int likeCnt; // 좋아요 수
	private int scrapCnt; // 스크랩 수
	private String userid; // 게시물 작성한 회원 아이디
	
	private List<RecipeAttachVO> attachList; // 이미지 파일(시진) 목록 
	
}
