package com.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVO {
	private int nowPage;
	private int lastPage;
	private int amount;
	private int previousPage;
	private int nextPage;
	private boolean prev;
	private boolean next;
	private int startPage;
	private int endPage;
	
	public PageVO(String pageNum, String amount, int productAmt) {
		this.nowPage = Integer.parseInt(pageNum);
		this.amount = Integer.parseInt(amount);
		previousPage = ((nowPage-1)/10)*10;
		nextPage = ((nowPage-1)/10)*10+11;
		lastPage = (int) Math.ceil(productAmt/(double)(this.amount));
		this.prev = nowPage <= 10;
		this.next = nowPage > (lastPage/10)*10;
		endPage = (int) (Math.ceil((nowPage)/10.0))*10;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		startPage = endPage -9 ;
		if(startPage < 1) {
			startPage = 1;
		}
		if(endPage%10!=0) {
			startPage = (endPage/10)*10+1;
		}
	}
}
