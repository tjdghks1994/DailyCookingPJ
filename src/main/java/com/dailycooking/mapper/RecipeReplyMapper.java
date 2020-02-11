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
	
}
