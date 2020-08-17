package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberCriteria {
	private int pageNum; //페이지번호
	private int amount;  //한페이지당 보여줄 게시물 수
	
	private String type;     //검색조건
	private String keyword;  //검색어
	
	public MemberCriteria() {
		this(1,10);
	}
	public MemberCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// type 값을 받아서 배열로 리턴
	// type : T {"T"}, C, W, TC {"T","C"}, TW {"T","W"}, TCW {"T","C","W"}
//	public String[] getTypeArr() {
//		return type == null? new String[]{}:type.split("");
//	}
}
