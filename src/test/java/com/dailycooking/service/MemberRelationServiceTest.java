package com.dailycooking.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dailycooking.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberRelationServiceTest {

	@Setter(onMethod_ = @Autowired)
	private MemberRelationService service;

	public void test() {
		log.info(service);
	}

	public void testJoin() {
		
		MemberVO mvo = new MemberVO();
		mvo.setUserid("test02");
		mvo.setUsername("테스트 유저2");
		mvo.setNickname("테스트유저2");
		mvo.setUserpw("1111");
		mvo.setUsermail("test2@naver.com");
		
		log.info("join 결과 : " +service.join(mvo));
	}
	
	@Test
	public void testCheck() {
		String userid = "admin";
		log.info("아이디 체크 결과 : " + service.idCheck(userid));
	}
}
