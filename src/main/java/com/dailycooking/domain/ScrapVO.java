package com.dailycooking.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ScrapVO {

	private Long recipenum; // 게시글 번호
	private String title; // 게시글 제목
	private String writer; // 게시글 작성자
	private String userid; // 회원 아이디
	private int boardType; // 게시글 타입 1이면 레시피 게시판
	private Date scrapDate; // 스크랩(즐겨찾기) 한 날짜
}
