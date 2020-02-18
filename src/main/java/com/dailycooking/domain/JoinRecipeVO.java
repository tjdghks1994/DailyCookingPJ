package com.dailycooking.domain;

import lombok.Data;

@Data
public class JoinRecipeVO {

	private int likecnt;
	private int lookcnt;
	private String uploadpath;
	private Long recipenum;
}
