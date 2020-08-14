package com.spring.domain;

import java.util.Date;

import lombok.Data;


@Data
public class CartListVO {
	private int cartNum;
	private String email;
	private int p_code;
	private int cart_Stock;
	private Date addDate;
	private String image;
	
	private int num;
	private String p_name;
	private int p_price;
	private String p_img;
}
