package com.spring.domain;

import lombok.Data;

@Data
public class ManageVO {
	private int pageNum;
	private int amount;
	private String manageKeyword;
	private int p_code;
	
	public ManageVO(String pageNum, String amount, String manageKeyword, String p_code) {
		this.pageNum = Integer.parseInt(pageNum);
		this.amount = Integer.parseInt(amount);
		this.manageKeyword = manageKeyword;
		this.p_code = Integer.parseInt(p_code);
	}
	
	public ManageVO(String pageNum, String amount, String manageKeyword) {
		this.pageNum = Integer.parseInt(pageNum);
		this.amount = Integer.parseInt(amount);
		this.manageKeyword = manageKeyword;
	}
	
	public ManageVO() {
		
	}
}
