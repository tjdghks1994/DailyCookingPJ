package com.dailycooking.mapper;

import com.dailycooking.domain.MemberVO;

public interface MemberRelationMapper {
	public int join(MemberVO mvo); // 사용자 회원 가입
	public int insertAuth(String userid); // 사용자 권한 설정
}
