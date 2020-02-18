package com.dailycooking.mapper;

import com.dailycooking.domain.AuthVO;
import com.dailycooking.domain.MemberVO;

public interface MemberMapper {
	public MemberVO readInfo(String userid); // userid의 모든정보 및 권한 결과 읽어오기
	public int infoChange(MemberVO mvo); // 회원 정보 변경
}
