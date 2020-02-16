package com.dailycooking.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {

	private int boardtype; // 게시글 타입 - 1이면 레시피게시판  2이면-추천음식점게시판
	private Long recipenum; // 게시글 번호
	private String reporter; // 신고자
	private Date reportDate; // 신고한 날짜
}
