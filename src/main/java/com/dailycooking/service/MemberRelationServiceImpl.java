package com.dailycooking.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dailycooking.domain.MemberVO;
import com.dailycooking.mapper.MemberRelationMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberRelationServiceImpl implements MemberRelationService {

	@Setter(onMethod_ = @Autowired)
	private MemberRelationMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder bcrypt; // 암호화 처리를 위한
	
	@Override
	@Transactional
	public int join(MemberVO mvo) { // 회원가입
		
		String password = mvo.getUserpw(); // 사용자 패스워드 암호화 전 
		String encodePassword = bcrypt.encode(password); // 사용자 패스워드 암호화 처리 
		mvo.setUserpw(encodePassword); // 암호화 처리한 패스워드를 mvo에 저장
		 
		mapper.join(mvo); // 회원 테이블에 먼저 데이터 넣기 - 회원가입 완료
		
		return mapper.insertAuth(mvo.getUserid()); // 회원가입한 아이디에 권한 부여 - 성공시 1 return
	}

	@Override
	public MemberVO idCheck(String userid) { // 아이디 중복체크 
		// TODO Auto-generated method stub
		log.info("중복 체크 할 아이디 : " + userid);
		MemberVO memberVO = mapper.idCheck(userid);
		log.info("memberVO : " + memberVO);
		return memberVO;
	}
	
}
