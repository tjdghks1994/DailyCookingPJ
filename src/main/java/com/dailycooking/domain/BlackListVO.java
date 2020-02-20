package com.dailycooking.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BlackListVO {

	private String userid; // 회원 아이디 
	private Date suspensionDate; // 정지 시킨 날짜 
	private String reason; // 정지 이유
}
