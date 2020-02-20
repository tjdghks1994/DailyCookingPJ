package com.dailycooking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.QuestionVO;

public interface QuestionMapper {

	public int insertQuestion(QuestionVO qvo); // 문의/건의사항 등록
	// 해당 유저의 건의/문의 목록 가져오기
	public List<QuestionVO> getMemberQuestionList(@Param("userid") String userid,@Param("pageNum") int pageNum, @Param("amount") int amount);

	public int getTotalCountQuestion(String userid); // 해당 유저의 전체 문의 목록 수
	
	public List<QuestionVO> getQuestionList(Criteria cri); // 전체 문의/건의 사항 목록 
	
	public int getTotalCount(); // 전체 수
	
	public int updateQuestion(QuestionVO qvo); // 답변 완료
}
