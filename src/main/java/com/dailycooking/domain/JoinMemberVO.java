package com.dailycooking.domain;

import java.util.Date;

import lombok.Data;

@Data
public class JoinMemberVO {

	private String userid;
	private String username;
	private String nickname;
	private String usermail;
	private Date regDate;
	private int suspension;
	private String auth;
}
