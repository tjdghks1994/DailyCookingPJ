package com.dailycooking.domain;

import lombok.Data;

@Data
public class RecipeAttachVO {

	private String fileName; // 이미지 파일 이름
	private String uploadPath; // 파일 경로
	private String uuid; // 파일명 앞에 랜덤으로 붙는 uuid 값
	private boolean image; // 이미지 인지 아닌지
	
	private Long recipenum; // 게시물 번호
}
