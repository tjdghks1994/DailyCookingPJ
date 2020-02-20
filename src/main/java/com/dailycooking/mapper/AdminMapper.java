package com.dailycooking.mapper;

import java.util.List;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinMemberVO;

public interface AdminMapper {
	
	public List<JoinMemberVO> memberList(Criteria cri); // 관리자를 제외한 모든 회원 목록
	public int getTotalCount(); // 관리자를 제외한 모든 회원의 수
}
