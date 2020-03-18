package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeReplyVO;
import com.dailycooking.domain.ReplyPageVO;

public interface RecipeRelpyService {

	public int register(RecipeReplyVO vo); // 댓글 등록
	
	public RecipeReplyVO get(Long replynum); // 해당 댓글 조회
	
	public int modify(RecipeReplyVO vo); // 댓글 수정
	
	public int remove(Long replynum); // 댓글 삭제
	
	public List<RecipeReplyVO> getList(Criteria cri, Long recipenum); // 해당 게시물의 댓글 전체 목록
	
	public ReplyPageVO getListPage(Criteria cri, Long recipenum); // 해당 게시물의 댓글 전체목록과 댓글 갯수
	
	public List<RecipeReplyVO> getMemberReplyList(String userid, Criteria cri); // 해당 유저의 댓글 전체 목록
	
	public int getTotalCountReply(String userid); // 해당 유저의 댓글 전체 수 
}
