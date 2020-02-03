package com.dailycooking.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.dailycooking.domain.MemberVO;
import com.dailycooking.mapper.MemberMapper;
import com.dailycooking.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		log.warn("UserName : " + username);
		
		MemberVO mvo = memberMapper.readInfo(username);
		
		log.warn(username+"의 정보들 : " + mvo);
		
		return mvo == null ? null : new CustomUser(mvo);
	}

}
