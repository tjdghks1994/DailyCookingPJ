package com.dailycooking.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class RecipeBoardMapperTest {

	@Setter(onMethod_ = @Autowired)
	private RecipeMapper mapper;
	
	public void testGetList() {
		mapper.getList().forEach(recipe -> log.info(recipe));
	}
	
	public void testInsert() {
		RecipeBoardVO rvo = new RecipeBoardVO();
		rvo.setTitle("등록 테스트");
		rvo.setMaterial("재료 를 써주세요~~ 자세히 써줄수록 좋아요 ");
		rvo.setPersonnel(1);
		rvo.setCookingTime(30);
		rvo.setCookingLevel(1);
		rvo.setCookingOrder("조리순서는 특수문자 골뱅이를 기준으로 잘라낼것@테스트으으으");
		rvo.setCookingTip("조리팁~~~~~");
		rvo.setCookingTag("#태그는 샵을 기준으로 잘라내 #테스트 #존맛");
		rvo.setUserid("admin");
		
		mapper.insertSelectKey(rvo);
		
		log.info(rvo);
	}

	public void testRead() {
		RecipeBoardVO recipe = mapper.read(1L);
		
		log.info(recipe);
	}

	public void testDelete() {
		log.info("삭제 결과 여부 : " + mapper.delete(6L)); // 성공시 1 반환
	}

	public void testUpdate() {
		RecipeBoardVO rvo = new RecipeBoardVO();
		rvo.setRecipenum(4L);
		rvo.setTitle("수정 테스트");
		rvo.setMaterial("재료 를 써주세요~~ 자세히 써줄수록 좋아요 ");
		rvo.setPersonnel(2);
		rvo.setCookingTime(20);
		rvo.setCookingLevel(3);
		rvo.setCookingOrder("조리순서는 특수문자 골뱅이를 기준으로 잘라낼것@테스트으으으");
		rvo.setCookingTip("조리팁~~~~~수정");
		rvo.setCookingTag("#태그는 샵을 기준으로 잘라내 #테스트 #존맛");
		
		int result = mapper.update(rvo);
		log.info("수정 결과 : " + result);
	}
	
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(2);
		List<RecipeBoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(recipe -> log.info(recipe));
	}

	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("123");
		cri.setType("C");
		
		List<RecipeBoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(recipe -> log.info(recipe));
	}

	@Test
	public void testUpdateLookCnt() {
		Long recipenum = 1L;
		mapper.recipeLookCntUp(recipenum);
	}
}
