package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;	// 페이지 번호
	private int amount;		// 한페이당 보여줄 게시물 수
	
	private String type;	// 검색조건
	private String keyword;	// 검색어
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// type 값을 받아서 배열로 리턴
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
}
