package com.dailycooking.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum; // 페이지 번호
	private int amount; // 1페이지당 보여줄 게시물 갯수
	
	private String type; // 검색 조건
	private String keyword; // 검색 키워드
	
	public Criteria() { // 기본 1페이지당 12개씩
		this(1,12);
	}
	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {//검색조건을 지정한 값이 있으면 split하여 문자열 배열 저장 
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getLinkList() {
		UriComponentsBuilder b = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", pageNum)
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		
		return b.toUriString();
	}

}
