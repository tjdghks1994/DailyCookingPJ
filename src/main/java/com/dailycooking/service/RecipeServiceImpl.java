package com.dailycooking.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeBoardVO;
import com.dailycooking.mapper.RecipeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RecipeServiceImpl implements RecipeService {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeMapper mapper;
	
	@Override
	public void register(RecipeBoardVO rvo) {
		log.info("service register....." + rvo);
		mapper.insertSelectKey(rvo);
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
	public boolean remove(Long recipenum) {
		log.info("service remove...." + recipenum);
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
		return mapper.recipeLookCntUp(recipenum) ==1;
	}

}
