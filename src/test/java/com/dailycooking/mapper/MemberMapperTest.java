package com.dailycooking.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dailycooking.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberMapperTest {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	public void testExist() {
		log.info(mapper);
	}
	
	@Test
	public void testRead() {
		MemberVO mvo = mapper.readInfo("admin");
		
		log.warn("mvo : " + mvo);
		
		mvo.getAuthList().forEach(authVO -> log.info("authVO : " + authVO));
	}
}
