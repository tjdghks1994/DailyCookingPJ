package com.dailycooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeReplyVO;
import com.dailycooking.mapper.RecipeReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RecipeReplyServiceImpl implements RecipeRelpyService{

	@Setter(onMethod_ = @Autowired)
	private RecipeReplyMapper mapper;
	
	@Override
	public int register(RecipeReplyVO vo) {
		log.info("register reply ... " + vo);
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
	public int remove(Long replynum) {
		log.info("remove reply..." + replynum);
		return mapper.delete(replynum);
	}

	@Override
	public List<RecipeReplyVO> getList(Criteria cri, Long recipenum) {
		log.info("getList reply...." + recipenum);
		return mapper.getListWithPaging(cri, recipenum);
	}

}
