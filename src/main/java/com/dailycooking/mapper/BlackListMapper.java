package com.dailycooking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dailycooking.domain.BlackListVO;
import com.dailycooking.domain.Criteria;

public interface BlackListMapper {

	public int susMember(@Param("userid") String userid, @Param("reason") String reason); // 회원 정지 시키기
	
	public int susUpdate(String userid); // 정지 된 아이디 회원테이블 값 수정
	
	public BlackListVO readMember(String userid); // 정지된 회원의 정보 가져오기
	
	public List<BlackListVO> readAll(Criteria cri); // 정지된 모든 회원 목록 
	
	public int getTotal(); // 정지된 회원 수 
	
	public int susFreeze(String userid); // 정지 해제
	
	public int susDelete(String userid); // 정지 테이블에서 정지 해제 된 유저 정보 삭제
}
