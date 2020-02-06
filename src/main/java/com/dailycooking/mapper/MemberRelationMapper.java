package com.dailycooking.mapper;

import com.dailycooking.domain.MemberVO;

public interface MemberRelationMapper {
	public int join(MemberVO mvo); // 사용자 회원 가입
	public int insertAuth(String userid); // 사용자 권한 설정
	public MemberVO idCheck(String userid); // 아이디 중복 체크
	public MemberVO idSearch(MemberVO mvo); // 아이디 찾기
}
