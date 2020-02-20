package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinMemberVO;

public interface AdminService {

	public List<JoinMemberVO> getMemberList(Criteria cri); // 관리자를 제외한 모든 유저 목록
	public int getTotalCount(); // 관리자를 제외한 모든 유저 수
}
