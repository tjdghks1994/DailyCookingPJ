package com.dailycooking.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class RecipeReplyMapperTest {

	@Setter(onMethod_ = @Autowired)
	private RecipeReplyMapper mapper;
	
	public void testMapper() {
		log.info(mapper);
	}
	
	public void testInsert() {
	
			RecipeReplyVO vo = new RecipeReplyVO();
			vo.setRecipenum(64L);
			vo.setReply("댓글 등록 테스트 - 매퍼 테스트2");
			vo.setUserid("admin");
			
			mapper.insert(vo);
	}

	public void testRead() {
		Long replynum = 2L;
		RecipeReplyVO vo = mapper.read(replynum);
		
		log.info(vo);
	}

	public void testDelete() {
		Long replynum = 1L;
		
		log.info("댓글 삭제 결과 : "+mapper.delete(replynum));
	}

	public void testUpdate() {
		Long replynum = 3L;
		
		RecipeReplyVO vo = mapper.read(replynum);
		vo.setReply("댓글 수정 테스트 - 매퍼2222");
		
		int result = mapper.update(vo);
		
		log.info("댓글 수정 결과 : " + result);
	}

	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		List<RecipeReplyVO> list = mapper.getListWithPaging(cri, 64L);
		
		list.forEach(reply -> log.info(reply));
	}
}
