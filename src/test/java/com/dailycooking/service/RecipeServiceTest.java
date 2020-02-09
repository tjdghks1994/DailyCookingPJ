package com.dailycooking.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dailycooking.domain.RecipeBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class RecipeServiceTest {

	@Setter(onMethod_ = @Autowired)
	private RecipeService service;

	public void testRegister() {
		RecipeBoardVO rvo = new RecipeBoardVO();
		rvo.setTitle("서비스 구현 등록 테스트");
		rvo.setMaterial("재료 를 써주세요~~ 자세히 써줄수록 좋아요 ");
		rvo.setPersonnel(1);
		rvo.setCookingTime(30);
		rvo.setCookingLevel(1);
		rvo.setCookingOrder("조리순서는 특수문자 골뱅이를 기준으로 잘라낼것@테스트으으으");
		rvo.setCookingTip("조리팁~~~~~");
		rvo.setCookingTag("#태그는 샵을 기준으로 잘라내 #테스트 #존맛");
		rvo.setUserid("cmme0914");
		
		service.register(rvo);
		
		log.info("생성된 게시물의 번호 : " + rvo.getRecipenum());
	}
	
	public void testGetList() {
		service.getList().forEach(recipe -> log.info(recipe));
	}

	public void testGetOne() {
		log.info(service.get(1L));
	}

	public void testDelete() {
		log.info("삭제 결과 : " + service.remove(8L));
	}

	public void testUpdate() {
		RecipeBoardVO rvo = new RecipeBoardVO();
		rvo.setRecipenum(12L);
		rvo.setTitle("서비스 수정 테스트");
		rvo.setMaterial("재료 를 써주세요~~ 자세히 써줄수록 좋아요 ");
		rvo.setPersonnel(2);
		rvo.setCookingTime(20);
		rvo.setCookingLevel(3);
		rvo.setCookingOrder("조리순서는 특수문자 골뱅이를 기준으로 잘라낼것@테스트으으으");
		rvo.setCookingTip("조리팁~~~~~수정되자");
		rvo.setCookingTag("#태그는 샵을 기준으로 잘라내 #테스트 #존맛");
		
		log.info("수정 결과 : " + service.modify(rvo));
	}
	
}
