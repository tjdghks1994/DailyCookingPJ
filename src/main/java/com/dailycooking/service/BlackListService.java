package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.BlackListVO;
import com.dailycooking.domain.Criteria;

public interface BlackListService {

	public int insertSus(String userid, String reason);
	
	public int updateSus(String userid);
	
	public BlackListVO readMember(String userid); // 정지된 회원 정보(정지날짜,정지이유) 가져오기
	
	public List<BlackListVO> readAll(Criteria cri); // 정지된 모든 회원 목록
	
	public int getTotal(); // 정지된 회원 수
	
	public int susFreeze(String userid); // 정지 해제
	
	public int susRemove(String userid); // 정지 해제 된 아이디 정지 테이블에서 삭제
}
