package com.dailycooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.QuestionVO;
import com.dailycooking.mapper.QuestionMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QuestionServiceImpl implements QuestionService{

	@Setter(onMethod_ = @Autowired)
	private QuestionMapper mapper;
	
	public List<QuestionVO> getMemberQuestionList(String userid, Criteria cri){
		log.info("getMemberQuestionList... : " + userid + " - " + cri);
		return mapper.getMemberQuestionList(userid, cri.getPageNum(), cri.getAmount());
	}

	@Override
	public int getTotalCountQuestion(String userid) {
		log.info("getTotalQuestionCount...." + userid);
		return mapper.getTotalCountQuestion(userid);
	}
}
