package com.spring.domain;

import java.util.Date;

import lombok.Data;


@Data
public class CartVO {
	private int cartNum;
	private String email;
	private int p_code;
	private int cartStock;
	private Date addDate;
}
