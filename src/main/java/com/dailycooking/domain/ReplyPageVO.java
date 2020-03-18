package com.dailycooking.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageVO {
	private int replyCnt; // 댓글 전체 갯수
	private List<RecipeReplyVO> list; // 댓글 전체 목록
}
