package com.dailycooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.ScrapVO;
import com.dailycooking.mapper.ScrapMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ScrapServiceImpl implements ScrapService{

	@Setter(onMethod_ = @Autowired)
	private ScrapMapper mapper;
	
	@Override
	@Transactional
	public int insertScrap(ScrapVO svo) {
		log.info("insert Scrap : " + svo);
		mapper.scrapCntUpDown(svo.getRecipenum(),1);
		return mapper.insertScrap(svo);
	}

	@Override
	public List<ScrapVO> getScrapList(Long recipenum, String userid) {
		log.info("get Scrap List : " + recipenum + " - " + userid);
		return mapper.getScrapList(recipenum, userid);
	}

	@Override
	@Transactional
	public int removeScrap(Long recipenum, String userid) {
		log.info("remove Scrap List : " + recipenum + " - " + userid);
		mapper.scrapCntUpDown(recipenum, -1);
		return mapper.deleteScrap(recipenum, userid);
	}

	@Override
	public List<ScrapVO> getMemberScrapList(String userid, Criteria cri) {
		log.info("scrap member List : " + userid + " : " + cri);
		return mapper.getMemberScrapList(userid,cri.getPageNum(), cri.getAmount());
	}

	@Override
	public int getTotalScrap(String userid) {
		log.info("scrap total count : " + userid);
		return mapper.getTotalCountScrap(userid);
	}

}
