package com.dailycooking.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RecipeReplyVO {

	private Long recipenum; // 레시피 게시판의 게시물 번호
	private Long replynum; // 댓글 번호
	
	private String reply; // 댓글 내용
	private String userid; // 댓글 작성자 아이디
	private Date regDate; // 댓글 작성 날짜 
	private Date updateDate; // 댓글 수정 날짜
}
