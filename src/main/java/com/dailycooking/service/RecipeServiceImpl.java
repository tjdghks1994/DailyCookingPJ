package com.dailycooking.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinRecipeVO;
import com.dailycooking.domain.RecipeAttachVO;
import com.dailycooking.domain.RecipeBoardVO;
import com.dailycooking.domain.RecipeLikeVO;
import com.dailycooking.domain.RecipeRepresentativeVO;
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
		
		RecipeAttachVO avo = rvo.getAttachList().get(0);
		log.info(avo);
		RecipeRepresentativeVO rrvo = new RecipeRepresentativeVO();
		rrvo.setRecipenum(avo.getRecipenum());
		rrvo.setUploadpath(avo.getUploadPath()+ "/s_"+avo.getUuid()+"_"+avo.getFileName());
		
		attachMapper.insertRepresentativeImg(rrvo);
	}


	@Override
	public RecipeBoardVO get(Long recipenum) {
		log.info("service get...." + recipenum);
		return mapper.read(recipenum);
	}

	@Override
	@Transactional
	public boolean modify(RecipeBoardVO rvo) {
		log.info("service modify...." + rvo);
		attachMapper.deleteAll(rvo.getRecipenum());
		boolean modifyResult = mapper.update(rvo) == 1;
		
		if(modifyResult && rvo.getAttachList() != null && rvo.getAttachList().size() > 0) {
			rvo.getAttachList().forEach(attach -> {
				attach.setRecipenum(rvo.getRecipenum());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
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

	@Override
	public List<RecipeBoardVO> getViewBy(Criteria cri) {
		log.info("get View By.... Service : " + cri);
		return mapper.getViewBy(cri);
	}
	
	public List<RecipeLikeVO> getLikeList(@Param("recipenum")Long recipenum, @Param("userid")String userid){
		log.info("get like list : " + recipenum + " - " + userid);
		return mapper.getLikeList(recipenum, userid);
	}

	@Override
	@Transactional
	public boolean recipeLikeProc(Long recipenum, String userid) { // 해당 게시물 추천 처리
		log.info("likeInsert .... db table : " + recipenum + " - " + userid);
		mapper.likeInsert(recipenum, userid);
		
		return mapper.likeCntUpDown(recipenum, userid, 1) == 1;
	}

	@Override
	@Transactional
	public boolean recipeLikeCancle(Long recipenum, String userid) {
		log.info("likeCancle .... db table : " + recipenum + " - " + userid);
		mapper.likeDelete(recipenum, userid);
		return mapper.likeCntUpDown(recipenum, userid, -1) == 1;
	}

	@Override
	public List<RecipeBoardVO> getLikeBy(Criteria cri) {
		log.info("get Like By...." + cri);
		return mapper.getLikeBy(cri);
	}

	@Override
	public List<RecipeBoardVO> getTopList() {
		log.info("get Top List....Service..");
		return mapper.getTopList();
	}

	@Override
	public List<RecipeBoardVO> getNewList() {
		log.info("get New List 8 .... Service");
		return mapper.getNewList();
	}


	@Override
	public List<RecipeRepresentativeVO> getRepresentList(Criteria cri) {
		log.info("get Represent List.... Service");
		return attachMapper.getRepresentativeImg(cri);
	}


	@Override
	public List<JoinRecipeVO> getRepresentLook(Criteria cri) {
		log.info("get RepresentLook .... Service");
		return attachMapper.getRepresentLook(cri);
	}


	@Override
	public List<JoinRecipeVO> getRepresentLike(Criteria cri) {
		log.info("get ReperesentLike.... Service");
		return attachMapper.getRepresentLike(cri);
	}


	@Override
	public List<JoinRecipeVO> getRepresentTop4() {
		log.info("get ReperesentTop4... Service");
		return attachMapper.getRepresentTop4();
	}


	@Override
	public List<RecipeBoardVO> getUserRecipeList(String userid, Criteria cri) {
		log.info("get User RecipeList : " + userid + " : " + cri);
		return mapper.getUserList(userid, cri.getPageNum(), cri.getAmount());
	}


	@Override
	public int getUserRecipeConut(String userid) {
		return mapper.getTotalCountBoard(userid);
	}

	/*
	 * @Override public List<RecipeAttachVO> allAttachList() {
	 * log.info("get All Attach List Service........"); return
	 * attachMapper.allAttachList(); }
	 * 
	 * @Override public List<RecipeBoardVO> getAllList() {
	 * log.info("페이징 처리 없이 모든 게시물 가져오기 Service"); return mapper.getList(); }
	 */

}
