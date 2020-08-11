package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
public class BoardPageVO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	private Criteria cri;
	
	public BoardPageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// 끝나는 페이지 계산
		endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		// 시작 페이지 계산
		startPage = this.endPage - 9;
		
		// 실제로 끝나는 페이지 구하기
		int realEnd = (int)(Math.ceil((total / 1.0) / cri.getAmount()));
		if (realEnd < this.endPage) {
			endPage = realEnd;
		}
		this.prev = startPage > 1;
		this.next = endPage < realEnd;
	}
	
}
