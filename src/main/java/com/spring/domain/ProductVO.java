package com.spring.domain;

import lombok.Data;

@Data
public class ProductVO {
	private int p_code;
	private String p_name;
	private int p_price;
	private int p_stock;
	private int p_rating;
	private String p_content;
	private String p_category1;
	private String p_category2;
	private String p_category3;
	private String property;
	private String image;
	private String detailImage;
	private int rno;
}
