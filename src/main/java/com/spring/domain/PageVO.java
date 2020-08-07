package com.spring.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageVO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	private Criteria cri;
	
	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// 끝나는 페이지 계산
		endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		// 시작 페이지 계산
		startPage = this.endPage - 9;
		
		// 끝나는 페이지가 10개가 안될 수도 있기 때문에
		// 실제로 끝나는 페이지 구하기
		int realEnd = (int)(Math.ceil((total/1.0) / cri.getAmount()));
		
		if (realEnd < this.endPage) {
			endPage = realEnd;
		}
		
		this.prev = startPage > 1;
		this.next = endPage < realEnd;
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
