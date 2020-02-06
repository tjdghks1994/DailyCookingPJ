package com.dailycooking.service;

import com.dailycooking.domain.MemberVO;

public interface MemberRelationService {
	public int join(MemberVO mvo); // 회원가입
	public MemberVO idCheck(String userid); // 아이디 중복 체크 - ajax 처리할것
	public String idSearch(MemberVO mvo); // 아이디 찾기
	public MemberVO pwSearch(MemberVO mvo); // 비밀번호 찾기
	public int pwChange(MemberVO mvo); // 비밀번호 변경
}
