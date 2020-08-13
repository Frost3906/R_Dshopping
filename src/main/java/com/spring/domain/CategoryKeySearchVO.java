package com.spring.domain;

import java.util.List;

import lombok.Data;

@Data
public class CategoryKeySearchVO {
	private String category1;
	private String category2;
	private String category3;
	private List<String> keywordList;
	private int pageNum;
	private int amount;
	
	public CategoryKeySearchVO(ShopPageVO vo,String category1, String category2, String category3, List<String> keywordList) {
		this.pageNum = vo.getNowPage();
		this.amount = vo.getAmount();
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
		this.keywordList = keywordList;
	}
}
