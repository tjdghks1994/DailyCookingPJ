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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberRelationMapperTest {

	@Setter(onMethod_ = @Autowired)
	private MemberRelationMapper mapper;
	
	public void join() {
		MemberVO mvo = new MemberVO();
		mvo.setUserid("test01");
		mvo.setUsername("테스트 유저");
		mvo.setNickname("테스트유저");
		mvo.setUserpw("1111");
		mvo.setUsermail("test@naver.com");
		
		mapper.join(mvo);
	}
	
	@Test
	public void insertAuth() {
		mapper.insertAuth("test01");
		log.info("권한 설정 하기");
	}
}
