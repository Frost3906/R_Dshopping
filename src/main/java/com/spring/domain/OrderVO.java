package com.spring.domain;

import java.util.Date;

import lombok.Data;


@Data
public class OrderVO {

	
	private String orderId;
	private String username;
	private String streetaddress;
	private String detailaddress;
	private String city;
	private String zipcode;
	private String customid;
	private String phonenum;
	private int total;
	private Date orderDate;
	
	
}
