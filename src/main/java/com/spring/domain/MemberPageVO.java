package com.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberPageVO {
	private int nowPage;
	private int lastPage;
	private int amount;
	private int previousPage;
	private int nextPage;
	private boolean prev;
	private boolean next;
	private int startPage;
	private int endPage;
	
	public MemberPageVO(int pageNum, int amount, int total) {
		this.nowPage = pageNum;
		this.amount = amount;
		this.previousPage = ((this.nowPage-1)/10)*10;
		this.nextPage = ((this.nowPage-1)/10)*10+11;
		this.lastPage = (int) Math.ceil(total/(double)(this.amount));
		this.prev = this.nowPage <= 10;
		this.next = this.nowPage > (this.lastPage/10)*10;
		this.endPage = (int) (Math.ceil((this.nowPage)/10.0))*10;
		if(this.endPage > this.lastPage) {
			this.endPage = this.lastPage;
		}
		this.startPage = this.endPage -9 ;
		if(this.startPage < 1) {
			this.startPage = 1;
		}
		if(this.endPage%10!=0) {
			this.startPage = (this.endPage/10)*10+1;
		}
	}
}
