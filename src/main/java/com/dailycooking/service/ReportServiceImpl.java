package com.dailycooking.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailycooking.mapper.ReportMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReportServiceImpl implements ReportService{

	@Setter(onMethod_ = @Autowired)
	private ReportMapper mapper;
	
	@Override
	public int report(Long recipenum, String reporter) {
		log.info("게시글 신고 하기 서비스 : " + recipenum + "- 신고자 : " + reporter);
		return mapper.report(recipenum, reporter);
	}

	
}
