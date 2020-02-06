package com.dailycooking.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
public class MemberRelationMapperTest {

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Setter(onMethod_ = @Autowired)
	private MemberRelationMapper mapper;
	
	public void join() {
		MemberVO mvo = new MemberVO();
		mvo.setUserid("admin");
		mvo.setUsername("관리자");
		mvo.setNickname("관리자");
		mvo.setUserpw(pwencoder.encode("1111"));
		mvo.setUsermail("admin@naver.com");
		
		mapper.join(mvo);
	}
	
	public void insertAuth() {
		mapper.insertAuth("admin");
		log.info("권한 설정 하기");
	}
	
	public void testCheck() {
		log.info("id체크 결과 : " + mapper.idCheck("admin"));
	}
	
	public void testIdSearch() {
		MemberVO mvo = new MemberVO();
		mvo.setUsername("양현아");
		mvo.setUsermail("cmme@naver.com");
		
		MemberVO searchVo = mapper.idSearch(mvo);
		
		log.info(searchVo);
		log.info("회원님의 아이디는 : " + searchVo.getUserid());
		
	}

	@Test
	public void testPwSearch() {
		MemberVO mvo = new MemberVO();
		mvo.setUserid("cmme0914");
		mvo.setUsername("양현아");
		mvo.setUsermail("cmme@naver.com");
		
		log.info("MemberVO : " + mapper.pwSearch(mvo));
	}
	
	}
