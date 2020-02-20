package com.dailycooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinReportVO;
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

	@Override
	public List<JoinReportVO> getReportList(Criteria cri) {
		log.info("게시글 신고 목록 서비스 : " + cri);
		return mapper.getList(cri);
	}

	@Override
	public int getReportCount() {
		log.info("게시글 신고 전체 수 ");
		return mapper.getTotalCount();
	}

	@Override
	public int removeReport(Long recipenum) {
		log.info("신고 삭제 처리시 테이블에서 삭제");
		return mapper.deleteReport(recipenum);
	}

	
}
