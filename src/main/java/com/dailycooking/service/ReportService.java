package com.dailycooking.service;

import java.util.List;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinReportVO;
import com.dailycooking.domain.ReportVO;

public interface ReportService {

	public int report(Long recipenum, String reporter); // 게시글 신고
	
	public List<JoinReportVO> getReportList(Criteria cri); // 신고된 게시글 전체 목록
	
	public int getReportCount(); // 신고된 게시물 전체 수
	
	public int removeReport(Long recipenum); // 신고 테이블에서 삭제 처리
}
