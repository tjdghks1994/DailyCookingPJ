package com.dailycooking.service;

import com.dailycooking.domain.MemberVO;
import com.dailycooking.domain.QuestionVO;

public interface MemberRelationService {
	public int join(MemberVO mvo); // 회원가입
	public MemberVO idCheck(String userid); // 아이디 중복 체크 - ajax 처리할것
	public String idSearch(MemberVO mvo); // 아이디 찾기
	public MemberVO pwSearch(MemberVO mvo); // 비밀번호 찾기
	public int pwChange(MemberVO mvo); // 비밀번호 변경
	public int questionReg(QuestionVO qvo); // 건의/문의 사항 등록
	
	public MemberVO readInfo(String userid); // 회원 모든 정보 가져오기
	public int infoChange(MemberVO mvo); // 회원 정보 변경
}
