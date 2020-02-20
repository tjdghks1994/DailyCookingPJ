package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.QuestionVO;

public interface QuestionService {

	public List<QuestionVO> getMemberQuestionList(String userid, Criteria cri); // 해당 유저의 전체 문의 목록
	
	public int getTotalCountQuestion(String userid); // 해당 유저의 전체 문의 목록 수
	
	public List<QuestionVO> getList(Criteria cri); // 전체 목록
	
	public int getTotal(); // 전체 수
	
	public int answerComplete(QuestionVO qvo); // 관리자 답변 완료
}
