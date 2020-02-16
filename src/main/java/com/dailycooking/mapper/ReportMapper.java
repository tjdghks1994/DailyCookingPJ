package com.dailycooking.mapper;

import org.apache.ibatis.annotations.Param;

public interface ReportMapper {

	public int report(@Param("recipenum") Long recipenum,@Param("reporter") String reporter); // 신고하기
}
