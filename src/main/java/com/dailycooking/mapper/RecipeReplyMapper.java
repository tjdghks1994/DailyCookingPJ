package com.dailycooking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeReplyVO;

public interface RecipeReplyMapper {

	public int insert(RecipeReplyVO vo); // 댓글 등록
	
	public RecipeReplyVO read(Long replynum); // 해당 댓글 조회
	
	public int delete(Long replynum); // 해당 댓글 삭제
	
	public int update(RecipeReplyVO vo); // 댓글 수정
	
	public List<RecipeReplyVO> getListWithPaging(@Param("cri") Criteria cri,
											@Param("recipenum") Long recipenum); // 댓글 페이징
	
	public int replyCnt(Long recipenum); // 해당 게시판의 댓글 갯수
	
	public List<RecipeReplyVO> getMemberReplyList(@Param("userid") String userid,@Param("pageNum") int pageNum, @Param("amount") int amount); // 해당 유저의 댓글 목록
	
	public int getTotalCountReply(String userid); // 해당 유저의 전체 댓글 수
	
}
