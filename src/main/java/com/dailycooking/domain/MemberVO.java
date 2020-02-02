package com.dailycooking.domain;

import java.util.Date;
import java.util.List;

public class MemberVO {
	private String userid; // 사용자 아이디
	private String username; // 사용자 이름
	private String nickname; // 사용자 닉네임
	private String usermail; // 사용자 이메일
	private String userpw; // 사용자 비밀번호
	
	private Date regDate; // 사용자 가입 날짜
	private int suspension; // 사용자 정지 여부 0 은 사용 가능한 상태 1 은 정지된 상태
	private List<AuthVO> authList; // 사용자 권한 리스트
}
