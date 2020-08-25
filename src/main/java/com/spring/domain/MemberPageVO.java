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
	private int nowPage;
	private int lastPage;
	private int amount;
	private int previousPage;
	private int nextPage;
	
	private MemberCriteria memberCri;  //pageNum, amount
	
	public MemberPageVO(MemberCriteria memberCri, int total) {
		this.memberCri = memberCri;
		this.total=total;
		this.nowPage=memberCri.getPageNum();
		this.amount=memberCri.getAmount();
		this.previousPage=((this.nowPage-1)/10)*10;
		this.nextPage = ((this.nowPage-1)/10)*10+11;
		this.lastPage = (int) Math.ceil(this.total/(double)(this.amount));
		
		//끝나는 페이지 계산
		this.endPage = (int)(Math.ceil(this.nowPage/10.0))*10;
		if(this.endPage > this.lastPage) {
			this.endPage = this.lastPage;
		}
		//시작 페이지 계산
		this.startPage = this.endPage-9;
		if(this.startPage < 1) {
			this.startPage = 1;
		}
		if(this.endPage%10!=0) {
			this.startPage = (this.endPage/10)*10+1;
		}
		
		//끝나는 페이지가 10개가 안될 수도 있기 때문에 
		//실제로 끝나는 페이지 구하기
		int realEnd = (int)(Math.ceil((this.total/1.0)/this.amount));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		} 
		this.prev=this.nowPage<=10;
//		this.next=this.nowPage > (this.lastPage/10)*10;
		this.next=this.nowPage < realEnd;
	}
}
