package com.spring.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int ordersDetailNum;
	private String orderId;
	private String p_code;
	private int cart_Stock;
}
