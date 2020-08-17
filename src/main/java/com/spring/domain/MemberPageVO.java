package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberPageVO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	
	private MemberCriteria memberCri;  //pageNum, amount
	
	public MemberPageVO(MemberCriteria memberCri, int total) {
		this.memberCri = memberCri;
		this.total=total;
		
		//끝나는 페이지 계산
		endPage = (int)(Math.ceil(memberCri.getPageNum()/10.0))*10;
		//시작 페이지 계산
		startPage = this.endPage-9;
		
		//끝나는 페이지가 10개가 안될 수도 있기 때문에 
		//실제로 끝나는 페이지 구하기
		int realEnd = (int)(Math.ceil((total/1.0) / memberCri.getAmount()));
		if(realEnd < this.endPage) {
			endPage = realEnd;
		} 
		this.prev = startPage > 1;
		this.next = endPage < realEnd;
	}
}
