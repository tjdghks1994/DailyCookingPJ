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
	
	@Test
	public void testCheck() {
		log.info("id체크 결과 : " + mapper.idCheck("admin"));
	}
	
	public void testInsertMember() {
		String sql = "insert into daily_member(userid,username,nickname,userpw,usermail) values"
				+ "(?,?,?,?,?)";
		
		for(int i=0; i<10; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "tester" + i);
				pstmt.setString(2, "테스터" + i);
				pstmt.setString(3, "비밀번호 암호화" + i);
				pstmt.setString(4, pwencoder.encode("1111"));
				pstmt.setString(5, "test"+i+"@naver.com");
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if(pstmt != null) {try {pstmt.close();} catch (Exception e) {}}
				if(con != null) {try {con.close();} catch (Exception e) {}}
				}
			}
		}
	}
