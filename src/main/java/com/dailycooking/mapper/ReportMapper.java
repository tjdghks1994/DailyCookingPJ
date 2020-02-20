package com.dailycooking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinReportVO;
import com.dailycooking.domain.ReportVO;

public interface ReportMapper {

	public int report(@Param("recipenum") Long recipenum,@Param("reporter") String reporter); // 신고하기
	
	public List<JoinReportVO> getList(Criteria cri); // 신고된 게시물 목록
	
	public int getTotalCount(); // 신고된 게시물 전체 수
	
	public int deleteReport(Long recipenum); // 게시물 삭제 처리시 신고 테이블에서도 삭제처리
}
