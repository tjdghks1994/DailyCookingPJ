package com.dailycooking.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionVO {

	private String userid; // 회원 아이디
	private String title; // 문의/건의 제목
	private String content; // 문의/건의 내용
	private Long questionNum; // 문의/건의 번호
	private Date questionDate; // 문의/건의 날짜
	private int status; // 문의/건의 답변 여부 - 0이면 답변 안됨 1이면 답변 완료
	private String answer; // 관리자 답변 내용
}
