package com.dailycooking.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeAttachVO;
import com.dailycooking.domain.RecipeBoardVO;
import com.dailycooking.mapper.RecipeAttachMapper;
import com.dailycooking.mapper.RecipeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RecipeServiceImpl implements RecipeService {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private RecipeAttachMapper attachMapper;
	
	@Override
	@Transactional
	public void register(RecipeBoardVO rvo) {
		log.info("service register....." + rvo);
		mapper.insertSelectKey(rvo);
		if(rvo.getAttachList() == null || rvo.getAttachList().size() <= 0) {
			return;
		}
		
		rvo.getAttachList().forEach(attach -> {
			attach.setRecipenum(rvo.getRecipenum());
			attachMapper.insert(attach);
		});
	}

	@Override
	public RecipeBoardVO get(Long recipenum) {
		log.info("service get...." + recipenum);
		return mapper.read(recipenum);
	}

	@Override
	public boolean modify(RecipeBoardVO rvo) {
		log.info("service modify...." + rvo);
		return mapper.update(rvo) == 1;
	}

	@Override
	@Transactional
	public boolean remove(Long recipenum) {
		log.info("service remove...." + recipenum);
		attachMapper.deleteAll(recipenum);
		return mapper.delete(recipenum) == 1;
	}

	@Override
	public List<RecipeBoardVO> getList(Criteria cri) {
		log.info("service getList...." + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("service getTotal.....");
		return mapper.getTotalCount(cri);
	}

	@Override
	public boolean recipeLookCntUp(Long recipenum) {
		log.info("service lookCnt up : " + recipenum);
		int result = mapper.recipeLookCntUp(recipenum);
		log.info("service lookCnt up result : " + result);
		return result ==1;
	}

	@Override
	public List<RecipeAttachVO> getAttachList(Long recipenum) {
		log.info("get Attach List Service : " + recipenum);
		return attachMapper.findByRecipenum(recipenum);
	}

}
