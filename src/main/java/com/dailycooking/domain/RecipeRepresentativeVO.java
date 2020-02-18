package com.dailycooking.domain;

import lombok.Data;

@Data
public class RecipeRepresentativeVO {

	private String uploadpath; // 파일 전체 경로
	private Long recipenum; // 게시물 번호
}
