package com.spring.domain;

import lombok.Data;

@Data
public class ProductVO {
	private int p_code;
	private String p_name;
	private int p_price;
	private int p_stock;
	private String p_context;
}
