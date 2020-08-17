package com.spring.domain;

import java.util.List;

import lombok.Data;

@Data
public class ManageKeySearchVO {
	private int pageNum;
	private int amount;
	private List<String> keywordList;
	
	public ManageKeySearchVO(int pageNum, int amount, List<String> keyList) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.keywordList = keyList;
	}
}
