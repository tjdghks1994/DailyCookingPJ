package com.dailycooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeReplyVO;
import com.dailycooking.domain.ReplyPageVO;
import com.dailycooking.mapper.RecipeMapper;
import com.dailycooking.mapper.RecipeReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RecipeReplyServiceImpl implements RecipeRelpyService{

	@Setter(onMethod_ = @Autowired)
	private RecipeReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private RecipeMapper recipeMapper;
	
	@Override
	@Transactional
	public int register(RecipeReplyVO vo) {
		log.info("register reply ... " + vo);
		recipeMapper.updateReplyCnt(vo.getRecipenum(), 1);
		return mapper.insert(vo);
	}

	@Override
	public RecipeReplyVO get(Long replynum) {
		log.info("get reply...." + replynum);
		return mapper.read(replynum);
	}

	@Override
	public int modify(RecipeReplyVO vo) {
		log.info("modify reply..." + vo);
		return mapper.update(vo);
	}

	@Override
	@Transactional
	public int remove(Long replynum) {
		log.info("remove reply..." + replynum);
		RecipeReplyVO vo = mapper.read(replynum);
		recipeMapper.updateReplyCnt(vo.getRecipenum(), -1);
		return mapper.delete(replynum);
	}

	@Override
	public List<RecipeReplyVO> getList(Criteria cri, Long recipenum) {
		log.info("getList reply...." + recipenum);
		return mapper.getListWithPaging(cri, recipenum);
	}

	@Override
	public ReplyPageVO getListPage(Criteria cri, Long recipenum) {
		
		return new ReplyPageVO(mapper.replyCnt(recipenum), mapper.getListWithPaging(cri, recipenum));
	}

	@Override
	public List<RecipeReplyVO> getMemberReplyList(String userid, Criteria cri) {
		log.info("getMemberReplyList.." + userid + " - " + cri);
		return mapper.getMemberReplyList(userid, cri.getPageNum(), cri.getAmount());
	}

	@Override
	public int getTotalCountReply(String userid) {
		log.info("getTotalCountReply..." + userid);
		return mapper.getTotalCountReply(userid);
	}

}
