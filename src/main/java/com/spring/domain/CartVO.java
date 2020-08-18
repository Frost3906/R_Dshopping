package com.spring.domain;

import java.util.Date;

import lombok.Data;


@Data
public class CartVO {
	private int cartNum;
	private String username;
	private int p_code;
	private int cart_Stock;
	private Date addDate;
}
